local addonName, ns = ...
local tex
local function Print(...) print("|cFF33FF99"..addonName.."|r:", ...) end

local f = CreateFrame("Frame", "LayoutGuidesFrame", UIParent)
f:SetAllPoints()
f:Hide()

f:SetScript("OnEvent", function(self, event, addon)
	if addon ~= addonName then return end
	LibStub("tekKonfig-AboutPanel").new(nil, addonName)
	self:UnregisterEvent("ADDON_LOADED")
	self:SetScript("OnEvent", nil)
end)
f:RegisterEvent("ADDON_LOADED")

_G["SLASH_"..string.upper(addonName).."1"] = string.lower("/"..addonName)
SlashCmdList[string.upper(addonName)] = function()
	if not tex then
		tex = f:CreateTexture(nil, "OVERLAY")
		tex:SetTexture("Interface\\Addons\\"..addonName.."\\Texture.tga", false)
		tex:SetAllPoints()
	end
	if f:IsVisible() then 
		Print("Hiding guides. Use /layoutguides to show.")
		f:Hide() 
	else 
		Print("Showing guides. Use /layoutguides to hide.")
		f:Show() 
	end
end
