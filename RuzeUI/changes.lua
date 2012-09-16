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

-- TukuiPlayer anchor frame
panchor = CreateFrame("Frame", "PlayerAnchor", UIParent)
panchor:Height(1)
if T.lowversion then
	panchor:SetWidth(186)
else
	panchor:SetWidth(250)
end

-- Create frame for Classtimer buffs
local CtimerBuffs = CreateFrame("Frame", "ClasstimerBuffs", UIParent)
CtimerBuffs:Height(1)
if T.lowversion then
	CtimerBuffs:SetWidth(186)
else
	CtimerBuffs:SetWidth(250)
end
CtimerBuffs:Point( "BOTTOMLEFT", UIParent, "CENTER", -374, -285 )

-- Create frame for Classtimer debuffs
local CtimerDebuffs = CreateFrame("Frame", "ClasstimerDebuffs", UIParent)
CtimerDebuffs:Height(1)
if T.lowversion then
	CtimerDebuffs:SetWidth(186)
else
	CtimerDebuffs:SetWidth(250)
end
CtimerDebuffs:Point( "BOTTOMRIGHT", UIParent, "CENTER", 374, -285 )

-- Create frame for Filger buffs
local FilgerBuffs = CreateFrame("Frame", "FilgerPlayerBuffs", UIParent)
FilgerBuffs:Size(50, 50)
FilgerBuffs:Point( "BOTTOMLEFT", UIParent, "CENTER", -374, -284 )

-- Create frame for Filger cd
local FilgerCD = CreateFrame("Frame", "FilgerPlayerCD", UIParent)
FilgerCD:Size(50, 50)
FilgerCD:Point( "BOTTOMLEFT", UIParent, "CENTER", -374, -216 )

-- Create frame for Filger procs
local FilgerProcs = CreateFrame("Frame", "FilgerPlayerProcs", UIParent)
FilgerProcs:Size(50, 50)
FilgerProcs:Point( "BOTTOMRIGHT", UIParent, "CENTER", 374, -216 )

-- Create frame for Filger debuffs
local FilgerDebuffs = CreateFrame("Frame", "FilgerTargetDebuffs", UIParent)
FilgerDebuffs:Size(50, 50)
FilgerDebuffs:Point( "BOTTOMRIGHT", UIParent, "CENTER", 374, -284 )

-- Create frame for Filger pve debuffs
local FilgerPVEDebuffs = CreateFrame("Frame", "FilgerPVEDebuffs", UIParent)
FilgerPVEDebuffs:Size(50, 50)
-- FilgerPVEDebuffs:Point( "CENTER", UIParent, "CENTER", 0, -284 )

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
-- Functions
---------------------------------------------------------------
-- Anchor buff frame accordingly
T.ComboPointsBarUpdate = function(self, parent, points)
	local s = parent.shadow
	local b = parent.Buffs
		
	if T.myclass == "ROGUE" and C.unitframes.movecombobar then
		-- always show we this option enabled
		s:Point("TOPLEFT", -4, 12)
		b:Point("BOTTOMRIGHT", parent, "TOPRIGHT", 0, 13)
		self:Show()
	else
		if points > 0 then
			if s then
				s:Point("TOPLEFT", -4, 12)
			end
			if b then 
				b:ClearAllPoints() 
				b:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 0, 14)
			end
		else
			if s then
				s:Point("TOPLEFT", -4, 4)
			end
			if b then 
				b:ClearAllPoints() 
				b:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 0, 4)
			end
		end
	end
end

T.DruidBarDisplay = function(self, login)
	local eb = self.EclipseBar
	local m = self.WildMushroom
	local dm = self.DruidMana
	local shadow = self.shadow
	local buff = self.Buffs
	local bg = self.DruidManaBackground
	local flash = self.FlashInfo

	if login then
		dm:SetScript("OnUpdate", nil)
	end
	
	if dm and dm:IsShown() then
		shadow:Point("TOPLEFT", -4, 12)
		buff:Point("BOTTOMRIGHT", self, "TOPRIGHT", 0, 13)
		bg:SetAlpha(1)
	else
		flash:Show()
		shadow:Point("TOPLEFT", -4, 4)
		buff:Point("BOTTOMRIGHT", self, "TOPRIGHT", 0, 4)
		if bg then bg:SetAlpha(0) end
	end
		
	if (eb and eb:IsShown()) or (dm and dm:IsShown()) then
		if eb and eb:IsShown() then
			local txt = self.EclipseBar.Text
			txt:Show()
			flash:Hide()
		end
		shadow:Point("TOPLEFT", -4, 12)
		buff:Point("BOTTOMRIGHT", self, "TOPRIGHT", 0, 13)
		if bg then bg:SetAlpha(1) end
		
		-- mushroom
		if m and m:IsShown() then
			shadow:Point("TOPLEFT", -4, 21)
			buff:Point("BOTTOMRIGHT", self, "TOPRIGHT", 0, 22)
			m:ClearAllPoints()
			m:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 10)
		end
	else
		if eb then
			local txt = self.EclipseBar.Text
			txt:Hide()
		end
		flash:Show()
		shadow:Point("TOPLEFT", -4, 4)
		buff:Point("BOTTOMRIGHT", self, "TOPRIGHT", 0, 4)
		if bg then bg:SetAlpha(0) end
		
		-- mushroom
		if m and m:IsShown() then
			shadow:Point("TOPLEFT", -4, 12)
			buff:Point("BOTTOMRIGHT", self, "TOPRIGHT", 0, 13)
			m:ClearAllPoints()
			m:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 1)
		end
	end
end

T.UpdateMushroomVisibility = function(self)
	local p = self:GetParent()
	local eb = p.EclipseBar
	local dm = p.DruidMana
	local m = p.WildMushroom
	local shadow = p.shadow
	local buff = p.Buffs
	
	if (eb and eb:IsShown()) or (dm and dm:IsShown()) then
		shadow:Point("TOPLEFT", -4, 21)
		buff:Point("BOTTOMRIGHT", p, "TOPRIGHT", 0, 22)
		m:ClearAllPoints()
		m:Point("BOTTOMLEFT", p, "TOPLEFT", 0, 10)
	elseif m:IsShown() then
		shadow:Point("TOPLEFT", -4, 12)
		buff:Point("BOTTOMRIGHT", p, "TOPRIGHT", 0, 13)
		m:ClearAllPoints()
		m:Point("BOTTOMLEFT", p, "TOPLEFT", 0, 1)
	else
		shadow:Point("TOPLEFT", -4, 4)
		buff:Point("BOTTOMRIGHT", p, "TOPRIGHT", 0, 4)
	end
end

T.UpdatePlayerBuffheader = function(self)
	if not C["classtimer"].enable and not C["filger"].enable then return end
	if not C["classtimer"].anchor and not C["filger"].anchor then return end
	
	local numBuffs = self.visibleBuffs
	local perRow = self.numRow
	local s = self.size + 2
	local row = math.ceil((numBuffs / perRow))
	local y = s * row + 2
	local addition = s
	
	if numBuffs == 0 then addition = 0 end
	PlayerAnchor:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 2, y)
end
