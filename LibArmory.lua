--[[
Usage:
	local LibArmory = Apollo.GetPackage("Armory:LibArmory-1.0").tPackage
	local link = LibArmory.generatelink()
	-- Do whatever you want with the "link" variable
--]]


local MAJOR, MINOR = "Armory:LibArmory-1.0", 1
-- Get a reference to the package information if any
local APkg = Apollo.GetPackage(MAJOR)
-- If there was an older version loaded we need to see if this is newer
if APkg and (APkg.nVersion or 0) >= MINOR then
return -- no upgrade needed
end
-- Set a reference to the actual package or create an empty table
local LibArmory = APkg and APkg.tPackage or {}


local Website = "http://ws-armory.github.io"
local ClassNames = {
	[GameLib.CodeEnumClass.Warrior] 	= Apollo.GetString("ClassWarrior"),
	[GameLib.CodeEnumClass.Engineer]	= Apollo.GetString("ClassEngineer"),
	[GameLib.CodeEnumClass.Esper] 		= Apollo.GetString("ClassESPER"),
	[GameLib.CodeEnumClass.Medic] 		= Apollo.GetString("ClassMedic"),
	[GameLib.CodeEnumClass.Stalker] 	= Apollo.GetString("ClassStalker"),
	[GameLib.CodeEnumClass.Spellslinger]	= Apollo.GetString("ClassSpellslinger"),
}


-- https://gist.github.com/ignisdesign/4323051
local function urlencode(str)
   if (str) then
      str = string.gsub (str, "\n", "\r\n")
      str = string.gsub (str, "([^%w ])",
         function (c) return string.format ("%%%02X", string.byte(c)) end)
      str = string.gsub (str, " ", "+")
   end
   return str
end

function LibArmory.generatelink()
	local slotId
	local url
	local unit = GameLib.GetPlayerUnit()

	for key, item in ipairs(unit:GetEquippedItems()) do
		slotId = item:GetSlot()
		-- Do not export Tool, Key and Bag items
		if slotId ~= 6 and slotId ~= 9 and slotId < 17 then
			if url == nil or url == '' then
				url = Website .. "/?" .. slotId .. "=" .. item:GetItemId()
			else
				url = url .. "&" ..slotId .. "=" .. item:GetItemId()
			end
		end
	end

	local title = unit:GetName() .. " - " .. ClassNames[unit:GetClassId()] .. " [" .. unit:GetLevel() .. "]"
	url = url .. "&title=" .. urlencode(title)

	return url
end

function LibArmory:OnLoad() end


Apollo.RegisterPackage(LibArmory, MAJOR, MINOR, {})
