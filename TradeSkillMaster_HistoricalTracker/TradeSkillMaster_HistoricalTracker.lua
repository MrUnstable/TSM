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
--  realm Market Value (from TSM_AuctionDB's realmData table, however that table  --
--  got populated - AppData or a manual/GetAll/Full scan) and storing a rolling   --
--  time series in its own SavedVariables. From that series it computes a        --
--  simple auction-count-weighted average over a trailing window and writes it   --
--  back into TSM_AuctionDB's realmData[itemString].historical, so the normal    --
--  TSM tooltip code picks it up exactly as if the App had provided it.          --
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
	local value = info.marketValue or info.minBuyout
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

-- Auction-count-weighted average over the trailing HISTORY_WINDOW_DAYS.
-- Falls back to using the full stored series if nothing falls in that window
-- (e.g. right after install, before enough days have accumulated).
local function ComputeHistorical(series)
	if not series or #series == 0 then
		return nil
	end

	local windowCutoff = time() - (HISTORY_WINDOW_DAYS * 86400)
	local totalWeight, totalValue = 0, 0
	for _, sample in ipairs(series) do
		if sample[SAMPLE_TIME] >= windowCutoff then
			local w = sample[SAMPLE_WEIGHT] or 1
			totalWeight = totalWeight + w
			totalValue = totalValue + (sample[SAMPLE_VALUE] * w)
		end
	end

	if totalWeight == 0 then
		for _, sample in ipairs(series) do
			local w = sample[SAMPLE_WEIGHT] or 1
			totalWeight = totalWeight + w
			totalValue = totalValue + (sample[SAMPLE_VALUE] * w)
		end
	end

	if totalWeight == 0 then
		return nil
	end
	return floor((totalValue / totalWeight) + 0.5)
end

local function ProcessRealmItem(db, itemString, info)
	local historical = ComputeHistorical(db[itemString])
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
