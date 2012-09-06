local T, C, L, G = unpack(Tukui)

---------------------------------------------------------------
-- Tooltip
---------------------------------------------------------------
-- Remove border colouring
local function TooltipUpdateTooltip(self)
	local owner = self:GetOwner()
	if not owner then return end	
	local name = owner:GetName()
	
	self:SetBackdropBorderColor(unpack(C["media"].bordercolor))
	StatusBarBG:SetBackdropBorderColor(unpack(C["media"].bordercolor))
end

GameTooltip:HookScript( "OnUpdate", function( self, ... )
	TooltipUpdateTooltip( self )
end )

---------------------------------------------------------------
-- Panels
---------------------------------------------------------------
-- Fix up padding around screen
TukuiBar5:ClearAllPoints()
TukuiBar5:SetPoint("RIGHT", UIParent, "RIGHT", -20, -14)

-- Shift info boxes for padding purposes
TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 20)
TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -20, 20)

-- I want to hide some panels, because I don't like it
local panels = { TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical}
for _, panel in pairs(panels) do
	panel:Kill()
end

-- Move cube buttons to the bottom corners of the screen and hide them
TukuiCubeLeft:ClearAllPoints()
TukuiCubeLeft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT")
TukuiCubeLeft:SetAlpha(0)
TukuiCubeRight:ClearAllPoints()
TukuiCubeRight:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT")
TukuiCubeRight:SetAlpha(0)

-- Relocate horizontal lines
TukuiLineToABLeft:ClearAllPoints()
TukuiLineToABLeft:Point("LEFT", TukuiInfoLeft, "RIGHT", 1, 0)
TukuiLineToABLeft:Point("RIGHT", TukuiBar1, "LEFT", -1, -2)
TukuiLineToABRight:ClearAllPoints()
TukuiLineToABRight:Point("LEFT", TukuiBar1, "RIGHT", 1, -2)
TukuiLineToABRight:Point("RIGHT", TukuiInfoRight, "LEFT", -1, 0)

---------------------------------------------------------------
-- Unitframes
---------------------------------------------------------------
-- move the default position
local units = {
	"Player",
	"Target",
	"Focus",
	"TargetTarget",
	"Arena1",
	"Boss1",
}

for _, frame in pairs(units) do
	local t = "Tukui"
	local self = _G[t..frame]
	local unit = string.lower(frame)

	--if unit == "player" then		
		--self:ClearAllPoints()
		--self:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", 70, 8)
		
		--[[local buffs = CreateFrame("Frame", nil, self)
		buffs:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", 0, 4)
		buffs:SetHeight(26)
		buffs:SetWidth(252)
		buffs.size = 26
		buffs.num = 36
		buffs.numRow = 9
		buffs.spacing = 2
		buffs.initialAnchor = "TOPRIGHT"
		buffs["growth-y"] = "UP"
		buffs["growth-x"] = "LEFT"
		buffs.PostCreateIcon = T.PostCreateAura
		--buffs.PostUpdateIcon = T.PostUpdateAura
		--buffs.PostUpdate = T.UpdateTargetDebuffsHeader
		G.UnitFrames.Player.Buffs = buffs]]
	--end

	if unit == "focus" then		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", 70, 300)
	end

	if unit == "target" then		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", -70, 8)
	end

	if unit == "arena1" then		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", -70, 300)
	end

	if unit == "boss1" then		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", -70, 300)
	end
end


---------------------------------------------------------------
-- Actionbars
---------------------------------------------------------------
TukuiStance:ClearAllPoints()
TukuiStance:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -20 -36)

--StanceBarFrame:ClearAllPoints()
--StanceBarFrame:SetPoint("TOPLEFT", bar, "TOPLEFT", -11, 0)

---------------------------------------------------------------
-- Buffs
---------------------------------------------------------------
TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", UIParent, -184, -20)

TukuiAurasPlayerDebuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:SetPoint("BOTTOMRIGHT", TukuiMinimap, "BOTTOMLEFT", -20, 0)

---------------------------------------------------------------
-- Minimap
---------------------------------------------------------------
-- Move minimap for padding
TukuiMinimap:ClearAllPoints()
TukuiMinimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -20, -20)

---------------------------------------------------------------
-- Filger
---------------------------------------------------------------
-- Create frame for FilgerPlayerProccs
local PlayerProccs = CreateFrame("Frame", "FilgerPlayerProccs", UIParent)
PlayerProccs:Size(50, 50)
PlayerProccs:Point("BOTTOMRIGHT", TukuiPlayer, "TOPRIGHT", 0, 4)

---------------------------------------------------------------
-- Classbar
---------------------------------------------------------------
-- Check if classbar exists

local function CheckClassbar()
	--[[if( T.myclass == "WARLOCK" ) then
		local cb = G.UnitFrames.Player.WarlockSpecBars:IsVisible()
	elseif( T.myclass == "DRUID" ) then
		local cb = G.UnitFrames.Player.EclipseBar:IsVisible()
	elseif( T.myclass == "DEATHKNIGHT" ) then
		local cb = G.UnitFrames.Player.Runes:IsVisible()
	elseif( T.myclass == "SHAMAN" ) then
		local cb = G.UnitFrames.Player.TotemBar1:IsVisible()
	elseif( T.myclass == "PRIEST" ) then
		local cb = G.UnitFrames.Player.ShadowOrbsBar:IsVisible()
	elseif T.myclass == "MONK" then
		local cb = G.UnitFrames.Player.HarmonyBar:IsVisible()
		print("Classbar not as")
	elseif( T.myclass == "PALADIN" ) then
		local cb = G.UnitFrames.Player.HolyPower:IsVisible()
	elseif( T.myclass == "ROGUE" or "DRUID") then
		local cb = G.UnitFrames.Player.ComboPointsBar:IsVisible()
	elseif( T.myclass == "MAGE" ) then
		local cb = G.UnitFrames.Player.ArcaneChargeBar:IsVisible()
	else
		local cb = false
	end]]
	print("Classsasdbar not as")
	Classbar:SetBackdropColor(1,0,1)
	--return cb
	
	--[[if cb then
		print("Classbar active")
	else
		print("Classbar not active")
	end]]
end
local Classbar = CreateFrame("Frame", "Classbar", TukuiPlayer)
Classbar:Size(50, 50)
Classbar:Point("CENTER", UIParent, "CENTER", 0, 0)
Classbar:SetTemplate()
Classbar:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
Classbar:RegisterEvent("PLAYER_ENTERING_WORLD")
Classbar:SetScript("OnEvent", CheckClassbar)
Classbar:SetScript("OnEvent", function()
	local cb
	if( T.myclass == "WARLOCK" ) then
		cb = G.UnitFrames.Player.WarlockSpecBars:IsVisible()
	elseif( T.myclass == "DRUID" ) then
		cb = G.UnitFrames.Player.EclipseBar:IsVisible()
	elseif( T.myclass == "DEATHKNIGHT" ) then
		cb = G.UnitFrames.Player.Runes:IsVisible()
	elseif( T.myclass == "SHAMAN" ) then
		cb = G.UnitFrames.Player.TotemBar1:IsVisible()
	elseif( T.myclass == "PRIEST" ) then
		cb = G.UnitFrames.Player.ShadowOrbsBar:IsVisible()
	elseif T.myclass == "MONK" then
		cb = G.UnitFrames.Player.HarmonyBar:IsVisible()
		print("Monk ahoy")
	elseif( T.myclass == "PALADIN" ) then
		cb = G.UnitFrames.Player.HolyPower:IsVisible()
	elseif( T.myclass == "ROGUE" or "DRUID") then
		cb = G.UnitFrames.Player.ComboPointsBar:IsVisible()
	elseif( T.myclass == "MAGE" ) then
		cb = G.UnitFrames.Player.ArcaneChargeBar:IsVisible()
	else
		cb = false
	end
	
	if cb then
		print("Classbar active")
	else
		print("Classbar not active")
	end
end)
print("Testing")
