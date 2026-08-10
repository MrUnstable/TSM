-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_AppHelper                           --
--           http://www.curse.com/addons/wow/tradeskillmaster_apphelper           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- register this file with Ace Libraries
local TSM = select(2, ...)
TSM = LibStub("AceAddon-3.0"):NewAddon(TSM, "TSM_AppHelper")
TSMAPI.AppHelper = {}
local private = {data={}}


function TSM:OnInitialize()
	TSMAPI:NewModule(TSM)
end

function TSM.LoadData(tag, ...)
	private.data[tag] = private.data[tag] or {}
	tinsert(private.data[tag], {...})
end

function TSMAPI.AppHelper:FetchData(tag)
	local data = private.data[tag]
	private.data[tag] = nil
	return data
end

function TSMAPI.AppHelper:IsCurrentRealm(realm)
	return strlower(gsub(realm, "\226", "'")) == strlower(gsub(GetRealmName(), "\226", "'"))
end