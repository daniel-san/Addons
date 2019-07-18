--LoadAddOn("Blizzard_ArenaUI");

UIP=UnitIsPlayer;
UIC=UnitIsConnected;
RCC=RAID_CLASS_COLORS;
PFHB=PlayerFrameHealthBar; 
PFB=PlayerFrameBackground;
UC=UnitClasS;
UIP=UnitIsPlayer;
RCC=RAID_CLASS_COLORS;
UC=UnitClass;
TFNB=TargetFrameNameBackground;
FFNB=FocusFrameNameBackground;


function colour(sb,unit) 
    if UIP(unit) and UIC(unit) 
        and unit==sb.unit and UC(unit) then 
        _,cl=UC(unit);
        c=RAID_CLASS_COLORS[cl];
        sb:SetStatusBarColor(c.r,c.g,c.b);
        --PFHB:SetStatusBarColor(0,1,0); --Green player frame Health bar
        --PFHB:SetStatusBarColor(c.r,c.g,c.b); --Class color player frame Health bar
    end 
end

 function e(self,event,...)
    PFB:Hide(); -- hiding player frame name background
    TFNB:Hide(); -- hiding target frame name background
    FFNB:Hide(); -- hiding focus frame name background
    
    if UIP("target") then 
        c=RCC[select(2,UC("target"))];
        TFNB:SetVertexColor(c.r,c.g,c.b);
    end 
    if UIP("focus") then 
        c=RCC[select(2,UC("focus"))];
        FFNB:SetVertexColor(c.r,c.g,c.b);
    end 

    c=RCC[select(2,UC("player"))];
    PFHB:SetStatusBarColor(c.r,c.g,c.b); --Class color player frame Health bar

    --Adding a class color background to player frame
    --[[if PlayerFrame:IsShown() and not PlayerFrame.bg then
        c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
        bg=PlayerFrame:CreateTexture()
        bg:SetPoint("TOPLEFT",PlayerFrameBackground)
        bg:SetPoint("BOTTOMRIGHT",PlayerFrameBackground,0,22)
        bg:SetTexture(TargetFrameNameBackground:GetTexture())
        bg:SetVertexColor(c.r,c.g,c.b)
        PlayerFrame.bg=true
    end]]--

end

hooksecurefunc("UnitFrameHealthBar_Update", colour);
hooksecurefunc("HealthBar_OnValueChanged", 
               function(self) colour(self, self.unit) end);

f=CreateFrame("FRAME");
--f:RegisterEvent("PARTY_MEMBERS_CHANGED");
f:RegisterEvent("PLAYER_TARGET_CHANGED");
f:RegisterEvent("PLAYER_FOCUS_CHANGED");
f:RegisterEvent("UNIT_FACTION");
f:SetScript("OnEvent",e);

--Reduce the Scale of Objective frame
ObjectiveTrackerFrame:SetScale(0.85);

-- increase scale of player castbar frame
--CastingBarFrame:SetScale(1.1)

-- increase scale of player frame
--PlayerFrame:SetScale(1.1)

-- increase scale of target frame
--TargetFrame:SetScale(1.1)

-- Increasing player frame hp bar size
PlayerFrameHealthBar:ClearAllPoints(); 
PlayerFrameHealthBar:SetHeight(31);
PlayerFrameHealthBar:SetPoint("TOP", PlayerFrame, "RIGHT", -66, 27);
PlayerFrameHealthBar.SetPoint = function () end;
PlayerFrameHealthBar:SetFrameLevel(2)

-- Increasing target frame hp bar size
TargetFrameHealthBar:ClearAllPoints(); 
TargetFrameHealthBar:SetHeight(31);
TargetFrameHealthBar:SetPoint("TOP", TargetFrame, "CENTER", -52, 27);
TargetFrameHealthBar.SetPoint = function () end;

-- Increasing frame frame hp bar size
FocusFrameHealthBar:ClearAllPoints(); 
FocusFrameHealthBar:SetHeight(31);
FocusFrameHealthBar:SetPoint("TOP", FocusFrame, "CENTER", -52, 27);
FocusFrameHealthBar.SetPoint = function () end;

--Scaling trinkets in Sarena
--[[ArenaEnemyFrame1.CC:SetPoint("topright",25,-5);
ArenaEnemyFrame2.CC:SetPoint("topright",25,-5);
ArenaEnemyFrame3.CC:SetPoint("topright",25,-5);
ArenaEnemyFrame1.CC:SetScale(1.4);
ArenaEnemyFrame2.CC:SetScale(1.4);
ArenaEnemyFrame3.CC:SetScale(1.4);]]--

--Arena Frames Config
--[[ArenaPrepFrames:SetScale(1.7);
ArenaPrepFrame1:ClearAllPoints();
ArenaPrepFrame2:ClearAllPoints();
ArenaPrepFrame3:ClearAllPoints();

ArenaPrepFrame1:SetPoint("CENTER",UIParent,"CENTER",233,87);
ArenaPrepFrame2:SetPoint("CENTER",UIParent,"CENTER",233,37);
ArenaPrepFrame3:SetPoint("CENTER",UIParent,"CENTER",233,-13);


ArenaEnemyFrames:SetScale(1.7);
ArenaEnemyFrame1CastingBar:SetScale(1.3);
ArenaEnemyFrame2CastingBar:SetScale(1.3);
ArenaEnemyFrame3CastingBar:SetScale(1.3);

ArenaEnemyFrame1:ClearAllPoints();
ArenaEnemyFrame2:ClearAllPoints();
ArenaEnemyFrame3:ClearAllPoints();

ArenaEnemyFrame1:SetPoint("CENTER",UIParent,"CENTER",233,87)
ArenaEnemyFrame2:SetPoint("CENTER",UIParent,"CENTER",233,37)
ArenaEnemyFrame3:SetPoint("CENTER",UIParent,"CENTER",233,-13)

ArenaEnemyFrame1.SetPoint = function() end
ArenaEnemyFrame2.SetPoint = function() end
ArenaEnemyFrame3.SetPoint = function() end]]--


--tests - "auras"
--[[local frame = CreateFrame("FRAME")
frame:RegisterEvent("UNIT_AURA")

frame:SetScript("OnEvent", function(self, event, ...)
    local unitid = ... if unitid ~= "player" then return end

    if UnitBuff("player", "Ice Barrier") then
        SpellActivationOverlay_ShowOverlay(SpellActivationOverlayFrame, 11426, "TEXTURES\\SPELLACTIVATIONOVERLAYS\\GENERICTOP_01.BLP", "TOP", 1.2, 139, 65, 239, false, false)
    else
        SpellActivationOverlay_HideOverlays(SpellActivationOverlayFrame, 11426)
    end
end)]]--

--[[Backup coordinates
MultiBarBottomLeft:SetPoint("CENTER",2,85)
ActionButton1:SetPoint("CENTER",-230,44)
MultiBarBottomRight:SetPoint("CENTER",2,124)
]]--

--[[MainMenuBarLeftEndCap:Hide();MainMenuBarRightEndCap:Hide()
 
local b=ArtifactWatchBar b:UnregisterAllEvents() b:Hide() b.Show=b.Hide
local b=HonorWatchBar b:UnregisterAllEvents() b:Hide() b.Show=b.Hide
local b=ReputationWatchBar b:UnregisterAllEvents() b:Hide() b.Show=b.Hide

local s=1.2

MainMenuExpBar:Hide();
MainMenuBarMaxLevelBar:Hide();
ActionBarUpButton:Hide()
ActionBarDownButton:Hide();


MultiBarBottomLeft:ClearAllPoints()
MultiBarBottomLeft:SetPoint("CENTER",2,45)
MultiBarBottomLeft.SetPoint = function() end

ActionButton1:ClearAllPoints()
ActionButton1:SetPoint("CENTER",-230,4)
ActionButton1.SetPoint = function() end

MultiBarBottomRight:ClearAllPoints()
MultiBarBottomRight:SetPoint("CENTER",2,84)
MultiBarBottomRight.SetPoint = function() end


MultiBarBottomLeft:SetScale(s)
MultiBarBottomRight:SetScale(s)
MultiBarLeft:SetScale(1);
MultiBarRight:SetScale(1);

ActionButton1:SetScale(s);
ActionButton2:SetScale(s);
ActionButton3:SetScale(s);
ActionButton4:SetScale(s);
ActionButton5:SetScale(s);
ActionButton6:SetScale(s);
ActionButton7:SetScale(s);
ActionButton8:SetScale(s);
ActionButton9:SetScale(s);
ActionButton10:SetScale(s);
ActionButton11:SetScale(s);
ActionButton12:SetScale(s);

--

MainMenuBar:SetScale(1)
 

PetActionBarFrame:ClearAllPoints();
PetActionBarFrame:SetPoint("CENTER",-495,0)
--PetActionBarFrame:SetPoint("CENTER",35,0)
PetActionBarFrame.SetPoint = function() end

 
CharacterBag3Slot:Hide()
CharacterBag2Slot:Hide()
CharacterBag1Slot:Hide()
CharacterBag0Slot:Hide()
MainMenuBarBackpackButton:Hide()]]--

--[[MainMenuBarBackpackButton:ClearAllPoints()
MainMenuBarBackpackButton:SetPoint("CENTER",700, 30)

MainMenuBarPageNumber:Hide()
StanceButton1:SetScale(0.01)
StanceButton2:SetScale(0.01)
StanceButton3:SetScale(0.01)
StanceButton4:SetScale(0.01)
StanceButton5:SetScale(0.01)
StanceButton6:SetScale(0.01)

CharacterMicroButton:ClearAllPoints()
--CharacterMicroButton:SetPoint("CENTER",-128,15)
CharacterMicroButton:SetPoint("CENTER",445, 5)
CharacterMicroButton.SetPoint = function() end;]]--


--[[EJMicroButton:Hide()
CharacterMicroButton:Hide()
SpellbookMicroButton:Hide()
TalentMicroButton:Hide()
AchievementMicroButton:Hide()
QuestLogMicroButton:Hide()
GuildMicroButton:Hide()
MainMenuMicroButton:Hide()
StoreMicroButton:Hide()
LFDMicroButton:Hide()
CollectionsMicroButton:Hide()]]--
 
--for i=0,3 do _G["MainMenuBarTexture"..i]:Hide();end
--MainMenuBarArtFrameBackground:Hide();
--MainMenuBarArtFrame.LeftEndCap:Hide();
--MainMenuBarArtFrame.RightEndCap:Hide();