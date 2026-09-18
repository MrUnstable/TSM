-- ------------------------------------------------------------------------------ --
--                        TradeSkillMaster_HistoricalTracker                       --
--                                                                                 --
--  Why this exists:                                                              --
--  TSM_AuctionDB's "historical" price (used by the Historical Price tooltip      --
--  line) is only ever set from data provided by the TSM Desktop Application      --
--  (see TSM_AuctionDB/Modules/config.lua tooltip text). On this server, AppData  --
--  .lua is fetched from a 3rd-party endpoint (TauriTSMAppDataFetcher) whose      --
--  feed only contains {itemID, minBuyout, marketValue, numAuctions} - it never   --
--  includes a "historical" field, so that tooltip line can never populate.       --
--                                                                                --
--  This addon works around that by taking its own daily snapshot of each item's  --
--  realm Min Buyout (falling back to Market Value if no Min Buyout is available, --
--  from TSM_AuctionDB's realmData table, however that table got populated -      --
--  AppData or a manual/GetAll/Full scan) and storing a rolling                   --
--  time series in its own SavedVariables. From that series it computes a        --
--  MEDIAN over a trailing window (robust to the wash-trading / wall-posting /   --
--  lowball-dumping outliers common on a thin, manipulated economy - a simple    --
--  average would get dragged around by those), floors the result against a     --
--  multiple of the item's vendor sell price so it can never read as "worthless" --
--  because of a bad stretch, and writes it back into TSM_AuctionDB's            --
--  realmData[itemString].historical, so the normal TSM tooltip code picks it    --
--  up exactly as if the App had provided it.                                   --
-- ------------------------------------------------------------------------------ --

local ADDON_NAME = ...

-- ============================================================================
-- Config
-- ============================================================================

local MAX_SAMPLE_AGE_DAYS          = 90            -- discard snapshots older than this
local MAX_SAMPLES_PER_ITEM         = 70            -- hard cap on stored snapshots per item (60-day window + margin)
local MIN_SECONDS_BETWEEN_SAMPLES  = 20 * 60 * 60  -- ~20h - effectively "at most once per day"
local HISTORY_WINDOW_DAYS          = 60            -- TSM's own DBHistorical is a 60-day average of DBMarket
local STARTUP_DELAY_SECONDS        = 5             -- wait this long after PLAYER_LOGIN before running

-- Samples are stored as plain positional arrays {time, value, weight} rather
-- than keyed tables {t=,v=,n=} - roughly halves both the serialized
-- SavedVariables size and Lua's in-memory table overhead per sample (no
-- repeated key-name strings, and array-part tables are cheaper per-entry
-- than hash-part ones). These named indices keep call sites readable.
-- (weight/numAuctions is recorded for possible future use/diagnostics, but
-- the median in ComputeHistorical() below doesn't weight by it - weighting
-- by auction count is exactly what let a single wall-posted day dominate.)
local SAMPLE_TIME, SAMPLE_VALUE, SAMPLE_WEIGHT = 1, 2, 3

-- ============================================================================
-- SavedVariables
-- ============================================================================

TradeSkillMaster_HistoricalTrackerDB = TradeSkillMaster_HistoricalTrackerDB or {}

local function GetRealmSeriesDB()
	local realm = GetRealmName()
	TradeSkillMaster_HistoricalTrackerDB[realm] = TradeSkillMaster_HistoricalTrackerDB[realm] or {}
	return TradeSkillMaster_HistoricalTrackerDB[realm]
end

-- ============================================================================
-- Snapshotting
-- ============================================================================

-- Records at most one {time, value, weight} sample per item per ~day, and
-- prunes anything older than MAX_SAMPLE_AGE_DAYS or beyond MAX_SAMPLES_PER_ITEM.
-- db/now/cutoff are passed in from Run() so they're computed once per run,
-- not once per item.
local function RecordSnapshotItem(db, now, cutoff, itemString, info)
	local value = info.minBuyout or info.marketValue
	if not value or value <= 0 then
		return 0
	end

	local series = db[itemString]
	if not series then
		series = {}
		db[itemString] = series
	end

	local last = series[#series]
	if not last or (now - last[SAMPLE_TIME]) >= MIN_SECONDS_BETWEEN_SAMPLES then
		series[#series + 1] = { now, value, info.numAuctions or 1 }

		-- prune by age (series is time-ordered, so trim from the front)
		while series[1] and series[1][SAMPLE_TIME] < cutoff do
			tremove(series, 1)
		end
		-- prune by count
		while #series > MAX_SAMPLES_PER_ITEM do
			tremove(series, 1)
		end
		return 1
	end
	return 0
end

-- Removes entries for items that have dropped out of realmData entirely (item
-- removed/renamed, etc). Without this, an item's series only gets pruned when
-- RecordSnapshotItem visits it - if it's never visited again, its stale data
-- would otherwise sit in SavedVariables forever. Only drops an item once its
-- MOST RECENT sample is already older than the age cutoff, so an item that's
-- just temporarily missing from the AH (no current auctions) isn't punished.
local function SweepStaleItems(db, cutoff)
	local numRemoved = 0
	for itemString, series in pairs(db) do
		local last = series[#series]
		if not last or last[SAMPLE_TIME] < cutoff then
			db[itemString] = nil
			numRemoved = numRemoved + 1
		end
	end
	return numRemoved
end

-- ============================================================================
-- Computing + injecting "historical"
-- ============================================================================

-- Plain (unweighted) median of a list of copper values. Each day contributes
-- at most one snapshot (see RecordSnapshotItem), so treating each day as one
-- vote - rather than weighting by that day's auction count - is what makes
-- this robust: a day where someone wall-posts 50 inflated auctions, or dumps
-- a pile of lowballs, is still just ONE data point among the trailing window
-- and gets outvoted by the days around it instead of dragging an average.
-- Sorts `values` IN PLACE as a side effect - callers can reuse that sorted
-- order afterwards (see Percentile() below) instead of sorting twice.
local function Median(values)
	local n = #values
	if n == 0 then
		return nil
	end
	table.sort(values)
	local mid = ceil(n / 2)
	if n % 2 == 1 then
		return values[mid]
	end
	return floor(((values[mid] + values[mid + 1]) / 2) + 0.5)
end

-- Linear-interpolated percentile (p in [0,1]) over an ALREADY-SORTED array.
local function Percentile(sortedValues, p)
	local n = #sortedValues
	if n == 0 then
		return nil
	elseif n == 1 then
		return sortedValues[1]
	end
	local rank = p * (n - 1) + 1
	local lo = floor(rank)
	local frac = rank - lo
	local hi = min(lo + 1, n)
	return sortedValues[lo] + (sortedValues[hi] - sortedValues[lo]) * frac
end

-- Floor safeguard: even a median can get dragged below a sane price during a
-- long stretch of manipulation (e.g. sustained lowball dumping), so the
-- historical price is never allowed to read below:
--   - VENDOR_SELL_FLOOR_MULT x the item's vendor sell price, when it has one; or
--   - NO_VENDOR_FLOOR_PCT x this item's own trailing P75, when it doesn't
--     (most BoE gear, quest items, etc, where GetVendorPrice returns 0/nil).
-- NOTE on the no-vendor case: a floor of "X% of the median" would be a no-op
-- (X% of a number can never exceed that same number, so max(median, X% *
-- median) always just returns median) - it has to be anchored to something
-- OTHER than the value it's flooring. P75 works: a minority of lowball posts
-- can't move a 75th percentile at all (same reason the median resists them),
-- so it stays a meaningful, independent anchor even when the median itself
-- has been dragged down by a bad stretch.
local VENDOR_SELL_FLOOR_MULT = 1.10
local NO_VENDOR_FLOOR_PCT    = 0.30
local function ApplyFloor(itemString, historical, sortedValues)
	local vendorSell = TSMAPI.Item:GetVendorPrice(itemString) or 0
	local floorValue
	if vendorSell > 0 then
		floorValue = vendorSell * VENDOR_SELL_FLOOR_MULT
	else
		local p75 = Percentile(sortedValues, 0.75)
		floorValue = (p75 or historical) * NO_VENDOR_FLOOR_PCT
	end
	-- round-to-nearest rather than ceil(): ceil() can overshoot by a copper
	-- here (e.g. 100 * 1.10 isn't exactly 110 in floating point, so ceil()
	-- would round it up to 111) - irrelevant at the copper level either way,
	-- but round-to-nearest matches the rest of this file and avoids it.
	return max(historical, floor(floorValue + 0.5))
end

-- Median over the trailing HISTORY_WINDOW_DAYS, floored per ApplyFloor()
-- above. Falls back to using the full stored series if nothing falls in that
-- window (e.g. right after install, before enough days have accumulated).
local function ComputeHistorical(itemString, series)
	if not series or #series == 0 then
		return nil
	end

	local windowCutoff = time() - (HISTORY_WINDOW_DAYS * 86400)
	local values = {}
	for _, sample in ipairs(series) do
		if sample[SAMPLE_TIME] >= windowCutoff then
			values[#values + 1] = sample[SAMPLE_VALUE]
		end
	end

	if #values == 0 then
		for _, sample in ipairs(series) do
			values[#values + 1] = sample[SAMPLE_VALUE]
		end
	end

	local median = Median(values) -- sorts `values` in place
	if not median then
		return nil
	end
	return ApplyFloor(itemString, median, values)
end

local function ProcessRealmItem(db, itemString, info)
	local historical = ComputeHistorical(itemString, db[itemString])
	if historical then
		info.historical = historical
		return 1
	end
	return 0
end

-- ============================================================================
-- Main entry point
-- ============================================================================

local function Run(isManual)
	if not TSMAPI or not TSMAPI:HasModule("AuctionDB") then
		if isManual then
			print("|cff00ff00TSM_HistoricalTracker|r: TSM_AuctionDB isn't registered with TSM - is the TradeSkillMaster_AuctionDB addon enabled?")
		end
		return false
	end

	local db = GetRealmSeriesDB()
	local now = time()
	local cutoff = now - (MAX_SAMPLE_AGE_DAYS * 86400)

	local numItems, numRecorded, numInjected = 0, 0, 0
	local ok, err = pcall(function()
		TSMAPI:ModuleAPI("AuctionDB", "ForEachRealmItemData", function(itemString, info)
			numItems = numItems + 1
			numRecorded = numRecorded + RecordSnapshotItem(db, now, cutoff, itemString, info)
			numInjected = numInjected + ProcessRealmItem(db, itemString, info)
		end)
	end)

	local numSwept = SweepStaleItems(db, cutoff)

	if not ok then
		if isManual then
			print("|cff00ff00TSM_HistoricalTracker|r: failed to read TSM_AuctionDB realm data: "..tostring(err))
		end
		return false
	end

	if numItems == 0 then
		if isManual then
			print("|cff00ff00TSM_HistoricalTracker|r: TSM_AuctionDB has no realm data yet, so there's nothing to snapshot. Check /tsm debug view_log for AppData realm-match info, or run a scan.")
		end
		return false
	end

	if isManual then
		print(("|cff00ff00TSM_HistoricalTracker|r: realmData has %d item(s); recorded %d new snapshot(s); historical price set for %d item(s); swept %d stale item(s)."):format(numItems, numRecorded, numInjected, numSwept))
	end
	return true
end

local function SafeRun(isManual)
	local ok, err = pcall(Run, isManual)
	if not ok then
		print("|cff00ff00TSM_HistoricalTracker|r error: "..tostring(err))
	end
end

-- ============================================================================
-- Event / slash command hookup
-- ============================================================================

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
	-- Delay so TSM_AuctionDB's own OnEnable (which rebuilds realmData from
	-- AppData or the local Compress cache) has definitely already run.
	C_Timer.After(STARTUP_DELAY_SECONDS, function() SafeRun(false) end)
end)

SLASH_TSMHISTORICALTRACKER1 = "/tsmhist"
SlashCmdList["TSMHISTORICALTRACKER"] = function()
	SafeRun(true)
end
