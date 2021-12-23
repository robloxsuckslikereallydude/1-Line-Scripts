--[[

Hats Required (Free)

https://www.roblox.com/catalog/62234425/Brown-Hair
https://www.roblox.com/catalog/63690008/Pal-Hair
https://www.roblox.com/catalog/62724852/Chestnut-Bun
https://www.roblox.com/catalog/451220849/Lavender-Updo
https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair
https://www.roblox.com/catalog/48474313/Red-Roblox-Cap
https://www.roblox.com/catalog/376527115/Jade-Necklace-with-Shell-Pendant

Controls:

F - Float
E - Vent
C - Sit
Q - Fake Dead



]]--








sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",1.0000000331814e+32)

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then--and v.Name ~="HumanoidRootPart" then 
game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(0,-25.05,0)
wait(0.5)
end)
end
end

local char = workspace[game.Players.LocalPlayer.Name]
char.Archivable = true

local fakechar = char:Clone()
fakechar.Name = 'clone'
fakechar.Parent = char
fakechar.Head.face.Transparency = 1
workspace.CurrentCamera.CameraSubject = fakechar
char.Torso.Anchored = true

local connections = {}

function create(part, parent, p, r)
part.AccessoryWeld:Remove()
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.AlignPosition.Attachment0 = part.Attachment
part.AlignOrientation.Attachment0 = part.Attachment
part.AlignPosition.Attachment1 = parent.Attachment
part.AlignOrientation.Attachment1 = parent.Attachment
part.Attachment.Position = p
part.Attachment.Orientation = r
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignOrientation.Responsiveness = 200
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 999999999
end

local hats = {
Torso = char:FindFirstChild('Hat1').Handle,
Torso1 = char:FindFirstChild('Robloxclassicred').Handle,
LeftArm = char:FindFirstChild('Pink Hair').Handle,
RightArm = char:FindFirstChild('Pal Hair').Handle,
LeftLeg = char:FindFirstChild('Kate Hair').Handle,
RightLeg = char:FindFirstChild('LavanderHair').Handle,
Glass = char:FindFirstChild('Necklace').Handle
}

function rmesh(HatName)
for _,mesh in next, workspace[game.Players.LocalPlayer.Name][HatName]:GetDescendants() do
if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
mesh:Remove()
end
end
end

table.insert(connections, game:GetService('RunService').Stepped:Connect(function()
fakechar.Torso.CanCollide = false
fakechar.Head.CanCollide = false
end))


create(hats.Torso, fakechar['Torso'], Vector3.new(.5,0,0), Vector3.new(90,0,0))
create(hats.Torso1, fakechar['Torso'], Vector3.new(-.5,0,0), Vector3.new(90,0,0))
create(hats.LeftArm, fakechar['Left Arm'], Vector3.new(), Vector3.new(90,0,0))
create(hats.RightArm, fakechar['Right Arm'], Vector3.new(), Vector3.new(90,0,0))
create(hats.LeftLeg, fakechar['Left Leg'], Vector3.new(), Vector3.new(90,0,0))
create(hats.RightLeg, fakechar['Right Leg'], Vector3.new(), Vector3.new(90,0,0))
create(hats.Glass, fakechar['Torso'], Vector3.new(.5,-.3,0), Vector3.new(0,90,0))

rmesh('Hat1')
rmesh('Robloxclassicred')
rmesh('Pink Hair')
rmesh('Pal Hair')
rmesh('Kate Hair')
rmesh('LavanderHair')
rmesh('Necklace')

local kill = false

for i,v in next, fakechar:GetDescendants() do
if v:IsA("BasePart") then
v.Transparency = 1
end
end

fakechar.Humanoid.Died:Connect(function()
   game.Players.LocalPlayer.Character = char
   char:BreakJoints()
   fakechar:Destroy()
kill = true

   for _,v in pairs(connections) do v:Disconnect() end
end)
char.Humanoid.Died:Connect(function()
   game.Players.LocalPlayer.Character = char
   char:BreakJoints()
   fakechar:Destroy()
kill = true

   for _,v in pairs(connections) do v:Disconnect() end
end)

game.Players.LocalPlayer.Character = fakechar

local Player=game.Players.LocalPlayer local Character=fakechar local hum = Character.Humanoid local LeftArm=Character["Left Arm"] local LeftLeg=Character["Left Leg"] local RightArm=Character["Right Arm"] local RightLeg=Character["Right Leg"] local Root=Character["HumanoidRootPart"] local Head=Character["Head"] local Torso=Character["Torso"] local Neck=Torso["Neck"] local mouse = Player:GetMouse() local position = nil local sine = 0 local t = 0 local change = 1

local HEADLERP = Instance.new("ManualWeld")
HEADLERP.Parent = Head
HEADLERP.Part0 = Head
HEADLERP.Part1 = Head
HEADLERP.C0 = CFrame.new(0, -1.5, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
 
local TORSOLERP = Instance.new("ManualWeld")
TORSOLERP.Parent = Root
TORSOLERP.Part0 = Torso
TORSOLERP.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
 
local ROOTLERP = Instance.new("ManualWeld")
ROOTLERP.Parent = Root
ROOTLERP.Part0 = Root
ROOTLERP.Part1 = Torso
ROOTLERP.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
 
local RIGHTARMLERP = Instance.new("ManualWeld")
RIGHTARMLERP.Parent = RightArm
RIGHTARMLERP.Part0 = RightArm
RIGHTARMLERP.Part1 = Torso
RIGHTARMLERP.C0 = CFrame.new(-1.5, 0, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
 
local LEFTARMLERP = Instance.new("ManualWeld")
LEFTARMLERP.Parent = LeftArm
LEFTARMLERP.Part0 = LeftArm
LEFTARMLERP.Part1 = Torso
LEFTARMLERP.C0 = CFrame.new(1.5, 0, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
 
local RIGHTLEGLERP = Instance.new("ManualWeld")
RIGHTLEGLERP.Parent = RightLeg
RIGHTLEGLERP.Part0 = RightLeg
RIGHTLEGLERP.Part1 = Torso
RIGHTLEGLERP.C0 = CFrame.new(-0.5, 2, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
 
local LEFTLEGLERP = Instance.new("ManualWeld")
LEFTLEGLERP.Parent = LeftLeg
LEFTLEGLERP.Part0 = LeftLeg
LEFTLEGLERP.Part1 = Torso
LEFTLEGLERP.C0 = CFrame.new(0.5, 2, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end

m = game.Players.LocalPlayer:GetMouse()

venttoggle = false
vented = false
mode2 = false
attack = false
modetoggle = false
dead = false
dtoggle = false
sittoggle = false
sit = false

m.Button1Down:connect(function()
if kill == false and mode2 == false and dead == false then
attack = true
vented = false
Character.Humanoid.WalkSpeed = 0
wait(0.5)
Character.Humanoid.WalkSpeed = 16
attack = false
end
end)

m.KeyDown:connect(function(k)
k=k:lower()
if k == 'e' then
if kill == false then
if venttoggle == false then
modetoggle = false
mode2 = false
venttoggle = true
vented = true
Character.Humanoid.WalkSpeed = 100
position = "ventidle"
elseif venttoggle == true then
venttoggle = false
vented = false
Character.Humanoid.WalkSpeed = 16
end
end
end
end)

m.KeyDown:connect(function(k)
k=k:lower()
if k == 'f' then
if kill == false then
if modetoggle == false then
venttoggle = false
vented = false
modetoggle = true
mode2 = true
sittoggle = false
sit = false
Character.Humanoid.WalkSpeed = 60
elseif modetoggle == true then
modetoggle = false
mode2 = false
Character.Humanoid.WalkSpeed = 16
end
end
end
end)

m.KeyDown:connect(function(k)
k=k:lower()
if k == 'q' then
if kill == false then
if dtoggle == false then
venttoggle = false
vented = false
modetoggle = false
mode2 = false
dtoggle = true
dead = true
sittoggle = false
sit = false
Character.Humanoid.WalkSpeed = 0
elseif dtoggle == true then
dtoggle = false
dead = false
Character.Humanoid.WalkSpeed = 16
end
end
end
end)

m.KeyDown:connect(function(k)
k=k:lower()
if k == 'c' then
if kill == false then
if sittoggle == false then
venttoggle = false
vented = false
modetoggle = false
mode2 = false
dtoggle = false
dead = false
sittoggle = true
sit = true
Character.Humanoid.WalkSpeed = 0
elseif sittoggle == true then
sittoggle = false
sit = false
Character.Humanoid.WalkSpeed = 16
end
end
end
end)

coroutine.wrap(function()--poses
while true do
if attack == true and vented == false and mode2 == false and dead == false and sit == false then
position = "attack"
elseif attack == false and vented == false and mode2 == false and dead == true and sit == false then
position = "dead"
elseif attack == false and vented == false and mode2 == false and dead == false and sit == true then
position = "sit"
end
wait()
end
end)()

--[[
coroutine.wrap(function() -------Checks
while true do
if attack == false and vented == false and mode2 == false and dead == false and sit == true then
position = "sit"
end
wait()
end
end)()


coroutine.wrap(function() -------Checks
while true do
if attack == false and vented == false and mode2 == false and dead == true and sit == false then
position = "dead"
end
wait()
end
end)()
]]

coroutine.wrap(function() -------Checks
while true do
if mode2 == true and vented == false and dead == false then
if Root.Velocity.Magnitude < 2 then
position = "idle2"
elseif Root.Velocity.Magnitude > 20 then
position = "walk2"
end
end
wait()
end
end)()

coroutine.wrap(function() -------Checks
while true do
if vented == false and mode2 == false and attack == false and dead == false then
if Root.Velocity.y > 1 then
position = "jump"
elseif Root.Velocity.y < -1 then
position = "fall"
elseif Root.Velocity.Magnitude < 2 then
position = "idle"
elseif Root.Velocity.Magnitude < 20 then
position = "walk"
elseif Root.Velocity.Magnitude > 20 then
position = "run"
end
end
wait()
end
end)()

coroutine.wrap(function()
while true do
sine = sine + change
if position == "idle" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0.3 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine/12)), math.rad(20 + 0 * math.sin(sine/12)), math.rad(-3 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine/12)), math.rad(-20 + 0 * math.sin(sine/12)), math.rad(3 + 0 * math.sin(sine/12))),0.1)
elseif position == "walk" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0.3 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(-10 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + 0.3 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 30 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + -0.3 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + -30 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
elseif position == "jump" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(15 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(10 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
elseif position == "fall" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(15 + 10 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(-10 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(10 + 5 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(10 + 0 * math.sin(sine/12))),0.1)
elseif position == "vent" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + -8 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 1.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(26.02 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
elseif position == "ventidle" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), -20 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 1.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(26.02 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
elseif position == "idle2" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/20), 3 + 0.3 * math.sin(sine/20), 0 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(0 + 20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/20), 1 + 0 * math.sin(sine/20), 1 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(20 + -20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/20), 2 + 0 * math.sin(sine/20), 0.5 + -0.5 * math.sin(sine/20)) * CFrame.Angles(math.rad(10 + -20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
elseif position == "walk2" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/20), 3 + 0.3 * math.sin(sine/20), 0 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(-60 + 10 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/20), 2 + 0 * math.sin(sine/20), 0.3 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(0 + -10 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(-5 + 0 * math.sin(sine/20))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/20), 1 + 0 * math.sin(sine/20), 0.5 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(0 + -20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(5 + 0 * math.sin(sine/20))),0.1)
elseif position == "attack" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/5), 0 + 0 * math.sin(sine/5), 0 + 0 * math.sin(sine/5)) * CFrame.Angles(math.rad(30 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(30 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(-4 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(30 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(4 + 0 * math.sin(sine/12))),0.1)
elseif position == "sit" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/5), -1.8 + 0 * math.sin(sine/5), 0 + 0 * math.sin(sine/5)) * CFrame.Angles(math.rad(10 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), -1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(-90 + 0 * math.sin(sine/12)), math.rad(10 + 0 * math.sin(sine/12)), math.rad(-4 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), -1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(-90 + 0 * math.sin(sine/12)), math.rad(-10 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
elseif position == "dead" then
change = 1
ROOTLERP.C0 = ROOTLERP.C0:lerp(CFrame.new(0 + 0 * math.sin(sine/5), -2.5 + 0 * math.sin(sine/5), -1 + 0 * math.sin(sine/5)) * CFrame.Angles(math.rad(-90 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5))),0.1)
RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 3 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(-4 + 0 * math.sin(sine/12))),0.1)
LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 3 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(4 + 0 * math.sin(sine/12))),0.1)
end
swait()
end
end)()
