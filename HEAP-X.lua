local library = loadstring(game:HttpGet("https://pastebin.com/raw/MptDzeiz", true))()

local Aimbot = library:CreateWindow('Main')
Aimbot:Section("--== AimLock ==--")

local e = Aimbot:Button("Custom Aimbot Key (A-Z)", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "HEAP X Aimbot!";
	Text = "Made by heap ";
})
        
  
 
_G.aimDebug = true --FOV Checker is still wonky - Keep this setting on or you can't have FOV checker on

--Stuff you can customize
local settings = {
	Binds = {
		Aimbot = "f",
		Hide = "=" --[=] by default but is not required
	},
	Aimbot = {
		FOV = 50, --The smaller the less space to lock on | 15 by default
		Closest = false, --Targets closest player, otherwise does closest to mouse | False by default
		HoldKey = true, --False by default
		TeamCheck = false --False by default
	},
	Color = {
		["CheckboxOff"] = Color3.fromRGB(255, 0, 0), --[255, 0, 0] by default (Red)
		["CheckboxOn"] = Color3.fromRGB(0, 255, 0), --[0, 255, 0] by default (Green)
		
		["Border"] = Color3.fromRGB(235, 115, 17), --[235, 115, 17] by default
		["Background"] = Color3.fromRGB(30, 30, 30), --[30, 30, 30] by default
		["Text"] = Color3.fromRGB(255, 255, 255) --[255, 255, 255] by default
	}
}

------------------------------
----Stuff you don't touch:----
------------------------------
local Aimbot_SG = Instance.new("ScreenGui")

local gPlayers = game:GetService("Players")
local gPlr = gPlayers.LocalPlayer
local plr = gPlr.Name
local gUIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local InputBegan, InputEnded, BindPressed, AimbotStepped

local gotstring = 1
local function getrandomstring()
	gotstring = gotstring+666
	local str = ""
	local randomstring = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "g", "k", "l", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?", "`", "$",
	"0","1","2","3","4","5","6","7","8","9", }
	local counting123 = 0
	for i, v in ipairs(randomstring) do
		counting123 = i
	end
	do
		math.randomseed(tick()+gotstring)
		for i = 3, math.random(1,100) do
			math.randomseed(i+tick()+gotstring)
			local oneortwo = math.random(1,2)
			if oneortwo == 2 then
				math.randomseed(i+tick()+gotstring)
				str = str..""..randomstring[math.random(1, counting123)]
			else
				math.randomseed(i+tick()+gotstring)
				str = str..""..string.upper(randomstring[math.random(1, counting123)])
			end
		end
	end
	return str
end

-----------------------------
--------Actual Stuff:--------
-----------------------------
local AimbotSG_Name = "$?8??4V32HTT?B?T17O9IA282??I6A"
local valid = nil

if (settings.Binds.Aimbot and settings.Binds.Hide) then
	valid = true
	for i,v in pairs(settings) do
		if (v == nil) then
			valid = false
			break
		end
	end
end

if (valid) then

if (game.CoreGui:FindFirstChild(AimbotSG_Name)) then
	warn("Attempted to open another aimbot GUI again!")
	return
end

--=========================================================--

local aimKey = settings.Binds.Aimbot:lower()
local hideKey = settings.Binds.Hide:lower()

-- Instances:
local Title_Frame = Instance.new("Frame")
local Title_Label = Instance.new("TextLabel")
local Exit_BTN = Instance.new("TextButton")
local Minimize_BTN = Instance.new("TextButton")
local Aimbot_Frame = Instance.new("Frame")
local HoldKey_CB = Instance.new("TextButton")
local TeamCheck_CB = Instance.new("TextButton")
local AimbotKey_TB = Instance.new("TextBox")
local AimbotKey_Label = Instance.new("TextLabel")
local HoldKey_Label = Instance.new("TextLabel")
local CyclePart_BTN = Instance.new("TextButton")
local Part_Label = Instance.new("TextLabel")
local TeamCheck_Label = Instance.new("TextLabel")
local Status_Label = Instance.new("TextLabel")

--Properties:
Aimbot_SG.Name = AimbotSG_Name
Aimbot_SG.Parent = game:WaitForChild("CoreGui")
Aimbot_SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Aimbot_SG.ResetOnSpawn = false

Title_Frame.Name = getrandomstring()
Title_Frame.Parent = Aimbot_SG
Title_Frame.BackgroundColor3 = settings.Color.Border
Title_Frame.BorderSizePixel = 0
Title_Frame.Position = UDim2.new(0.0216195825, 0, 0.254411727, 0)
Title_Frame.Size = UDim2.new(0, 225, 0, 25)
Title_Frame.Active = true
Title_Frame.Draggable = true

Title_Label.Name = getrandomstring()
Title_Label.Parent = Title_Frame
Title_Label.BackgroundColor3 = settings.Color.Border
Title_Label.BorderSizePixel = 0
Title_Label.Position = UDim2.new(-0.0266666673, 0, 0, 0)
Title_Label.Size = UDim2.new(0, 175, 0, 25)
Title_Label.Font = Enum.Font.SourceSans
Title_Label.Text = "           HEAPS UNIVERSAL AIMBOT"
Title_Label.TextColor3 = settings.Color.Text
Title_Label.TextScaled = true
Title_Label.TextSize = 14.000
Title_Label.TextWrapped = true

Exit_BTN.Name = getrandomstring()
Exit_BTN.Parent = Title_Frame
Exit_BTN.BackgroundColor3 = settings.Color.Border
Exit_BTN.BorderColor3 = Color3.fromRGB(27, 42, 53)
Exit_BTN.BorderSizePixel = 0
Exit_BTN.Position = UDim2.new(0.884444475, 0, 0, 0)
Exit_BTN.Size = UDim2.new(0, 25, 0, 25)
Exit_BTN.Font = Enum.Font.SourceSans
Exit_BTN.Text = "X"
Exit_BTN.TextColor3 = settings.Color.Text
Exit_BTN.TextScaled = true
Exit_BTN.TextSize = 14.000
Exit_BTN.TextWrapped = true

Minimize_BTN.Name = getrandomstring()
Minimize_BTN.Parent = Title_Frame
Minimize_BTN.BackgroundColor3 = settings.Color.Border
Minimize_BTN.BorderColor3 = Color3.fromRGB(27, 42, 53)
Minimize_BTN.BorderSizePixel = 0
Minimize_BTN.Position = UDim2.new(0.773333371, 0, 0, 0)
Minimize_BTN.Size = UDim2.new(0, 25, 0, 25)
Minimize_BTN.Font = Enum.Font.SourceSans
Minimize_BTN.Text = "-"
Minimize_BTN.TextColor3 = settings.Color.Text
Minimize_BTN.TextScaled = true
Minimize_BTN.TextSize = 14.000
Minimize_BTN.TextWrapped = true

Aimbot_Frame.Name = getrandomstring()
Aimbot_Frame.Parent = Title_Frame
Aimbot_Frame.BackgroundColor3 = settings.Color.Background
Aimbot_Frame.BorderSizePixel = 0
Aimbot_Frame.Position = UDim2.new(-0.0266666673, 0, 0.976347685, 0)
Aimbot_Frame.Size = UDim2.new(0, 230, 0, 216)

--[[
HoldKey_CB.Instance.Name = "lol"
HoldKey_CB.Instance.Parent = Aimbot_Frame
HoldKey_CB.Instance.BackgroundColor3 = settings.Color.CheckboxOff
HoldKey_CB.Instance.BorderColor3 = settings.Color.Border
HoldKey_CB.Instance.Position = UDim2.new(0.0400000066, 0, 0.474999994, 0)
HoldKey_CB.Instance.Size = UDim2.new(0, 25, 0, 25)
HoldKey_CB.Instance.Font = Enum.Font.SourceSans
HoldKey_CB.Instance.Text = ""
HoldKey_CB.Instance.TextColor3 = Color3.fromRGB(0, 0, 0)
HoldKey_CB.Instance.TextSize = 14.000
]]--
--
HoldKey_CB.Name = getrandomstring()
HoldKey_CB.Parent = Aimbot_Frame
HoldKey_CB.BackgroundColor3 = settings.Color.CheckboxOff
HoldKey_CB.BorderColor3 = settings.Color.Border
HoldKey_CB.Position = UDim2.new(0.0400000066, 0, 0.474999994, 0)
HoldKey_CB.Size = UDim2.new(0, 25, 0, 25)
HoldKey_CB.Font = Enum.Font.SourceSans
HoldKey_CB.Text = ""
HoldKey_CB.TextColor3 = Color3.fromRGB(0, 0, 0)
HoldKey_CB.TextSize = 14.000
--

TeamCheck_CB.Name = getrandomstring()
TeamCheck_CB.Parent = Aimbot_Frame
TeamCheck_CB.BackgroundColor3 = settings.Color.CheckboxOff
TeamCheck_CB.BorderColor3 = settings.Color.Border
TeamCheck_CB.Position = UDim2.new(0.0400000066, 0, 0.637500048, 0)
TeamCheck_CB.Size = UDim2.new(0, 25, 0, 25)
TeamCheck_CB.Font = Enum.Font.SourceSans
TeamCheck_CB.Text = ""
TeamCheck_CB.TextColor3 = Color3.fromRGB(0, 0, 0)
TeamCheck_CB.TextSize = 14.000

AimbotKey_TB.Name = getrandomstring()
AimbotKey_TB.Parent = Aimbot_Frame
AimbotKey_TB.BackgroundColor3 = settings.Color.Text
AimbotKey_TB.Position = UDim2.new(0.0400000066, 0, 0.0620370433, 0)
AimbotKey_TB.Size = UDim2.new(0, 25, 0, 25)
AimbotKey_TB.Font = Enum.Font.SourceSans
AimbotKey_TB.Text = aimKey
AimbotKey_TB.TextColor3 = Color3.fromRGB(0, 0, 0)
AimbotKey_TB.TextSize = 17.000

AimbotKey_Label.Name = getrandomstring()
AimbotKey_Label.Parent = Aimbot_Frame
AimbotKey_Label.BackgroundColor3 = settings.Color.Background
AimbotKey_Label.BorderSizePixel = 0
AimbotKey_Label.Position = UDim2.new(0.186666653, 0, 0.0620370433, 0)
AimbotKey_Label.Size = UDim2.new(0, 180, 0, 25)
AimbotKey_Label.Font = Enum.Font.SourceSans
AimbotKey_Label.Text = "Aimbot Key: "..aimKey
AimbotKey_Label.TextColor3 = settings.Color.Text
AimbotKey_Label.TextSize = 23.000
AimbotKey_Label.TextWrapped = true
AimbotKey_Label.TextXAlignment = Enum.TextXAlignment.Left

HoldKey_Label.Name = getrandomstring()
HoldKey_Label.Parent = Aimbot_Frame
HoldKey_Label.BackgroundColor3 = settings.Color.Background
HoldKey_Label.BorderSizePixel = 0
HoldKey_Label.Position = UDim2.new(0.186666653, 0, 0.474999994, 0)
HoldKey_Label.Size = UDim2.new(0, 180, 0, 25)
HoldKey_Label.Font = Enum.Font.SourceSans
HoldKey_Label.Text = "Hold Key"
HoldKey_Label.TextColor3 = settings.Color.Text
HoldKey_Label.TextSize = 23.000
HoldKey_Label.TextWrapped = true
HoldKey_Label.TextXAlignment = Enum.TextXAlignment.Left

CyclePart_BTN.Name = getrandomstring()
CyclePart_BTN.Parent = Aimbot_Frame
CyclePart_BTN.BackgroundColor3 = settings.Color.Background
CyclePart_BTN.BorderColor3 = settings.Color.Text
CyclePart_BTN.Position = UDim2.new(0.0400000066, 0, 0.213888898, 0)
CyclePart_BTN.Size = UDim2.new(0, 25, 0, 25)
CyclePart_BTN.Font = Enum.Font.SourceSans
CyclePart_BTN.Text = ""
CyclePart_BTN.TextColor3 = Color3.fromRGB(0, 0, 0)
CyclePart_BTN.TextSize = 14.000

Part_Label.Name = getrandomstring()
Part_Label.Parent = Aimbot_Frame
Part_Label.BackgroundColor3 = settings.Color.Background
Part_Label.BorderSizePixel = 0
Part_Label.Position = UDim2.new(0.186666653, 0, 0.213888928, 0)
Part_Label.Size = UDim2.new(0, 180, 0, 25)
Part_Label.Font = Enum.Font.SourceSans
Part_Label.Text = "Part: Head"
Part_Label.TextColor3 = settings.Color.Text
Part_Label.TextSize = 23.000
Part_Label.TextWrapped = true
Part_Label.TextXAlignment = Enum.TextXAlignment.Left

TeamCheck_Label.Name = getrandomstring()
TeamCheck_Label.Parent = Aimbot_Frame
TeamCheck_Label.BackgroundColor3 = settings.Color.Background
TeamCheck_Label.BorderSizePixel = 0
TeamCheck_Label.Position = UDim2.new(0.186666653, 0, 0.637499988, 0)
TeamCheck_Label.Size = UDim2.new(0, 180, 0, 25)
TeamCheck_Label.Font = Enum.Font.SourceSans
TeamCheck_Label.Text = "Team Check"
TeamCheck_Label.TextColor3 = settings.Color.Text
TeamCheck_Label.TextSize = 23.000
TeamCheck_Label.TextWrapped = true
TeamCheck_Label.TextXAlignment = Enum.TextXAlignment.Left

Status_Label.Name = getrandomstring()
Status_Label.Parent = Aimbot_Frame
Status_Label.BackgroundColor3 = settings.Color.Background
Status_Label.BorderSizePixel = 0
Status_Label.Position = UDim2.new(0.146666676, 0, 0.829166651, 0)
Status_Label.Size = UDim2.new(0, 158, 0, 25)
Status_Label.Font = Enum.Font.SourceSans
Status_Label.Text = "Aimbot: Disabled"
Status_Label.TextColor3 = settings.Color.Text
Status_Label.TextSize = 25.000

----------------------------------------
------------Events and stuff:-----------
----------------------------------------
local HoldKey = settings.Aimbot.HoldKey
local TeamCheck = settings.Aimbot.TeamCheck
local AimbotStarted = nil

if (HoldKey) then
	HoldKey_CB.BackgroundColor3 = settings.Color.CheckboxOn
end
if (TeamCheck) then
	TeamCheck_CB.BackgroundColor3 = settings.Color.CheckboxOn
end

function dispose()
	if (AimbotStepped) then
		AimbotStepped:Disconnect()
	end
	AimbotStarted = false
	Status_Label.Text = "Aimbot: Disabled"
end

function playerRoot(playerChar)
	if (playerChar) then --HRP/Torso: R6 | UpperTorso: R15
		local root = playerChar:FindFirstChild("HumanoidRootPart") or playerChar:FindFirstChild("Torso") or
			playerChar:FindFirstChild("UpperTorso")
		return root
	end
	return nil
end

function getfovxyz(p0, p1, deg)
	local x1, y1, z1 = p0:ToOrientation()
	local cf = CFrame.new(p0.p, p1.p)
	local x2, y2, z2 = cf:ToOrientation()
	local d = math.deg
	if (deg) then
		return Vector3.new(d(x1 - x2), d(y1 - y2), d(z1 - z2))
	else
		return Vector3.new((x1 - x2), (y1 - y2), (z1 - z2))
	end
end

function checkfov(part)
	local fov = getfovxyz(Camera.CFrame, part.CFrame)
	local angle = math.abs(fov.X) + math.abs(fov.Y)
	return angle
end

Exit_BTN.MouseButton1Click:Connect(function()
	dispose()
	--InputBegan:Disconnect()
	InputEnded:Disconnect()
	BindPressed:Disconnect()
	
	Aimbot_SG:Destroy()
end)

Minimize_BTN.MouseButton1Click:Connect(function()
	if (Aimbot_Frame.Visible) then
		Aimbot_Frame.Visible = false
	else
		Aimbot_Frame.Visible = true
	end
end)

local TargetPart = 1 --1 = Head | 2 = Root
local otherParts = {"Left Arm", "Right Arm", "Left Leg", "Right Leg"}
CyclePart_BTN.MouseButton1Click:Connect(function()
	if (TargetPart == 1) then
		TargetPart = 2
		Part_Label.Text = "Part: Root (Center)"
	elseif (TargetPart == 6) then
		TargetPart = 1
		Part_Label.Text = "Part: Head"
	else
		TargetPart = TargetPart + 1
		Part_Label.Text = "Part: "..otherParts[TargetPart - 2]
	end
end)

AimbotKey_TB:GetPropertyChangedSignal("Text"):Connect(function()
	local text = AimbotKey_TB.Text
	if (text ~= "") then
		local firstChar = text:sub(1,1):lower()
		aimKey = firstChar
		
		AimbotKey_TB.Text = firstChar
		AimbotKey_Label.Text = "Aimbot Key: "..aimKey
		AimbotKey_TB:ReleaseFocus()
	end
end)

HoldKey_CB.MouseButton1Click:Connect(function()
	if (HoldKey) then
		HoldKey_CB.BackgroundColor3 = settings.Color.CheckboxOff
		HoldKey = false
	else
		HoldKey_CB.BackgroundColor3 = settings.Color.CheckboxOn
		HoldKey = true
	end
end)

TeamCheck_CB.MouseButton1Click:Connect(function()
	if (TeamCheck) then
		TeamCheck_CB.BackgroundColor3 = settings.Color.CheckboxOff
		TeamCheck = false
	else
		TeamCheck_CB.BackgroundColor3 = settings.Color.CheckboxOn
		TeamCheck = true
	end
end)

-----

BindPressed = gPlr:GetMouse().KeyDown:Connect(function(key)
	local keyValue = key:byte()
	if (keyValue == aimKey:byte()) then
		if (AimbotStarted and not HoldKey) then
			dispose()
			return
		end
		---
		local mouse, playerTarget = gPlr:GetMouse(), nil
		if (settings.Aimbot.Closest) then
			local plrChar = gPlr.Character
			local plrRoot = playerRoot(plrChar)
			if (not plrChar or not playerRoot(plrChar)) then
				playerTarget = nil
				return
			end
			
			local nearDist = math.huge
			local nearest = nil
			for _,target in pairs(gPlayers:GetPlayers()) do
				if (target ~= gPlr and target.Character and playerRoot(target.Character)) then
					local charDist = target:DistanceFromCharacter(plrRoot.Position)
					if (charDist < nearDist) then
						nearDist = charDist
						nearest = target
					end
				end
			end
			playerTarget = nearest
		else
			if not (_G.aimDebug) then --If off, then defaults to closest player
			--
			local pos = mouse.Hit.p
			local targetPos = Vector3.new(pos.X, pos.Y, pos.Z)
			
			local nearDist = math.huge
			local nearest = nil
			for _,target in pairs(gPlayers:GetPlayers()) do
				if (target ~= gPlr and target.Character and playerRoot(target.Character)) then
					local charDist = target:DistanceFromCharacter(targetPos)
					if (charDist < nearDist) then
						nearDist = charDist
						nearest = target
					end
				end
			end
			
			playerTarget = nearest
			--
			else --Experimental
			--
			local maxangle = math.rad(settings.Aimbot.FOV)
			local closestToMouse = nil
			for i,player in pairs(gPlayers:GetChildren()) do
				local pChar = player.Character
				if not (pChar) then return end
				
				local part = playerRoot(pChar) or pChar:FindFirstChild("Head")
				if (player.Name ~= plr and part) then
					local angle = checkfov(part)
					if (angle <= maxangle) then
						maxangle = angle
						closestToMouse = player
					end
                end
			end
			playerTarget = closestToMouse
			--
			end
		end
		if (playerTarget == nil) then return end
		AimbotStepped = game:GetService("RunService").RenderStepped:Connect(function()
			if (AimbotStarted and playerTarget and playerTarget.Character) then
				local part = nil
				
				--Check stuff
				if (TargetPart == 1) then --Head
					part = playerTarget.Character:FindFirstChild("Head")
				elseif (TargetPart == 2) then --Root
					part = playerRoot(playerTarget.Character)
				else
					part = playerTarget.Character:FindFirstChild(otherParts[TargetPart - 2])
				end
				
				--Actual stuff now
				if (part) then
					
					if (TeamCheck) then
						if (playerTarget.Team ~= gPlr.Team) then
							Camera.CoordinateFrame = CFrame.new(Camera.CoordinateFrame.p, part.CFrame.p)
						end
					else
						Camera.CoordinateFrame = CFrame.new(Camera.CoordinateFrame.p, part.CFrame.p)
					end
				end
			end
		end)
		---
		Status_Label.Text = "Aimbot: Enabled"
		AimbotStarted = true
	elseif (keyValue == hideKey:byte()) then
		if (Aimbot_Frame.Visible) then
			Aimbot_Frame.Visible = false
		else
			Aimbot_Frame.Visible = true
		end
	end
end)

InputEnded = gUIS.InputEnded:Connect(function(key)
	if (HoldKey and key.KeyCode.Value == aimKey:byte()) then
		dispose()
	end

       
      
        
        
        
        
        end)

print("Loaded JohnnyDoe's Aimbot GUI")

else
warn("Something in settings was invalid! Check your binds and color settings!")
end
end)


local e = Aimbot:Button("Ctrl Aimbot", function()

loadstring(game:HttpGet("https://pastebin.com/raw/uCSJY8we", true))()

wait(0.3)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "HEAP X!";
	Text = "Press Ctrl To Toggle Aimlock on and off. ";
})

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "HEAP X!";
	Text = "Press Q To Change Target Part And ALT For Esp";
})

end)



Aimbot:Section("--== Silent Aim ==--")

local e = Aimbot:Button("Silent Aim #1", function()
getgenv().SelectedPart = "Head"
getgenv().VisibiltyCheck = false
getgenv().TargetESP = false
getgenv().FOV = 250
getgenv().CircleVisibility = true
getgenv().Distance = 500
loadstring(game:HttpGet("https://raw.githubusercontent.com/yesok3877/Celestial-Silent-Aim/master/Auto-Input", true))()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "HEAP X !";
	Text = "This Silent Aim Is the best , Using more then 1 Silent aim may cause problems and lag";
})
end)


local e = Aimbot:Button("Silent Aim #2", function()

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "HEAP X !";
	Text = "Great Silent Aim But A Bit Laggy! , Using more then 1 Silent aim may cause problems and lag";
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringVbyQoVG4Dx0m", true))()

end)



local e = Aimbot:Button("Silent Aim #3", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "HEAP X !";
	Text = "This Is Decent, Using more then 1 silent aim may cause problems!";
})
local refreshrate = 0.01
 _G.toggled = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/venosu/kat/main/head.lua", true))()
end)


Aimbot:Section("--== Cool Thingy ==--")

local e = Aimbot:Button("Knife Aura", function()
--Subscribe to Ducky Exploits
function nearestPlayer()
    local dist = math.huge
    local ray
    
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Head") and not v.Character:FindFirstChild("ForceField") then
            if v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") then -- needed..
                local newVec = (v.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position)
                if newVec.magnitude < dist then
                    local toRay = Ray.new(game.Players.LocalPlayer.Character.Head.Position, newVec)
                    if not workspace:FindPartOnRayWithIgnoreList(toRay, {game.Players.LocalPlayer.Character, v.Character, workspace.WorldIgnore, workspace.CurrentCamera}) then
                        dist = newVec.magnitude
                        ray = toRay
                    end
                end
            end
        end
    end
    return ray
end

local ray

function init()
    local knife = game.Players.LocalPlayer.Character:WaitForChild("Knife")
    local scr = getsenv(knife.KnifeServer.KnifeClient)
    if scr then
        local ir = scr.inputReleased
        local u7 = debug.getupvalue(ir, 2)
        local cam = debug.getupvalue(ir, 5)
        debug.setupvalue(ir, 5, setmetatable({}, {
            __index = function(t,k)
                if k == "ScreenPointToRay" then
                    if ray ~= nil then
                        return function() return ray end
                    end
                end
                return cam[k]
            end
        }))
    
        
        while wait(.1) do
            if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                break    
            end
            ray = nearestPlayer()
            if ray then
                scr.inputDown()
                u7.ChargeStart = -math.huge
                ir()
            end
        end
    end
end

init()
game.Players.LocalPlayer.CharacterAdded:connect(function()
    print("hi")
    wait()
    init()
end)
end)

local ESP = library:CreateWindow('ESP')


ESP:Section("--== Visual ==--")


local t = ESP:Toggle('Toggleable ESP', {flag = "toggle1"}, function()
if toggle == false
then toggle = true
    
    
    
    

    
    
    shared.Visuals = { --// Configuration (Will load default settings if shared.Visuals doesn't exist.)
    Enabled = false,
    CrosshairEnabled = false,
    Boxes = false,
    Healthbar = false,
    Tracers = false,
    Info = false,
    ShowAllyTeam = false,
    UseTeamColor = false,
    AllyColor = Color3.fromRGB(0, 255, 0),
    EnemyColor = Color3.fromRGB(255, 0, 0),
    Crosshair = {
        Size = 5,
        Thickness = 1.5,
        Offset = 5
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/coastss/releases/main/universal_visuals.lua"))()
    else
        toggle = false
        
        	local NotificationBindable = Instance.new("BindableFunction")
	NotificationBindable.OnInvoke = callback
	--
	game.StarterGui:SetCore("SendNotification",  {
		Title = "HEAP X ESP";
		Text = "This is currently in beta , Please try not to turn off/on esp multiple times since it can cause problems";
		Icon = "";
		Duration = 10;
		Button1 = "OK";
		Callback = NotificationBindable;
	})
        
        shared.Visuals = { --// Configuration (Will load default settings if shared.Visuals doesn't exist.)
    Enabled = true,
    CrosshairEnabled = true,
    Boxes = true,
    Healthbar = true,
    Tracers = true,
    Info = true,
    ShowAllyTeam = true,
    UseTeamColor = true,
    AllyColor = Color3.fromRGB(0, 255, 0),
    EnemyColor = Color3.fromRGB(255, 0, 0),
    Crosshair = {
        Size = 5,
        Thickness = 1.5,
        Offset = 5
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/coastss/releases/main/universal_visuals.lua"))()
    
        end


end)


local e = ESP:Button("Helios ESP", function()
--Settings--
local ESP = {
    Enabled = true,
    Boxes = true,
    BoxShift = CFrame.new(0,-1.5,0),
	BoxSize = Vector3.new(4,6,0),
    Color = Color3.fromRGB(255, 170, 0),
    FaceCamera = false,
    Names = true,
    TeamColor = true,
    Thickness = 2,
    AttachShift = 1,
    TeamMates = true,
    Players = true,
    
    Objects = setmetatable({}, {__mode="kv"}),
    Overrides = {}
}

--Declarations--
local cam = workspace.CurrentCamera
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local V3new = Vector3.new
local WorldToViewportPoint = cam.WorldToViewportPoint

--Functions--
local function Draw(obj, props)
	local new = Drawing.new(obj)
	
	props = props or {}
	for i,v in pairs(props) do
		new[i] = v
	end
	return new
end

function ESP:GetTeam(p)
	local ov = self.Overrides.GetTeam
	if ov then
		return ov(p)
	end
	
	return p and p.Team
end

function ESP:IsTeamMate(p)
    local ov = self.Overrides.IsTeamMate
	if ov then
		return ov(p)
    end
    
    return self:GetTeam(p) == self:GetTeam(plr)
end

function ESP:GetColor(obj)
	local ov = self.Overrides.GetColor
	if ov then
		return ov(obj)
    end
    local p = self:GetPlrFromChar(obj)
	return p and self.TeamColor and p.Team and p.Team.TeamColor.Color or self.Color
end

function ESP:GetPlrFromChar(char)
	local ov = self.Overrides.GetPlrFromChar
	if ov then
		return ov(char)
	end
	
	return plrs:GetPlayerFromCharacter(char)
end

function ESP:Toggle(bool)
    self.Enabled = bool
    if not bool then
        for i,v in pairs(self.Objects) do
            if v.Type == "Box" then --fov circle etc
                if v.Temporary then
                    v:Remove()
                else
                    for i,v in pairs(v.Components) do
                        v.Visible = false
                    end
                end
            end
        end
    end
end

function ESP:GetBox(obj)
    return self.Objects[obj]
end

function ESP:AddObjectListener(parent, options)
    local function NewListener(c)
        if type(options.Type) == "string" and c:IsA(options.Type) or options.Type == nil then
            if type(options.Name) == "string" and c.Name == options.Name or options.Name == nil then
                if not options.Validator or options.Validator(c) then
                    local box = ESP:Add(c, {
                        PrimaryPart = type(options.PrimaryPart) == "string" and c:WaitForChild(options.PrimaryPart) or type(options.PrimaryPart) == "function" and options.PrimaryPart(c),
                        Color = type(options.Color) == "function" and options.Color(c) or options.Color,
                        ColorDynamic = options.ColorDynamic,
                        Name = type(options.CustomName) == "function" and options.CustomName(c) or options.CustomName,
                        IsEnabled = options.IsEnabled,
                        RenderInNil = options.RenderInNil
                    })
                    --TODO: add a better way of passing options
                    if options.OnAdded then
                        coroutine.wrap(options.OnAdded)(box)
                    end
                end
            end
        end
    end

    if options.Recursive then
        parent.DescendantAdded:Connect(NewListener)
        for i,v in pairs(parent:GetDescendants()) do
            coroutine.wrap(NewListener)(v)
        end
    else
        parent.ChildAdded:Connect(NewListener)
        for i,v in pairs(parent:GetChildren()) do
            coroutine.wrap(NewListener)(v)
        end
    end
end

local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
    ESP.Objects[self.Object] = nil
    for i,v in pairs(self.Components) do
        v.Visible = false
        v:Remove()
        self.Components[i] = nil
    end
end

function boxBase:Update()
    if not self.PrimaryPart then
        --warn("not supposed to print", self.Object)
        return self:Remove()
    end

    local color
    if ESP.Highlighted == self.Object then
       color = ESP.HighlightColor
    else
        color = self.Color or self.ColorDynamic and self:ColorDynamic() or ESP:GetColor(self.Object) or ESP.Color
    end

    local allow = true
    if ESP.Overrides.UpdateAllow and not ESP.Overrides.UpdateAllow(self) then
        allow = false
    end
    if self.Player and not ESP.TeamMates and ESP:IsTeamMate(self.Player) then
        allow = false
    end
    if self.Player and not ESP.Players then
        allow = false
    end
    if self.IsEnabled and (type(self.IsEnabled) == "string" and not ESP[self.IsEnabled] or type(self.IsEnabled) == "function" and not self:IsEnabled()) then
        allow = false
    end
    if not workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
        allow = false
    end

    if not allow then
        for i,v in pairs(self.Components) do
            v.Visible = false
        end
        return
    end

    if ESP.Highlighted == self.Object then
        color = ESP.HighlightColor
    end

    --calculations--
    local cf = self.PrimaryPart.CFrame
    if ESP.FaceCamera then
        cf = CFrame.new(cf.p, cam.CFrame.p)
    end
    local size = self.Size
    local locs = {
        TopLeft = cf * ESP.BoxShift * CFrame.new(size.X/2,size.Y/2,0),
        TopRight = cf * ESP.BoxShift * CFrame.new(-size.X/2,size.Y/2,0),
        BottomLeft = cf * ESP.BoxShift * CFrame.new(size.X/2,-size.Y/2,0),
        BottomRight = cf * ESP.BoxShift * CFrame.new(-size.X/2,-size.Y/2,0),
        TagPos = cf * ESP.BoxShift * CFrame.new(0,size.Y/2,0),
        Torso = cf * ESP.BoxShift
    }

    if ESP.Boxes then
        local TopLeft, Vis1 = WorldToViewportPoint(cam, locs.TopLeft.p)
        local TopRight, Vis2 = WorldToViewportPoint(cam, locs.TopRight.p)
        local BottomLeft, Vis3 = WorldToViewportPoint(cam, locs.BottomLeft.p)
        local BottomRight, Vis4 = WorldToViewportPoint(cam, locs.BottomRight.p)

        if self.Components.Quad then
            if Vis1 or Vis2 or Vis3 or Vis4 then
                self.Components.Quad.Visible = true
                self.Components.Quad.PointA = Vector2.new(TopRight.X, TopRight.Y)
                self.Components.Quad.PointB = Vector2.new(TopLeft.X, TopLeft.Y)
                self.Components.Quad.PointC = Vector2.new(BottomLeft.X, BottomLeft.Y)
                self.Components.Quad.PointD = Vector2.new(BottomRight.X, BottomRight.Y)
                self.Components.Quad.Color = color
            else
                self.Components.Quad.Visible = false
            end
        end
    else
        self.Components.Quad.Visible = false
    end

    if ESP.Names then
        local TagPos, Vis5 = WorldToViewportPoint(cam, locs.TagPos.p)
        
        if Vis5 then
            self.Components.Name.Visible = true
            self.Components.Name.Position = Vector2.new(TagPos.X, TagPos.Y)
            self.Components.Name.Text = self.Name
            self.Components.Name.Color = color
            
            self.Components.Distance.Visible = true
            self.Components.Distance.Position = Vector2.new(TagPos.X, TagPos.Y + 14)
            self.Components.Distance.Text = math.floor((cam.CFrame.p - cf.p).magnitude) .."m away"
            self.Components.Distance.Color = color
        else
            self.Components.Name.Visible = false
            self.Components.Distance.Visible = false
        end
    else
        self.Components.Name.Visible = false
        self.Components.Distance.Visible = false
    end
    
    if ESP.Tracers then
        local TorsoPos, Vis6 = WorldToViewportPoint(cam, locs.Torso.p)

        if Vis6 then
            self.Components.Tracer.Visible = true
            self.Components.Tracer.From = Vector2.new(TorsoPos.X, TorsoPos.Y)
            self.Components.Tracer.To = Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/ESP.AttachShift)
            self.Components.Tracer.Color = color
        else
            self.Components.Tracer.Visible = false
        end
    else
        self.Components.Tracer.Visible = false
    end
end

function ESP:Add(obj, options)
    if not obj.Parent and not options.RenderInNil then
        return warn(obj, "has no parent")
    end

    local box = setmetatable({
        Name = options.Name or obj.Name,
        Type = "Box",
        Color = options.Color --[[or self:GetColor(obj)]],
        Size = options.Size or self.BoxSize,
        Object = obj,
        Player = options.Player or plrs:GetPlayerFromCharacter(obj),
        PrimaryPart = options.PrimaryPart or obj.ClassName == "Model" and (obj.PrimaryPart or obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")) or obj:IsA("BasePart") and obj,
        Components = {},
        IsEnabled = options.IsEnabled,
        Temporary = options.Temporary,
        ColorDynamic = options.ColorDynamic,
        RenderInNil = options.RenderInNil
    }, boxBase)

    if self:GetBox(obj) then
        self:GetBox(obj):Remove()
    end

    box.Components["Quad"] = Draw("Quad", {
        Thickness = self.Thickness,
        Color = color,
        Transparency = 1,
        Filled = false,
        Visible = self.Enabled and self.Boxes
    })
    box.Components["Name"] = Draw("Text", {
		Text = box.Name,
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 19,
        Visible = self.Enabled and self.Names
	})
	box.Components["Distance"] = Draw("Text", {
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 19,
        Visible = self.Enabled and self.Names
	})
	
	box.Components["Tracer"] = Draw("Line", {
		Thickness = ESP.Thickness,
		Color = box.Color,
        Transparency = 1,
        Visible = self.Enabled and self.Tracers
    })
    self.Objects[obj] = box
    
    obj.AncestryChanged:Connect(function(_, parent)
        if parent == nil and ESP.AutoRemove ~= false then
            box:Remove()
        end
    end)
    obj:GetPropertyChangedSignal("Parent"):Connect(function()
        if obj.Parent == nil and ESP.AutoRemove ~= false then
            box:Remove()
        end
    end)

    local hum = obj:FindFirstChildOfClass("Humanoid")
	if hum then
        hum.Died:Connect(function()
            if ESP.AutoRemove ~= false then
                box:Remove()
            end
		end)
    end

    return box
end

local function CharAdded(char)
    local p = plrs:GetPlayerFromCharacter(char)
    if not char:FindFirstChild("HumanoidRootPart") then
        local ev
        ev = char.ChildAdded:Connect(function(c)
            if c.Name == "HumanoidRootPart" then
                ev:Disconnect()
                ESP:Add(char, {
                    Name = p.Name,
                    Player = p,
                    PrimaryPart = c
                })
            end
        end)
    else
        ESP:Add(char, {
            Name = p.Name,
            Player = p,
            PrimaryPart = char.HumanoidRootPart
        })
    end
end
local function PlayerAdded(p)
    p.CharacterAdded:Connect(CharAdded)
    if p.Character then
        coroutine.wrap(CharAdded)(p.Character)
    end
end
plrs.PlayerAdded:Connect(PlayerAdded)
for i,v in pairs(plrs:GetPlayers()) do
    if v ~= plr then
        PlayerAdded(v)
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    cam = workspace.CurrentCamera
    for i,v in (ESP.Enabled and pairs or ipairs)(ESP.Objects) do
        if v.Update then
            local s,e = pcall(v.Update, v)
            if not s then warn("[EU]", e, v.Object:GetFullName()) end
        end
    end
end)

return ESP
end)



local e = ESP:Button("ESP for trash exploits", function()
local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)

for i,v in pairs(game.Players:GetChildren()) do
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 1
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 1
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)
                    HealthBar.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        --- Our Team
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        ---Enemy Team
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1/HealthBar.Size.Y))
		    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)                    
		    HealthBar.Visible = true

                    if v.TeamColor == lplr.TeamColor then
                        --- Our Team
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        ---Enemy Team
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end)
end)

local e = ESP:Button("HEAP X UNNAMED ESP", function()
loadstring(game:HttpGet("https://pastebin.com/USQkjAcN", true))()

end)




local Misc = library:CreateWindow('Misc')


Misc:Section("--== GUIS ==--")

local e = Misc:Button("GUI #1", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/mememasterboi/a-lot-of-scripts/master/Output%20(6).lua'),true))()

end)


local e = Misc:Button("Cattori Hub", function()
_G.UITheme = "Jester" --Themes: Dark, Light, Jester, Mocha, Aqua
	_G.ToggleKeyBind = Enum.KeyCode.RightShift
	loadstring(game:HttpGet('https://cattori.xyz/main.lua'))()
end)


local e = Misc:Button("Owl Hub", function()
local old
old = hookfunction(game.HttpGetAsync, function(inst, url, state)
   url = url:gsub('CriShoux', 'SiLeNSwOrD')
   return old(inst, url, state)
end)

local old2
old2 = hookfunction(game.HttpGet, function(inst, url, state)
   url = url:gsub('CriShoux', 'SiLeNSwOrD')
   return old2(inst, url, state)
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/SiLeNSwOrD/OwlHub/master/OwlHub.txt"))();
end)

local e = Misc:Button("Exclusive Kiwi X GUI Leaked!", function()

loadstring(game:HttpGet("https://pastebin.com/raw/ENVgEuhk", true))()
end)

local e = Misc:Button("V.G Hub", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()

end)


Misc:Section("--== Cool Scripts ==--")



local e = Misc:Button("Kill All #1", function()

game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "HEAP X";
		Text = "DONT Equip the knife before pressing!";
	})
loadstring(game:HttpGet("https://pastebin.com/raw/KW6eTT8N", true))()

end)


local e = Misc:Button("Kill All #2", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Straden/Scripts/main/kat.lua"))()

end)



local e = Misc:Button("Knife Spam  ", function()
local NotificationBindable = Instance.new("BindableFunction")
	NotificationBindable.OnInvoke = callback
	--
	game.StarterGui:SetCore("SendNotification",  {
		Title = "HEAP X";
		Text = "Enable Knife Aura for better experince , also dont use knife power or it will lag and wont hit. ";
		Icon = "";
		Duration = math.huge;
		Button = "OK Thanks";
		Callback = NotificationBindable;
		
		})





loadstring(game:HttpGet("https://textbin.net/raw/gyp6olnryl", true))()



end)

local e = Misc:Button("Knife/Gun Mods", function()


local NotificationBindable = Instance.new("BindableFunction")
	NotificationBindable.OnInvoke = callback
	--
	game.StarterGui:SetCore("SendNotification",  {
		Title = "HEAP X";
		Text = "Made by heap";
		Icon = "";
		Duration = math.huge;
		Button2 = "OK";
		Callback = NotificationBindable;
		
		})

getgenv().FireRateWaitTime = 0.25
loadstring(game:HttpGet("https://textbin.net/raw/zlemyriiw4", true))()
end)


local e = Misc:Button("No Knife Trow Cooldown", function()



local NotificationBindable = Instance.new("BindableFunction")
	NotificationBindable.OnInvoke = callback
	--
	game.StarterGui:SetCore("SendNotification",  {
		Title = "HEAP X";
		Text = "Made by heap";
		Icon = "";
		Duration = math.huge;
		Button1 = "OK";
		Callback = NotificationBindable;
		
		})


local cons = {
    [10] = 0,
    [30] = 0.01
}

local KnifeClient = game.Players.LocalPlayer.Character:FindFirstChild('KnifeClient', true)

if KnifeClient then
    local KnifeClientS = getsenv(KnifeClient)
   
    table.foreach(cons, function(i,v)
        setconstant(KnifeClientS.inputReleased, i, v)
    end)
   
    local old = KnifeClientS.PlayAnimation
   
    KnifeClientS.PlayAnimation = newcclosure(function(...)
        local Args = {...}
       
        if (Args[1] == 'Grab' or Args[1] == 'Charge' or string.find(Args[1], 'Slash')) then
            Args[2] = 0.05
            return old(unpack(Args))
        end
       
        return old(...)
    end)
end

game.Players.LocalPlayer.Character.ChildAdded:Connect(function(Child)
    if Child.Name == 'Knife' then
        local Element = getsenv(Child:FindFirstChild('KnifeClient', true))
       
        table.foreach(cons, function(i,v)
            setconstant(Element.inputReleased, i, v)
        end)
       
        local old = Element.PlayAnimation
       
        Element.PlayAnimation = newcclosure(function(...)
            local Args = {...}
           
            if (Args[1] == 'Grab' or Args[1] == 'Charge' or string.find(Args[1], 'Slash')) then
                Args[2] = 0.05
                return old(unpack(Args))
            end
           
            return old(...)
        end)
    end
end)


end)

Misc:Section("--== Extra ==--")



local e = Misc:Button("Speed Boost", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/dMTadVqL", true))()

end)


local e = Misc:Button("Less Lag", function()
loadstring(game:HttpGet("https://pastebin.com/raw/gX9mR85X", true))()

end)

local e = Misc:Button("Remove Water", function()
for i,v in pairs(children) do
		v:Destroy()
	end


	local descendants = game:GetService("Workspace").WorldIgnore.Ignore:GetDescendants()

	for i,v in pairs(descendants) do
		if v.Name == "Water" then
			v:Destroy()

		end

		local Descendants = game:GetService("Workspace").WorldIgnore.MapEffects:GetDescendants()

		for i,v in pairs(Descendants) do
			if v.Name == "WaterPosition" then
				v:Destroy()

			end

		end
	end
end)


local e = Misc:Button("God Mode (Cant Kill)", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "HEAP X";
		Text = "You cant kill with godmode! Reset To Disable it";
	})
	
	local player = game.Players.LocalPlayer
	while true do
		wait()
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			game.Workspace[player.Character.Name].CollisionParts:Destroy()
		end
	end
end)




    local NotificationBindable = Instance.new("BindableFunction")
	NotificationBindable.OnInvoke = callback
	--
	game.StarterGui:SetCore("SendNotification",  {
		Title = "HEAP X UI";
		Text = "Press L To Toggle The UI!";
		Icon = "";
		Duration = math.huge;
		Button1 = "OK";
		Callback = NotificationBindable;
	})
    

