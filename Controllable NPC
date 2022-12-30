--made by 1+1=2/rouxhaver
--only works with r6
--click somewhere to move your friend
--press V to wave
--your friend will dance with you "/e dance"
--feel free to mess around with the reanimate settings

--REQUIRED hats/hair:
--https://www.roblox.com/catalog/48474313/Red-Roblox-Cap
--https://www.roblox.com/catalog/62724852/Chestnut-Bun
--https://www.roblox.com/catalog/451220849/Lavender-Updo
--https://www.roblox.com/bundles/282/ROBLOX-Girl
--https://www.roblox.com/catalog/4047554959/International-Fedora-Brazil
--https://www.roblox.com/catalog/63690008/Pal-Hair
--https://www.roblox.com/catalog/62234425/Brown-Hair
--https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair

--(you can have three other hats that will stay on your avatar)

--reanimate by MyWorld#4430 discord.gg/pYVHtSJmEY
local v3_net, v3_808 = Vector3.new(0.1, 25.1, 0.1), Vector3.new(8, 0, 8)
local function getNetlessVelocity(realPartVelocity)
    if realPartVelocity.Magnitude > 1 then
        local unit = realPartVelocity.Unit
        if (unit.Y > 0.25) or (unit.Y < -0.75) then
            return unit * (25.1 / unit.Y)
        end
    end
    return v3_net + realPartVelocity * v3_808
end
local simradius = "shp" --simulation radius (net bypass) method
--"shp" - sethiddenproperty
--"ssr" - setsimulationradius
--false - disable
local simrad = math.huge --simulation radius value
local healthHide = false --moves your head away every 3 seconds so players dont see your health bar (alignmode 4 only)
local reclaim = true --if you lost control over a part this will move your primary part to the part so you get it back (alignmode 4)
local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them (alignmode 4 only)
local physp = nil --PhysicalProperties.new(0.01, 0, 1, 0, 0) --sets .CustomPhysicalProperties to this for each part
local noclipAllParts = false --set it to true if you want noclip
local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
local newanimate = true --disables the animate script and enables after reanimation
local discharscripts = true --disables all localScripts parented to your character before reanimation
local R15toR6 = true --tries to convert your character to r6 if its r15
local hatcollide = true --makes hats cancollide (credit to ShownApe) (works only with reanimate method 0)
local humState16 = true --enables collisions for limbs before the humanoid dies (using hum:ChangeState)
local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
local hedafterneck = true --disable aligns for head and enable after neck or torso is removed
local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
local method = 3 --reanimation method
--methods:
--0 - breakJoints (takes [loadtime] seconds to load)
--1 - limbs
--2 - limbs + anti respawn
--3 - limbs + breakJoints after [loadtime] seconds
--4 - remove humanoid + breakJoints
--5 - remove humanoid + limbs
local alignmode = 1 --AlignPosition mode
--modes:
--1 - AlignPosition rigidity enabled true
--2 - 2 AlignPositions rigidity enabled both true and false
--3 - AlignPosition rigidity enabled false
--4 - no AlignPosition, CFrame only
local flingpart = "HumanoidRootPart" --name of the part or the hat used for flinging
--the fling function
--usage: fling(target, duration, velocity)
--target can be set to: basePart, CFrame, Vector3, character model or humanoid (flings at mouse.Hit if argument not provided)
--duration (fling time in seconds) can be set to a number or a string convertable to a number (0.5s if not provided)
--velocity (fling part rotation velocity) can be set to a vector3 value (Vector3.new(20000, 20000, 20000) if not provided)

local lp = game:GetService("Players").LocalPlayer
local rs, ws, sg = game:GetService("RunService"), game:GetService("Workspace"), game:GetService("StarterGui")
local stepped, heartbeat, renderstepped = rs.Stepped, rs.Heartbeat, rs.RenderStepped
local twait, tdelay, rad, inf, abs, clamp = task.wait, task.delay, math.rad, math.huge, math.abs, math.clamp
local cf, v3, angles = CFrame.new, Vector3.new, CFrame.Angles
local v3_0, cf_0 = v3(0, 0, 0), cf(0, 0, 0)

local c = lp.Character
if not (c and c.Parent) then
    return
end

c:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (c and c.Parent) then
        c = nil
    end
end)

local clone, destroy, getchildren, getdescendants, isa = c.Clone, c.Destroy, c.GetChildren, c.GetDescendants, c.IsA

local function gp(parent, name, className)
    if typeof(parent) == "Instance" then
        for i, v in pairs(getchildren(parent)) do
            if (v.Name == name) and isa(v, className) then
                return v
            end
        end
    end
    return nil
end

local fenv = getfenv()

local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.setsimrad or fenv.set_sim_rad

healthHide = healthHide and ((method == 0) or (method == 2) or (method == 3)) and gp(c, "Head", "BasePart")

local reclaim, lostpart = reclaim and c.PrimaryPart, nil

local function align(Part0, Part1)
    
    local att0 = Instance.new("Attachment")
    att0.Position, att0.Orientation, att0.Name = v3_0, v3_0, "att0_" .. Part0.Name
    local att1 = Instance.new("Attachment")
    att1.Position, att1.Orientation, att1.Name = v3_0, v3_0, "att1_" .. Part1.Name

    if alignmode == 4 then
    
        local hide = false
        if Part0 == healthHide then
            healthHide = false
            tdelay(0, function()
                while twait(2.9) and Part0 and c do
                    hide = #Part0:GetConnectedParts() == 1
                    twait(0.1)
                    hide = false
                end
            end)
        end
        
        local rot = rad(0.05)
        local con0, con1 = nil, nil
        con0 = stepped:Connect(function()
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            Part0.RotVelocity = Part1.RotVelocity
        end)
        local lastpos = Part0.Position
        con1 = heartbeat:Connect(function(delta)
            if not (Part0 and Part1 and att1) then return con0:Disconnect() and con1:Disconnect() end
            if (not Part0.Anchored) and (Part0.ReceiveAge == 0) then
                if lostpart == Part0 then
                    lostpart = nil
                end
                local newcf = Part1.CFrame * att1.CFrame
                if Part1.Velocity.Magnitude > 0.1 then
                    Part0.Velocity = getNetlessVelocity(Part1.Velocity)
                else
                    local vel = (newcf.Position - lastpos) / delta
                    Part0.Velocity = getNetlessVelocity(vel)
                    if vel.Magnitude < 1 xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed> 0.01 then
                Part0.Velocity = getNetlessVelocity(Part1.Velocity)
            else
                Part0.Velocity = getNetlessVelocity((Part0.Position - lastpos) / delta)
            end
            lastpos = Part0.Position
        end)
    
    end

    att0:GetPropertyChangedSignal("Parent"):Connect(function()
        Part0 = att0.Parent
        if not isa(Part0, "BasePart") then
            att0 = nil
            if lostpart == Part0 then
                lostpart = nil
            end
            Part0 = nil
        end
    end)
    att0.Parent = Part0
    
    att1:GetPropertyChangedSignal("Parent"):Connect(function()
        Part1 = att1.Parent
        if not isa(Part1, "BasePart") then
            att1 = nil
            Part1 = nil
        end
    end)
    att1.Parent = Part1
end

local function respawnrequest()
    local ccfr, c = ws.CurrentCamera.CFrame, lp.Character
    lp.Character = nil
    lp.Character = c
    local con = nil
    con = ws.CurrentCamera.Changed:Connect(function(prop)
        if (prop ~= "Parent") and (prop ~= "CFrame") then
            return
        end
        ws.CurrentCamera.CFrame = ccfr
        con:Disconnect()
    end)
end

local destroyhum = (method == 4) or (method == 5)
local breakjoints = (method == 0) or (method == 4)
local antirespawn = (method == 0) or (method == 2) or (method == 3)

hatcollide = hatcollide and (method == 0)

addtools = addtools and lp:FindFirstChildOfClass("Backpack")

if type(simrad) ~= "number" then simrad = 1000 end
if shp and (simradius == "shp") then
    tdelay(0, function()
        while c do
            shp(lp, "SimulationRadius", simrad)
            heartbeat:Wait()
        end
    end)
elseif ssr and (simradius == "ssr") then
    tdelay(0, function()
        while c do
            ssr(simrad)
            heartbeat:Wait()
        end
    end)
end

if antiragdoll then
    antiragdoll = function(v)
        if isa(v, "HingeConstraint") or isa(v, "BallSocketConstraint") then
            v.Parent = nil
        end
    end
    for i, v in pairs(getdescendants(c)) do
        antiragdoll(v)
    end
    c.DescendantAdded:Connect(antiragdoll)
end

if antirespawn then
    respawnrequest()
end

if method == 0 then
    twait(loadtime)
    if not c then
        return
    end
end

if discharscripts then
    for i, v in pairs(getdescendants(c)) do
        if isa(v, "LocalScript") then
            v.Disabled = true
        end
    end
elseif newanimate then
    local animate = gp(c, "Animate", "LocalScript")
    if animate and (not animate.Disabled) then
        animate.Disabled = true
    else
        newanimate = false
    end
end

if addtools then
    for i, v in pairs(getchildren(addtools)) do
        if isa(v, "Tool") then
            v.Parent = c
        end
    end
end

pcall(function()
    settings().Physics.AllowSleep = false
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
end)

local OLDscripts = {}

for i, v in pairs(getdescendants(c)) do
    if v.ClassName == "Script" then
        OLDscripts[v.Name] = true
    end
end

local scriptNames = {}

for i, v in pairs(getdescendants(c)) do
    if isa(v, "BasePart") then
        local newName, exists = tostring(i), true
        while exists do
            exists = OLDscripts[newName]
            if exists then
                newName = newName .. "_"    
            end
        end
        table.insert(scriptNames, newName)
        Instance.new("Script", v).Name = newName
    end
end

local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
    for i, v in pairs(hum:GetPlayingAnimationTracks()) do
        v:Stop()
    end
end
c.Archivable = true
local cl = clone(c)
if hum and humState16 then
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    if destroyhum then
        twait(1.6)
    end
end
if destroyhum then
    pcall(destroy, hum)
end

if not c then
    return
end

local head, torso, root = gp(c, "Head", "BasePart"), gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart"), gp(c, "HumanoidRootPart", "BasePart")
if hatcollide then
    pcall(destroy, torso)
    pcall(destroy, root)
    pcall(destroy, c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script"))
end

local model = Instance.new("Model", c)
model:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (model and model.Parent) then
        model = nil
    end
end)

for i, v in pairs(getchildren(c)) do
    if v ~= model then
        if addtools and isa(v, "Tool") then
            for i1, v1 in pairs(getdescendants(v)) do
                if v1 and v1.Parent and isa(v1, "BasePart") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity, bv.MaxForce, bv.P, bv.Name = v3_0, v3(1000, 1000, 1000), 1250, "bv_" .. v.Name
                    bv.Parent = v1
                end
            end
        end
        v.Parent = model
    end
end

if breakjoints then
    model:BreakJoints()
else
    if head and torso then
        for i, v in pairs(getdescendants(model)) do
            if isa(v, "JointInstance") then
                local save = false
                if (v.Part0 == torso) and (v.Part1 == head) then
                    save = true
                end
                if (v.Part0 == head) and (v.Part1 == torso) then
                    save = true
                end
                if save then
                    if hedafterneck then
                        hedafterneck = v
                    end
                else
                    pcall(destroy, v)
                end
            end
        end
    end
    if method == 3 then
        task.delay(loadtime, pcall, model.BreakJoints, model)
    end
end

cl.Parent = ws
for i, v in pairs(getchildren(cl)) do
    v.Parent = c
end
pcall(destroy, cl)

local uncollide, noclipcon = nil, nil
if noclipAllParts then
    uncollide = function()
        if c then
            for i, v in pairs(getdescendants(c)) do
                if isa(v, "BasePart") then
                    v.CanCollide = false
                end
            end
        else
            noclipcon:Disconnect()
        end
    end
else
    uncollide = function()
        if model then
            for i, v in pairs(getdescendants(model)) do
                if isa(v, "BasePart") then
                    v.CanCollide = false
                end
            end
        else
            noclipcon:Disconnect()
        end
    end
end
noclipcon = stepped:Connect(uncollide)
uncollide()

for i, scr in pairs(getdescendants(model)) do
    if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
        local Part0 = scr.Parent
        if isa(Part0, "BasePart") then
            for i1, scr1 in pairs(getdescendants(c)) do
                if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
                    local Part1 = scr1.Parent
                    if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
                        align(Part0, Part1)
                        pcall(destroy, scr)
                        pcall(destroy, scr1)
                        break
                    end
                end
            end
        end
    end
end

for i, v in pairs(getdescendants(c)) do
    if v and v.Parent and (not v:IsDescendantOf(model)) then
        if isa(v, "Decal") then
            v.Transparency = 1
        elseif isa(v, "BasePart") then
            v.Transparency = 1
            v.Anchored = false
        elseif isa(v, "ForceField") then
            v.Visible = false
        elseif isa(v, "Sound") then
            v.Playing = false
        elseif isa(v, "BillboardGui") or isa(v, "SurfaceGui") or isa(v, "ParticleEmitter") or isa(v, "Fire") or isa(v, "Smoke") or isa(v, "Sparkles") then
            v.Enabled = false
        end
    end
end

if newanimate then
    local animate = gp(c, "Animate", "LocalScript")
    if animate then
        animate.Disabled = false
    end
end

if addtools then
    for i, v in pairs(getchildren(c)) do
        if isa(v, "Tool") then
            v.Parent = addtools
        end
    end
end

local hum0, hum1 = model:FindFirstChildOfClass("Humanoid"), c:FindFirstChildOfClass("Humanoid")
if hum0 then
    hum0:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (hum0 and hum0.Parent) then
            hum0 = nil
        end
    end)
end
if hum1 then
    hum1:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (hum1 and hum1.Parent) then
            hum1 = nil
        end
    end)

    ws.CurrentCamera.CameraSubject = hum1
    local camSubCon = nil
    local function camSubFunc()
        camSubCon:Disconnect()
        if c and hum1 then
            ws.CurrentCamera.CameraSubject = hum1
        end
    end
    camSubCon = renderstepped:Connect(camSubFunc)
    if hum0 then
        hum0:GetPropertyChangedSignal("Jump"):Connect(function()
            if hum1 then
                hum1.Jump = hum0.Jump
            end
        end)
    else
        respawnrequest()
    end
end

local rb = Instance.new("BindableEvent", c)
rb.Event:Connect(function()
    pcall(destroy, rb)
    sg:SetCore("ResetButtonCallback", true)
    if destroyhum then
        if c then c:BreakJoints() end
        return
    end
    if model and hum0 and (hum0.Health > 0) then
        model:BreakJoints()
        hum0.Health = 0
    end
    if antirespawn then
        respawnrequest()
    end
end)
sg:SetCore("ResetButtonCallback", rb)

tdelay(0, function()
    while c do
        if hum0 and hum1 then
            hum1.Jump = hum0.Jump
        end
        wait()
    end
    sg:SetCore("ResetButtonCallback", true)
end)

R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
if R15toR6 then
    local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    if part then
        local cfr = part.CFrame
        local R6parts = { 
            head = {
                Name = "Head",
                Size = v3(2, 1, 1),
                R15 = {
                    Head = 0
                }
            },
            torso = {
                Name = "Torso",
                Size = v3(2, 2, 1),
                R15 = {
                    UpperTorso = 0.2,
                    LowerTorso = -0.8
                }
            },
            root = {
                Name = "HumanoidRootPart",
                Size = v3(2, 2, 1),
                R15 = {
                    HumanoidRootPart = 0
                }
            },
            leftArm = {
                Name = "Left Arm",
                Size = v3(1, 2, 1),
                R15 = {
                    LeftHand = -0.849,
                    LeftLowerArm = -0.174,
                    LeftUpperArm = 0.415
                }
            },
            rightArm = {
                Name = "Right Arm",
                Size = v3(1, 2, 1),
                R15 = {
                    RightHand = -0.849,
                    RightLowerArm = -0.174,
                    RightUpperArm = 0.415
                }
            },
            leftLeg = {
                Name = "Left Leg",
                Size = v3(1, 2, 1),
                R15 = {
                    LeftFoot = -0.85,
                    LeftLowerLeg = -0.29,
                    LeftUpperLeg = 0.49
                }
            },
            rightLeg = {
                Name = "Right Leg",
                Size = v3(1, 2, 1),
                R15 = {
                    RightFoot = -0.85,
                    RightLowerLeg = -0.29,
                    RightUpperLeg = 0.49
                }
            }
        }
        for i, v in pairs(getchildren(c)) do
            if isa(v, "BasePart") then
                for i1, v1 in pairs(getchildren(v)) do
                    if isa(v1, "Motor6D") then
                        v1.Part0 = nil
                    end
                end
            end
        end
        part.Archivable = true
        for i, v in pairs(R6parts) do
            local part = clone(part)
            part:ClearAllChildren()
            part.Name, part.Size, part.CFrame, part.Anchored, part.Transparency, part.CanCollide = v.Name, v.Size, cfr, false, 1, false
            for i1, v1 in pairs(v.R15) do
                local R15part = gp(c, i1, "BasePart")
                local att = gp(R15part, "att1_" .. i1, "Attachment")
                if R15part then
                    local weld = Instance.new("Weld")
                    weld.Part0, weld.Part1, weld.C0, weld.C1, weld.Name = part, R15part, cf(0, v1, 0), cf_0, "Weld_" .. i1
                    weld.Parent = R15part
                    R15part.Massless, R15part.Name = true, "R15_" .. i1
                    R15part.Parent = part
                    if att then
                        att.Position = v3(0, v1, 0)
                        att.Parent = part
                    end
                end
            end
            part.Parent = c
            R6parts[i] = part
        end
        local R6joints = {
            neck = {
                Parent = R6parts.torso,
                Name = "Neck",
                Part0 = R6parts.torso,
                Part1 = R6parts.head,
                C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
            },
            rootJoint = {
                Parent = R6parts.root,
                Name = "RootJoint" ,
                Part0 = R6parts.root,
                Part1 = R6parts.torso,
                C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
            },
            rightShoulder = {
                Parent = R6parts.torso,
                Name = "Right Shoulder",
                Part0 = R6parts.torso,
                Part1 = R6parts.rightArm,
                C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            },
            leftShoulder = {
                Parent = R6parts.torso,
                Name = "Left Shoulder",
                Part0 = R6parts.torso,
                Part1 = R6parts.leftArm,
                C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            },
            rightHip = {
                Parent = R6parts.torso,
                Name = "Right Hip",
                Part0 = R6parts.torso,
                Part1 = R6parts.rightLeg,
                C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            },
            leftHip = {
                Parent = R6parts.torso,
                Name = "Left Hip" ,
                Part0 = R6parts.torso,
                Part1 = R6parts.leftLeg,
                C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            }
        }
        for i, v in pairs(R6joints) do
            local joint = Instance.new("Motor6D")
            for prop, val in pairs(v) do
                joint[prop] = val
            end
            R6joints[i] = joint
        end
        if hum1 then
            hum1.RigType, hum1.HipHeight = Enum.HumanoidRigType.R6, 0
        end
    end
    --the default roblox animate script edited and put in one line
    local script = gp(c, "Animate", "LocalScript") if not script.Disabled then script:ClearAllChildren() local Torso = gp(c, "Torso", "BasePart") local RightShoulder = gp(Torso, "Right Shoulder", "Motor6D") local LeftShoulder = gp(Torso, "Left Shoulder", "Motor6D") local RightHip = gp(Torso, "Right Hip", "Motor6D") local LeftHip = gp(Torso, "Left Hip", "Motor6D") local Neck = gp(Torso, "Neck", "Motor6D") local Humanoid = c:FindFirstChildOfClass("Humanoid") local pose = "Standing" local currentAnim = "" local currentAnimInstance = nil local currentAnimTrack = nil local currentAnimKeyframeHandler = nil local currentAnimSpeed = 1.0 local animTable = {} local animNames = { idle = { { id = "http://www.roblox.com/asset/?id=180435571", weight = 9 }, { id = "http://www.roblox.com/asset/?id=180435792", weight = 1 } }, walk = { { id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } }, run = { { id = "run.xml", weight = 10 } }, jump = { { id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } }, fall = { { id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } }, climb = { { id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } }, sit = { { id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } }, toolnone = { { id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } }, toolslash = { { id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } }, toollunge = { { id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } }, wave = { { id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } }, point = { { id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } }, dance1 = { { id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } }, dance2 = { { id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } }, dance3 = { { id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } }, laugh = { { id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } }, cheer = { { id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } }, } local dances = {"dance1", "dance2", "dance3"} local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false} local function configureAnimationSet(name, fileList) if (animTable[name] ~= nil) then for _, connection in pairs(animTable[name].connections) do connection:disconnect() end end animTable[name] = {} animTable[name].count = 0 animTable[name].totalWeight = 0 animTable[name].connections = {} local config = script:FindFirstChild(name) if (config ~= nil) then table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end)) table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end)) local idx = 1 for _, childPart in pairs(config:GetChildren()) do if (childPart:IsA("Animation")) then table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end)) animTable[name][idx] = {} animTable[name][idx].anim = childPart local weightObject = childPart:FindFirstChild("Weight") if (weightObject == nil) then animTable[name][idx].weight = 1 else animTable[name][idx].weight = weightObject.Value end animTable[name].count = animTable[name].count + 1 animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight idx = idx + 1 end end end if (animTable[name].count <= 0) then for idx, anim in pairs(fileList) do animTable[name][idx] = {} animTable[name][idx].anim = Instance.new("Animation") animTable[name][idx].anim.Name = name animTable[name][idx].anim.AnimationId = anim.id animTable[name][idx].weight = anim.weight animTable[name].count = animTable[name].count + 1 animTable[name].totalWeight = animTable[name].totalWeight + anim.weight end end end local function scriptChildModified(child) local fileList = animNames[child.Name] if (fileList ~= nil) then configureAnimationSet(child.Name, fileList) end end script.ChildAdded:connect(scriptChildModified) script.ChildRemoved:connect(scriptChildModified) local animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator") or nil if animator then local animTracks = animator:GetPlayingAnimationTracks() for i, track in ipairs(animTracks) do track:Stop(0) track:Destroy() end end for name, fileList in pairs(animNames) do configureAnimationSet(name, fileList) end local toolAnim = "None" local toolAnimTime = 0 local jumpAnimTime = 0 local jumpAnimDuration = 0.3 local toolTransitionTime = 0.1 local fallTransitionTime = 0.3 local jumpMaxLimbVelocity = 0.75 local function stopAllAnimations() local oldAnim = currentAnim if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then oldAnim = "idle" end currentAnim = "" currentAnimInstance = nil if (currentAnimKeyframeHandler ~= nil) then currentAnimKeyframeHandler:disconnect() end if (currentAnimTrack ~= nil) then currentAnimTrack:Stop() currentAnimTrack:Destroy() currentAnimTrack = nil end return oldAnim end local function playAnimation(animName, transitionTime, humanoid) local roll = math.random(1, animTable[animName].totalWeight) local origRoll = roll local idx = 1 while (roll > animTable[animName][idx].weight) do roll = roll - animTable[animName][idx].weight idx = idx + 1 end local anim = animTable[animName][idx].anim if (anim ~= currentAnimInstance) then if (currentAnimTrack ~= nil) then currentAnimTrack:Stop(transitionTime) currentAnimTrack:Destroy() end currentAnimSpeed = 1.0 currentAnimTrack = humanoid:LoadAnimation(anim) currentAnimTrack.Priority = Enum.AnimationPriority.Core currentAnimTrack:Play(transitionTime) currentAnim = animName currentAnimInstance = anim if (currentAnimKeyframeHandler ~= nil) then currentAnimKeyframeHandler:disconnect() end currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc) end end local function setAnimationSpeed(speed) if speed ~= currentAnimSpeed then currentAnimSpeed = speed currentAnimTrack:AdjustSpeed(currentAnimSpeed) end end local function keyFrameReachedFunc(frameName) if (frameName == "End") then local repeatAnim = currentAnim if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then repeatAnim = "idle" end local animSpeed = currentAnimSpeed playAnimation(repeatAnim, 0.0, Humanoid) setAnimationSpeed(animSpeed) end end local toolAnimName = "" local toolAnimTrack = nil local toolAnimInstance = nil local currentToolAnimKeyframeHandler = nil local function toolKeyFrameReachedFunc(frameName) if (frameName == "End") then playToolAnimation(toolAnimName, 0.0, Humanoid) end end local function playToolAnimation(animName, transitionTime, humanoid, priority) local roll = math.random(1, animTable[animName].totalWeight) local origRoll = roll local idx = 1 while (roll > animTable[animName][idx].weight) do roll = roll - animTable[animName][idx].weight idx = idx + 1 end local anim = animTable[animName][idx].anim if (toolAnimInstance ~= anim) then if (toolAnimTrack ~= nil) then toolAnimTrack:Stop() toolAnimTrack:Destroy() transitionTime = 0 end toolAnimTrack = humanoid:LoadAnimation(anim) if priority then toolAnimTrack.Priority = priority end toolAnimTrack:Play(transitionTime) toolAnimName = animName toolAnimInstance = anim currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc) end end local function stopToolAnimations() local oldAnim = toolAnimName if (currentToolAnimKeyframeHandler ~= nil) then currentToolAnimKeyframeHandler:disconnect() end toolAnimName = "" toolAnimInstance = nil if (toolAnimTrack ~= nil) then toolAnimTrack:Stop() toolAnimTrack:Destroy() toolAnimTrack = nil end return oldAnim end local function onRunning(speed) if speed > 0.01 then playAnimation("walk", 0.1, Humanoid) if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then setAnimationSpeed(speed / 14.5) end pose = "Running" else if emoteNames[currentAnim] == nil then playAnimation("idle", 0.1, Humanoid) pose = "Standing" end end end local function onDied() pose = "Dead" end local function onJumping() playAnimation("jump", 0.1, Humanoid) jumpAnimTime = jumpAnimDuration pose = "Jumping" end local function onClimbing(speed) playAnimation("climb", 0.1, Humanoid) setAnimationSpeed(speed / 12.0) pose = "Climbing" end local function onGettingUp() pose = "GettingUp" end local function onFreeFall() if (jumpAnimTime <= 0) then playAnimation("fall", fallTransitionTime, Humanoid) end pose = "FreeFall" end local function onFallingDown() pose = "FallingDown" end local function onSeated() pose = "Seated" end local function onPlatformStanding() pose = "PlatformStanding" end local function onSwimming(speed) if speed > 0 then pose = "Running" else pose = "Standing" end end local function getTool() return c and c:FindFirstChildOfClass("Tool") end local function getToolAnim(tool) for _, c in ipairs(tool:GetChildren()) do if c.Name == "toolanim" and c.className == "StringValue" then return c end end return nil end local function animateTool() if (toolAnim == "None") then playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle) return end if (toolAnim == "Slash") then playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action) return end if (toolAnim == "Lunge") then playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action) return end end local function moveSit() RightShoulder.MaxVelocity = 0.15 LeftShoulder.MaxVelocity = 0.15 RightShoulder:SetDesiredAngle(3.14 /2) LeftShoulder:SetDesiredAngle(-3.14 /2) RightHip:SetDesiredAngle(3.14 /2) LeftHip:SetDesiredAngle(-3.14 /2) end local lastTick = 0 local function move(time) local amplitude = 1 local frequency = 1 local deltaTime = time - lastTick lastTick = time local climbFudge = 0 local setAngles = false if (jumpAnimTime > 0) then jumpAnimTime = jumpAnimTime - deltaTime end if (pose == "FreeFall" and jumpAnimTime <= 0) then playAnimation("fall", fallTransitionTime, Humanoid) elseif (pose == "Seated") then playAnimation("sit", 0.5, Humanoid) return elseif (pose == "Running") then playAnimation("walk", 0.1, Humanoid) elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then stopAllAnimations() amplitude = 0.1 frequency = 1 setAngles = true end if (setAngles) then local desiredAngle = amplitude * math.sin(time * frequency) RightShoulder:SetDesiredAngle(desiredAngle + climbFudge) LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge) RightHip:SetDesiredAngle(-desiredAngle) LeftHip:SetDesiredAngle(-desiredAngle) end local tool = getTool() if tool and tool:FindFirstChild("Handle") then local animStringValueObject = getToolAnim(tool) if animStringValueObject then toolAnim = animStringValueObject.Value animStringValueObject.Parent = nil toolAnimTime = time + .3 end if time > toolAnimTime then toolAnimTime = 0 toolAnim = "None" end animateTool() else stopToolAnimations() toolAnim = "None" toolAnimInstance = nil toolAnimTime = 0 end end Humanoid.Died:connect(onDied) Humanoid.Running:connect(onRunning) Humanoid.Jumping:connect(onJumping) Humanoid.Climbing:connect(onClimbing) Humanoid.GettingUp:connect(onGettingUp) Humanoid.FreeFalling:connect(onFreeFall) Humanoid.FallingDown:connect(onFallingDown) Humanoid.Seated:connect(onSeated) Humanoid.PlatformStanding:connect(onPlatformStanding) Humanoid.Swimming:connect(onSwimming) game:GetService("Players").LocalPlayer.Chatted:connect(function(msg) local emote = "" if msg == "/e dance" then emote = dances[math.random(1, #dances)] elseif (string.sub(msg, 1, 3) == "/e ") then emote = string.sub(msg, 4) elseif (string.sub(msg, 1, 7) == "/emote ") then emote = string.sub(msg, 8) end if (pose == "Standing" and emoteNames[emote] ~= nil) then playAnimation(emote, 0.1, Humanoid) end end) playAnimation("idle", 0.1, Humanoid) pose = "Standing" tdelay(0, function() while c do local _, time = wait(0.1) if (script.Parent == c) and (not script.Disabled) then move(time) end end end) end 
end

local torso1 = torso
torso = gp(c, "Torso", "BasePart") or ((not R15toR6) and gp(c, torso.Name, "BasePart"))
if (typeof(hedafterneck) == "Instance") and head and torso and torso1 then
    local conNeck, conTorso, conTorso1 = nil, nil, nil
    local aligns = {}
    local function enableAligns()
        conNeck:Disconnect()
        conTorso:Disconnect()
        conTorso1:Disconnect()
        for i, v in pairs(aligns) do
            v.Enabled = true
        end
    end
    conNeck = hedafterneck.Changed:Connect(function(prop)
        if table.find({"Part0", "Part1", "Parent"}, prop) then
            enableAligns()
        end
    end)
    conTorso = torso:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
    conTorso1 = torso1:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
    for i, v in pairs(getdescendants(head)) do
        if isa(v, "AlignPosition") or isa(v, "AlignOrientation") then
            i = tostring(i)
            aligns[i] = v
            v:GetPropertyChangedSignal("Parent"):Connect(function()
                aligns[i] = nil
            end)
            v.Enabled = false
        end
    end
end

local flingpart0 = gp(model, flingpart, "BasePart") or gp(gp(model, flingpart, "Accessory"), "Handle", "BasePart")
local flingpart1 = gp(c, flingpart, "BasePart") or gp(gp(c, flingpart, "Accessory"), "Handle", "BasePart")

local fling = function() end
if flingpart0 and flingpart1 then
    flingpart0:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (flingpart0 and flingpart0.Parent) then
            flingpart0 = nil
            fling = function() end
        end
    end)
    flingpart0.Archivable = true
    flingpart1:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (flingpart1 and flingpart1.Parent) then
            flingpart1 = nil
            fling = function() end
        end
    end)
    local att0 = gp(flingpart0, "att0_" .. flingpart0.Name, "Attachment")
    local att1 = gp(flingpart1, "att1_" .. flingpart1.Name, "Attachment")
    if att0 and att1 then
        att0:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (att0 and att0.Parent) then
                att0 = nil
                fling = function() end
            end
        end)
        att1:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (att1 and att1.Parent) then
                att1 = nil
                fling = function() end
            end
        end)
        local lastfling = nil
        local mouse = lp:GetMouse()
        fling = function(target, duration, rotVelocity)
            if typeof(target) == "Instance" then
                if isa(target, "BasePart") then
                    target = target.Position
                elseif isa(target, "Model") then
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                elseif isa(target, "Humanoid") then
                    target = target.Parent
                    if not (target and isa(target, "Model")) then
                        return
                    end
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                else
                    return
                end
            elseif typeof(target) == "CFrame" then
                target = target.Position
            elseif typeof(target) ~= "Vector3" then
                target = mouse.Hit
                if target then
                    target = target.Position
                else
                    return
                end
            end
            if target.Y < ws xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed flingpart.Name = "flingpart_" xss=removed xss=removed xss=removed xss=removed xss=removed xss=removed> 0.5 then
                flingpart0.Transparency = 0.5
            end
            att1.Parent = flingpart
            local con = nil
            local rotchg = v3(0, rotVelocity.Unit.Y * -1000, 0)
            con = heartbeat:Connect(function(delta)
                if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                    flingpart.Orientation += rotchg * delta
                    flingpart0.RotVelocity = rotVelocity
                else
                    con:Disconnect()
                end
            end)
            if alignmode ~= 4 then
                local con = nil
                con = renderstepped:Connect(function()
                    if flingpart0 and target then
                        flingpart0.RotVelocity = v3_0
                    else
                        con:Disconnect()
                    end
                end)
            end
            twait(duration)
            if lastfling ~= target then
                if flingpart then
                    if att1 and (att1.Parent == flingpart) then
                        att1.Parent = flingpart1
                    end
                    pcall(destroy, flingpart)
                end
                return
            end
            target = nil
            if not (flingpart and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            flingpart0.RotVelocity = v3_0
            att1.Parent = flingpart1
            pcall(destroy, flingpart)
        end
    end
end

--lp:GetMouse().Button1Down:Connect(fling) --click fling

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=getfenv or function()return _ENV;end;local v9=setmetatable;local v10=pcall;local v11=select;local v12=unpack or table.unpack;local v13=tonumber;local function v14(v15,v16)local v17=1;local v18;v15=v4(v3(v15,5),"..",function(v29)if (v1(v29,2)==79) then v18=v0(v3(v29,1,1));return "";else local v70=v2(v0(v29,16));if v18 then local v82=v5(v70,v18);v18=nil;return v82;else return v70;end end end);local function v19(v30,v31,v32)if v32 then local v71=(v30/(2^(v31-1)))%(2^(((v32-1) -(v31-1)) + 1));return v71-(v71%1);else local v72=2^(v31-1);return (((v30%(v72 + v72))>=v72) and 1) or 0;end end local function v20()local v37=v1(v15,v17,v17);v17=v17 + 1;return v37;end local function v21()local v38,v39=v1(v15,v17,v17 + 2);v17=v17 + 2;return (v39 * 256) + v38;end local function v22()local v40,v41,v42,v43=v1(v15,v17,v17 + 3);v17=v17 + 4;return (v43 * 16777216) + (v42 * 65536) + (v41 * 256) + v40;end local function v23()local v44=v22();local v45=v22();return (( -2 * v19(v45,32)) + 1) * (2^(v19(v45,21,31) -1023)) * ((((v19(v45,1,20) * (2^32)) + v44)/(2^52)) + 1);end local function v24(v33)local v46;if  not v33 then v33=v22();if (v33==0) then return "";end end v46=v3(v15,v17,(v17 + v33) -1);v17=v17 + v33;local v47={};for v58=1, #v46 do v47[v58]=v2(v1(v3(v46,v58,v58)));end return v6(v47);end local v25=v22;local function v26(...)return {...},v11("#",...);end local function v27()local v48={};local v49={};local v50={};local v51={v48,v49,nil,v50};local v52=v22();local v53={};for v60=1,v52 do local v61=v20();local v62;if (v61==1) then v62=v20()~=0;elseif (v61==2) then v62=v23();elseif (v61==3) then v62=v24();end v53[v60]=v62;end v51[3]=v20();for v64=1,v22() do local v65=v20();if (v19(v65,1,1)==0) then local v78=v19(v65,2,3);local v79=v19(v65,4,6);local v80={v21(),v21(),nil,nil};if (v78==0) then v80[3]=v21();v80[4]=v21();elseif (v78==1) then v80[3]=v22();elseif (v78==2) then v80[3]=v22() -(2^16);elseif (v78==3) then v80[3]=v22() -(2^16);v80[4]=v21();end if (v19(v79,1,1)==1) then v80[2]=v53[v80[2]];end if (v19(v79,2,2)==1) then v80[3]=v53[v80[3]];end if (v19(v79,3,3)==1) then v80[4]=v53[v80[4]];end v48[v64]=v80;end end for v66=1,v22() do v49[v66-1]=v27();end for v68=1,v22() do v50[v68]=v22();end return v51;end local function v28(v34,v35,v36)local v55=v34[1];local v56=v34[2];local v57=v34[3];return function(...)local v73=1;local v74= -1;local v75={...};local v76=v11("#",...) -1;local function v77()local v83=v55;local v84=Const;local v85=v56;local v86=v57;local v87=v26;local v88={};local v89={};local v90={};for v100=0,v76 do if (v100>=v86) then v88[v100-v86]=v75[v100 + 1];else v90[v100]=v75[v100 + 1];end end local v91=(v76-v86) + 1;local v92;local v93;while true do v92=v83[v73];v93=v92[1];if (v93<=12) then if (v93<=5) then if (v93<=2) then if (v93<=0) then v90[v92[2]]=v90[v92[3]];elseif (v93==1) then v90[v92[2]]=v90[v92[3]][v92[4]];else local v113=v92[2];v90[v113]=v90[v113](v12(v90,v113 + 1,v92[3]));end elseif (v93<=3) then v90[v92[2]]=v28(v85[v92[3]],nil,v36);elseif (v93>4) then local v115=v92[2];local v116,v117=v87(v90[v115](v12(v90,v115 + 1,v92[3])));v74=(v117 + v115) -1;local v118=0;for v144=v115,v74 do v118=v118 + 1;v90[v144]=v116[v118];end else local v119=v92[2];v90[v119]=v90[v119](v12(v90,v119 + 1,v74));end elseif (v93<=8) then if (v93<=6) then local v109=v92[2];v90[v109](v90[v109 + 1]);elseif (v93==7) then local v121=v92[2];v90[v121]=v90[v121](v90[v121 + 1]);else v90[v92[2]]=v92[3];end elseif (v93<=10) then if (v93==9) then v90[v92[2]][v92[3]]=v90[v92[4]];else local v125=v92[2];v90[v125]=v90[v125]();end elseif (v93==11) then local v127=v92[2];v90[v127](v12(v90,v127 + 1,v92[3]));else v73=v92[3];end elseif (v93<=19) then if (v93<=15) then if (v93<=13) then v90[v92[2]]=v90[v92[3]][v90[v92[4]]];elseif (v93>14) then do return;end else local v128=v85[v92[3]];local v129;local v130={};v129=v9({},{__index=function(v146,v147)local v155=v130[v147];return v155[1][v155[2]];end,__newindex=function(v148,v149,v150)local v156=v130[v149];v156[1][v156[2]]=v150;end});for v151=1,v92[4] do v73=v73 + 1;local v152=v83[v73];if (v152[1]==0) then v130[v151-1]={v90,v152[3]};else v130[v151-1]={v35,v152[3]};end v89[ #v89 + 1]=v130;end v90[v92[2]]=v28(v128,v129,v36);end elseif (v93<=17) then if (v93>16) then if v90[v92[2]] then v73=v73 + 1;else v73=v92[3];end elseif (v90[v92[2]]==v90[v92[4]]) then v73=v73 + 1;else v73=v92[3];end elseif (v93>18) then local v132=v92[3];local v133=v90[v132];for v154=v132 + 1,v92[4] do v133=v133   .. v90[v154];end v90[v92[2]]=v133;else local v135=v92[2];local v136=v90[v92[3]];v90[v135 + 1]=v136;v90[v135]=v136[v92[4]];end elseif (v93<=22) then if (v93<=20) then v90[v92[2]][v92[3]]=v92[4];elseif (v93==21) then v90[v92[2]]=v35[v92[3]];else v90[v92[2]]=v90[v92[3]] * v90[v92[4]];end elseif (v93<=24) then if (v93>23) then local v141=v92[2];v90[v141](v12(v90,v141 + 1,v74));else v36[v92[3]]=v90[v92[2]];end elseif (v93==25) then v90[v92[2]]=v36[v92[3]];elseif (v90[v92[2]]==v92[4]) then v73=v73 + 1;else v73=v92[3];end v73=v73 + 1;end end A,B=v26(v10(v77));if  not A[1] then local v94=v34[4][v73] or "?";error("Script error at ["   .. v94   .. "]:"   .. A[2]);else return v12(A,2,B);end end;end return v28(v27(),{},v16)();end v14("LOL!9F3O0003083O00746F737472696E6703043O006D61746803063O0072616E646F6D024O0084D79741022O0080FF642OCD4103083O00496E7374616E63652O033O006E657703093O005363722O656E47756903053O004672616D6503093O00546578744C6162656C030A3O005465787442752O746F6E03043O004E616D6503063O00506172656E7403043O0067616D6503073O00506C6179657273030B3O004C6F63616C506C61796572030C3O0057616974466F724368696C6403093O00506C61796572477569030E3O005A496E6465784265686176696F7203043O00456E756D03073O005369626C696E6703103O004261636B67726F756E64436F6C6F723303063O00436F6C6F723303073O0066726F6D524742025O00C05440030C3O00426F72646572436F6C6F7233028O00030F3O00426F7264657253697A65506978656C026O00244003083O00506F736974696F6E03053O005544696D320230DFF23F9691DA3F023A67B8BF822DD83F03043O0053697A65025O00C06C40025O00A0684003063O004163746976650100025O00E06F4003163O004261636B67726F756E645472616E73706172656E6379026O00F03F0241DC2F4016B2B03F02984EE09F0F64B73F026O006A40026O00564003043O00466F6E74030A3O00536F7572636553616E7303043O005465787403083O004D6164652062793A030A3O0054657874436F6C6F723303083O005465787453697A65025O00802O40030B3O00546578745772612O7065642O010259D6E97F3AB7D73F025O00C06940026O00484003113O0028312B313D32206F6E20726F626C6F782902085236A036DEE13F025O00A06940026O00474003153O0028726F75786861766572206F6E2067697468756229030A3O00546578745363616C656403013O0032025O00406540026O00084002D59135803D0AEB3F02C74A36E151B88E3F03013O0058026O002C4003043O0047616D6503113O004D6F75736542752O746F6E31436C69636B03073O00636F2O6E65637403093O00776F726B7370616365030E3O0046696E6446697273744368696C6403063O00467269656E6403073O0044657374726F7903093O0043686172616374657203053O004D6F64656C03103O0048756D616E6F6964522O6F745061727403043O005061727403043O004865616403073O00566563746F7233027O0040030C3O005472616E73706172656E637903053O00546F72736F03073O004C6566744C656703083O004C656674204C656703083O0052696768744C656703093O005269676874204C656703073O004C65667441726D03083O004C6566742041726D03083O00526967687441726D03093O0052696768742041726D03043O004E65636B03073O004D6F746F72364403053O00506172743003053O00506172743103023O00433003063O00434672616D65026O00F0BF03023O002D3003023O004331026O00E0BF030B3O004D617856656C6F63697479029A5O99B93F03073O004C65667448697003083O005269676874486970026O00E03F030C3O004C65667453686F756C646572030D3O00526967687453686F756C64657203093O00522O6F744A6F696E7403083O0048756D616E6F696403093O00616E696D6174696F6E03093O00416E696D6174696F6E03063O00736372697074030B3O00416E696D6174696F6E496403293O00682O74703A2O2F3O772E726F626C6F782E636F6D2F612O7365742F3F69643D31383034323633353403083O0068756D616E6F696403053O0064616E6365030D3O004C6F6164416E696D6174696F6E030A3O00616E696D6174696F6E3203293O00682O74703A2O2F3O772E726F626C6F782E636F6D2F612O7365742F3F69643D31383034332O35373103063O0064616E636532030A3O00616E696D6174696F6E3303293O00682O74703A2O2F3O772E726F626C6F782E636F6D2F612O7365742F3F69643D31383234333638343203063O0064616E63653303293O00682O74703A2O2F3O772E726F626C6F782E636F6D2F612O7365742F3F69643D3138323433352O393803063O0064616E636534030A3O00616E696D6174696F6E3403293O00682O74703A2O2F3O772E726F626C6F782E636F6D2F612O7365742F3F69643D3132383O3739373303063O0064616E63653503063O00706C6179657203083O0050616C204861697203063O0048616E646C65030D3O00412O63652O736F727957656C6403043O004D65736803063O00416E676C65732O033O00726164025O0080564003093O004B617465204861697203043O004861743103103O00526F626C6F78636C612O73696372656403093O0050696E6B2048616972030C3O004C6176616E6465724861697203143O00496E7465726E6174696F6E616C204665646F7261030B3O005370656369616C4D65736803053O006D6F75736503083O004765744D6F75736503043O00506C617903093O0042752O746F6E31557003073O00436F2O6E65637403073O004368612O746564030A3O004765745365727669636503103O0055736572496E70757453657276696365030A3O00496E707574426567616E03043O007761697403043O004A756D7003043O0053746F7000A1042O0012193O00013O001219000100023O002001000100010003001208000200043O001208000300054O0005000100034O00045O0002001219000100063O002001000100010007001208000200084O0007000100020002001219000200063O002001000200020007001208000300094O0007000200020002001219000300063O0020010003000300070012080004000A4O0007000300020002001219000400063O0020010004000400070012080005000A4O0007000400020002001219000500063O0020010005000500070012080006000A4O0007000500020002001219000600063O0020010006000600070012080007000B4O00070006000200020010090001000C3O0012190007000E3O00200100070007000F002001000700070010002012000700070011001208000900124O00020007000900020010090001000D0007001219000700143O0020010007000700130020010007000700150010090001001300070010090002000C3O0010090002000D0001001219000700173O002001000700070018001208000800193O001208000900193O001208000A00194O00020007000A0002001009000200160007001219000700173O0020010007000700180012080008001B3O0012080009001B3O001208000A001B4O00020007000A00020010090002001A00070030140002001C001D0012190007001F3O002001000700070007001208000800203O0012080009001B3O001208000A00213O001208000B001B4O00020007000B00020010090002001E00070012190007001F3O0020010007000700070012080008001B3O001208000900233O001208000A001B3O001208000B00244O00020007000B00020010090002002200070010090003000C3O0010090003000D0002003014000300250026001219000700173O002001000700070018001208000800273O001208000900273O001208000A00274O00020007000A00020010090003001600070030140003002800290012190007001F3O0020010007000700070012080008002A3O0012080009001B3O001208000A002B3O001208000B001B4O00020007000B00020010090003001E00070012190007001F3O0020010007000700070012080008001B3O0012080009002C3O001208000A001B3O001208000B002D4O00020007000B0002001009000300220007001219000700143O00200100070007002E00200100070007002F0010090003002E0007003014000300300031001219000700173O0020010007000700180012080008001B3O0012080009001B3O001208000A001B4O00020007000A00020010090003003200070030140003003300340030140003003500360010090004000C3O0010090004000D0002003014000400250026001219000700173O002001000700070018001208000800273O001208000900273O001208000A00274O00020007000A00020010090004001600070030140004002800290012190007001F3O0020010007000700070012080008002A3O0012080009001B3O001208000A00373O001208000B001B4O00020007000B00020010090004001E00070012190007001F3O0020010007000700070012080008001B3O001208000900383O001208000A001B3O001208000B00394O00020007000B0002001009000400220007001219000700143O00200100070007002E00200100070007002F0010090004002E000700301400040030003A001219000700173O0020010007000700180012080008001B3O0012080009001B3O001208000A001B4O00020007000A00020010090004003200070030140004003300340030140004003500360010090005000C3O0010090005000D0002003014000500250026001219000700173O002001000700070018001208000800273O001208000900273O001208000A00274O00020007000A00020010090005001600070030140005002800290012190007001F3O0020010007000700070012080008002A3O0012080009001B3O001208000A003B3O001208000B001B4O00020007000B00020010090005001E00070012190007001F3O0020010007000700070012080008001B3O0012080009003C3O001208000A001B3O001208000B003D4O00020007000B0002001009000500220007001219000700143O00200100070007002E00200100070007002F0010090005002E000700301400050030003E001219000700173O0020010007000700180012080008001B3O0012080009001B3O001208000A001B4O00020007000A00020010090005003200070030140005003F00360030140005003300340030140005003500364O00075O001208000800404O00130007000700080010090006000C00070010090006000D0002001219000700173O002001000700070018001208000800273O0012080009001B3O001208000A001B4O00020007000A0002001009000600160007001219000700173O002001000700070018001208000800413O0012080009001B3O001208000A001B4O00020007000A00020010090006001A00070030140006001C00420012190007001F3O002001000700070007001208000800433O0012080009001B3O001208000A00443O001208000B001B4O00020007000B00020010090006001E00070012190007001F3O0020010007000700070012080008001B3O001208000900343O001208000A001B3O001208000B00344O00020007000B0002001009000600220007001219000700143O00200100070007002E00200100070007002F0010090006002E0007003014000600300045001219000700173O002001000700070018001208000800273O001208000900273O001208000A00274O00020007000A00020010090006003200070030140006003F0036003014000600330046003014000600350036001219000700473O00200100070007000F0020010007000700100020010007000700122O000D000700074O000D000800076O00095O001208000A00404O001300090009000A2O000D00080008000900200100090008004800201200090009004900060E000B3O000100016O00074O000B0009000B00010012190009004A3O00201200090009004B001208000B004C4O00020009000B0002000611000900142O013O00040C3O00142O010012190009004A3O00200100090009004C00201200090009004D2O0006000900020001001219000900063O002001000900090007001208000A004F3O001219000B004A4O00020009000B00020012170009004E3O0012190009004E3O0030140009000C004C001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B0002001217000900503O001219000900503O001219000A000E3O002001000A000A000F002001000A000A0010002001000A000A004E002001000A000A0052002001000A000A001E0010090009001E000A001219000900503O001219000A00533O002001000A000A0007001208000B00543O001208000C00543O001208000D00294O0002000A000D000200100900090022000A001219000900503O003014000900550029001219000900503O0030140009000C0050001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B0002001217000900563O001219000900563O001219000A00503O002001000A000A001E0010090009001E000A001219000900563O001219000A00533O002001000A000A0007001208000B00543O001208000C00543O001208000D00294O0002000A000D000200100900090022000A001219000900563O0030140009000C0056001219000900563O003014000900550029001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B0002001217000900523O001219000900523O001219000A00503O002001000A000A001E0010090009001E000A001219000900523O001219000A00533O002001000A000A0007001208000B00543O001208000C00293O001208000D00294O0002000A000D000200100900090022000A001219000900523O0030140009000C0052001219000900523O003014000900550029001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B0002001217000900573O001219000900573O001219000A00503O002001000A000A001E0010090009001E000A001219000900573O001219000A00533O002001000A000A0007001208000B00293O001208000C00543O001208000D00294O0002000A000D000200100900090022000A001219000900573O0030140009000C0058001219000900573O003014000900550029001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B0002001217000900593O001219000900593O001219000A00503O002001000A000A001E0010090009001E000A001219000900593O001219000A00533O002001000A000A0007001208000B00293O001208000C00543O001208000D00294O0002000A000D000200100900090022000A001219000900593O0030140009000C005A001219000900593O003014000900550029001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B00020012170009005B3O0012190009005B3O001219000A00503O002001000A000A001E0010090009001E000A0012190009005B3O001219000A00533O002001000A000A0007001208000B00293O001208000C00543O001208000D00294O0002000A000D000200100900090022000A0012190009005B3O0030140009000C005C0012190009005B3O003014000900550029001219000900063O002001000900090007001208000A00513O001219000B004E4O00020009000B00020012170009005D3O0012190009005D3O001219000A00503O002001000A000A001E0010090009001E000A0012190009005D3O001219000A00533O002001000A000A0007001208000B00293O001208000C00543O001208000D00294O0002000A000D000200100900090022000A0012190009005D3O0030140009000C005E0012190009005D3O003014000900550029001219000900063O002001000900090007001208000A00603O001219000B00564O00020009000B00020012170009005F3O0012190009005F3O001219000A00563O00100900090061000A0012190009005F3O001219000A00523O00100900090062000A0012190009005F3O0030140009000C005F0012190009005F3O001219000A00643O002001000A000A0007001208000B001B3O001208000C00293O001208000D001B3O001208000E00653O001208000F001B3O0012080010001B3O0012080011001B3O0012080012001B3O001208001300293O0012080014001B3O001208001500293O001208001600664O0002000A0016000200100900090063000A0012190009005F3O001219000A00643O002001000A000A0007001208000B001B3O001208000C00683O001208000D001B3O001208000E00653O001208000F001B3O0012080010001B3O0012080011001B3O0012080012001B3O001208001300293O0012080014001B3O001208001500293O001208001600664O0002000A0016000200100900090067000A0012190009005F3O00301400090069006A001219000900063O002001000900090007001208000A00603O001219000B00564O00020009000B00020012170009006B3O0012190009006B3O001219000A00563O00100900090061000A0012190009006B3O001219000A00573O00100900090062000A0012190009006B3O0030140009000C006B0012190009006B3O001219000A00643O002001000A000A0007001208000B00653O001208000C00653O001208000D001B3O001208000E001B3O001208000F001B3O001208001000653O0012080011001B3O001208001200293O0012080013001B3O001208001400293O0012080015001B3O0012080016001B4O0002000A0016000200100900090063000A0012190009006B3O001219000A00643O002001000A000A0007001208000B00683O001208000C00293O001208000D001B3O001208000E001B3O001208000F001B3O001208001000653O0012080011001B3O001208001200293O0012080013001B3O001208001400293O0012080015001B3O0012080016001B4O0002000A0016000200100900090067000A0012190009006B3O00301400090069006A001219000900063O002001000900090007001208000A00603O001219000B00564O00020009000B00020012170009006C3O0012190009006C3O001219000A00563O00100900090061000A0012190009006C3O001219000A00593O00100900090062000A0012190009006C3O0030140009000C006C0012190009006C3O001219000A00643O002001000A000A0007001208000B00293O001208000C00653O001208000D001B3O001208000E001B3O001208000F001B3O001208001000293O0012080011001B3O001208001200293O001208001300663O001208001400653O0012080015001B3O0012080016001B4O0002000A0016000200100900090063000A0012190009006C3O001219000A00643O002001000A000A0007001208000B006D3O001208000C00293O001208000D001B3O001208000E001B3O001208000F001B3O001208001000293O0012080011001B3O001208001200293O001208001300663O001208001400653O0012080015001B3O0012080016001B4O0002000A0016000200100900090067000A0012190009006C3O00301400090069006A001219000900063O002001000900090007001208000A00603O001219000B00564O00020009000B00020012170009006E3O0012190009006E3O001219000A00563O00100900090061000A0012190009006E3O001219000A005B3O00100900090062000A0012190009006E3O0030140009000C006E0012190009006E3O001219000A00643O002001000A000A0007001208000B00653O001208000C006D3O001208000D001B3O001208000E001B3O001208000F001B3O001208001000653O0012080011001B3O001208001200293O0012080013001B3O001208001400293O0012080015001B3O0012080016001B4O0002000A0016000200100900090063000A0012190009006E3O001219000A00643O002001000A000A0007001208000B006D3O001208000C006D3O001208000D001B3O001208000E001B3O001208000F001B3O001208001000653O0012080011001B3O001208001200293O0012080013001B3O001208001400293O0012080015001B3O0012080016001B4O0002000A0016000200100900090067000A0012190009006E3O00301400090069006A001219000900063O002001000900090007001208000A00603O001219000B00564O00020009000B00020012170009006F3O0012190009006F3O001219000A00563O00100900090061000A0012190009006F3O001219000A005D3O00100900090062000A0012190009006F3O0030140009000C006F0012190009006F3O001219000A00643O002001000A000A0007001208000B00293O001208000C006D3O001208000D001B3O001208000E001B3O001208000F001B3O001208001000293O0012080011001B3O001208001200293O001208001300663O001208001400653O0012080015001B3O0012080016001B4O0002000A0016000200100900090063000A0012190009006F3O001219000A00643O002001000A000A0007001208000B00683O001208000C006D3O001208000D001B3O001208000E001B3O001208000F001B3O001208001000293O0012080011001B3O001208001200293O001208001300663O001208001400653O0012080015001B3O0012080016001B4O0002000A0016000200100900090067000A0012190009006F3O00301400090069006A001219000900063O002001000900090007001208000A00603O001219000B00564O00020009000B0002001217000900703O001219000900703O001219000A00503O00100900090061000A001219000900703O001219000A00563O00100900090062000A001219000900703O0030140009000C0070001219000900703O001219000A00643O002001000A000A0007001208000B001B3O001208000C001B3O001208000D001B3O001208000E00653O001208000F001B3O0012080010001B3O0012080011001B3O0012080012001B3O001208001300293O0012080014001B3O001208001500293O001208001600664O0002000A0016000200100900090063000A001219000900703O001219000A00643O002001000A000A0007001208000B001B3O001208000C001B3O001208000D001B3O001208000E00653O001208000F001B3O0012080010001B3O0012080011001B3O0012080012001B3O001208001300293O0012080014001B3O001208001500293O001208001600664O0002000A0016000200100900090067000A001219000900703O00301400090069006A001219000900063O002001000900090007001208000A00713O001219000B004E4O00020009000B0002001217000900713O001219000900063O002001000900090007001208000A00733O001219000B00744O00020009000B0002001217000900723O001219000900723O0030140009007500760012190009004E3O002012000900090011001208000B00714O00020009000B0002001217000900773O001219000900773O002012000900090079001219000B00724O00020009000B0002001217000900783O001219000900063O002001000900090007001208000A00733O001219000B00744O00020009000B00020012170009007A3O0012190009007A3O00301400090075007B0012190009004E3O002012000900090011001208000B00714O00020009000B0002001217000900773O001219000900773O002012000900090079001219000B007A4O00020009000B00020012170009007C3O001219000900063O002001000900090007001208000A00733O001219000B00744O00020009000B00020012170009007D3O0012190009007D3O00301400090075007E0012190009004E3O002012000900090011001208000B00714O00020009000B0002001217000900773O001219000900773O002012000900090079001219000B007D4O00020009000B00020012170009007F3O001219000900063O002001000900090007001208000A00733O001219000B00744O00020009000B00020012170009007D3O0012190009007D3O0030140009007500800012190009004E3O002012000900090011001208000B00714O00020009000B0002001217000900773O001219000900773O002012000900090079001219000B007D4O00020009000B0002001217000900813O001219000900063O002001000900090007001208000A00733O001219000B00744O00020009000B0002001217000900823O001219000900823O0030140009007500830012190009004E3O002012000900090011001208000B00714O00020009000B0002001217000900773O001219000900773O002012000900090079001219000B00824O00020009000B0002001217000900843O0012190009000E3O00200100090009000F002001000900090010001217000900853O001219000900853O00200100090009004E002001000900090086002001000900090087002001000900090088001219000A005B3O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009008600200100090009008700200100090009008900201200090009004D2O0006000900020001001219000900853O00200100090009004E002001000900090086002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A00010002001219000B00643O002001000B000B008A001219000C00023O002001000C000C008B001208000D008C4O0007000C00020002001208000D001B3O001208000E001B4O0002000B000E00022O0016000A000A000B00100900090063000A001219000900853O00200100090009004E002001000900090086002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O00200100090009004E00200100090009008D002001000900090087002001000900090088001219000A005D3O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009008D00200100090009008700200100090009008900201200090009004D2O0006000900020001001219000900853O00200100090009004E00200100090009008D002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A00010002001219000B00643O002001000B000B008A001219000C00023O002001000C000C008B001208000D008C4O0007000C00020002001208000D001B3O001208000E001B4O0002000B000E00022O0016000A000A000B00100900090063000A001219000900853O00200100090009004E00200100090009008D002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O00200100090009004E00200100090009008E002001000900090087002001000900090088001219000A00593O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009008E00200100090009008700200100090009008900201200090009004D2O0006000900020001001219000900853O00200100090009004E00200100090009008E002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A00010002001219000B00643O002001000B000B008A001219000C00023O002001000C000C008B001208000D008C4O0007000C00020002001208000D001B3O001208000E001B4O0002000B000E00022O0016000A000A000B00100900090063000A001219000900853O00200100090009004E00200100090009008E002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O00200100090009004E00200100090009008F002001000900090087002001000900090088001219000A00573O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009008F00200100090009008700200100090009008900201200090009004D2O0006000900020001001219000900853O00200100090009004E00200100090009008F002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A00010002001219000B00643O002001000B000B008A001219000C00023O002001000C000C008B001208000D008C4O0007000C00020002001208000D001B3O001208000E001B4O0002000B000E00022O0016000A000A000B00100900090063000A001219000900853O00200100090009004E00200100090009008F002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O00200100090009004E002001000900090090002001000900090087002001000900090088001219000A00563O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009009000200100090009008700200100090009008900201200090009004D2O0006000900020001001219000900853O00200100090009004E002001000900090090002001000900090087002001000900090088001219000A00643O002001000A000A0007001208000B006D3O001208000C001B3O001208000D001B4O0002000A000D0002001219000B00643O002001000B000B008A001219000C00023O002001000C000C008B001208000D008C4O0007000C00020002001208000D001B3O001208000E001B4O0002000B000E00022O0016000A000A000B00100900090063000A001219000900853O00200100090009004E002001000900090090002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O00200100090009004E002001000900090091002001000900090087002001000900090088001219000A00563O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009009100200100090009008700200100090009008900201200090009004D2O0006000900020001001219000900853O00200100090009004E002001000900090091002001000900090087002001000900090088001219000A00643O002001000A000A0007001208000B00683O001208000C001B3O001208000D001B4O0002000A000D0002001219000B00643O002001000B000B008A001219000C00023O002001000C000C008B001208000D008C4O0007000C00020002001208000D001B3O001208000E001B4O0002000B000E00022O0016000A000A000B00100900090063000A001219000900853O00200100090009004E002001000900090091002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O00200100090009004E002001000900090092002001000900090087002001000900090088001219000A00523O00100900090062000A001219000900853O00200100090009004E00200100090009004F00200100090009009200200100090009008700200100090009009300201200090009004D2O0006000900020001001219000900853O00200100090009004E002001000900090092002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090063000A001219000900853O00200100090009004E002001000900090092002001000900090087002001000900090088001219000A00643O002001000A000A00072O000A000A0001000200100900090067000A001219000900853O0020120009000900952O0007000900020002001217000900943O0012190009007C3O0020120009000900962O0006000900020001001219000900943O002001000900090097002012000900090098000203000B00014O000B0009000B0001001219000900853O002001000900090099002012000900090098000203000B00024O000B0009000B00010012190009000E3O00201200090009009A001208000B009B4O00020009000B0002002001000A0009009C002012000A000A0098000203000C00034O000B000A000C0001001219000A009D4O000A000A00010002000611000A00A004013O00040C3O00A00401001219000A00853O002001000A000A004E002001000A000A0071002001000A000A009E00261A000A008C0401003600040C3O008C0401001219000A004E3O002001000A000A0071003014000A009E0036001219000A00813O002012000A000A009F2O0006000A00020001001219000A007F3O002012000A000A009F2O0006000A0002000100040C3O008C04012O000F3O00013O00043O00023O0003073O00456E61626C6564012O00034O00157O0030143O000100022O000F3O00017O00033O00473O00473O00483O00113O0003063O0064616E63653303043O0053746F7003063O0064616E63653403063O0064616E63653203053O0064616E636503043O00506C617903083O0048756D616E6F696403063O004D6F7665546F03073O00566563746F72332O033O006E657703053O006D6F7573652O033O0048697403013O005803013O005903013O005A030E3O004D6F7665546F46696E697368656403043O005761697400263O0012193O00013O0020125O00022O00063O000200010012193O00033O0020125O00022O00063O000200010012193O00043O0020125O00022O00063O000200010012193O00053O0020125O00062O00063O000200010012193O00073O0020125O0008001219000200093O00200100020002000A0012190003000B3O00200100030003000C00200100030003000D0012190004000B3O00200100040004000C00200100040004000E0012190005000B3O00200100050005000C00200100050005000F2O0005000200054O00185O00010012193O00073O0020015O00100020125O00112O00063O000200010012193O00053O0020125O00022O00063O000200010012193O00043O0020125O00062O00063O000200012O000F3O00017O00263O00D03O00D03O00D03O00D13O00D13O00D13O00D23O00D23O00D23O00D33O00D33O00D33O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D43O00D53O00D53O00D53O00D53O00D63O00D63O00D63O00D73O00D73O00D73O00D83O000B3O0003053O006D6174636803083O002F652064616E636503043O006D61746803063O0072616E646F6D026O00F03F027O004003063O0064616E63653403043O0053746F7003063O0064616E63653203063O0064616E63653303043O00506C617901203O00201200013O0001001208000300024O00020001000300020006110001001F00013O00040C3O001F0001001219000100033O002001000100010004001208000200053O001208000300064O000200010003000200261A000100160001000500040C3O00160001001219000100073O0020120001000100082O0006000100020001001219000100093O0020120001000100082O00060001000200010012190001000A3O00201200010001000B2O000600010002000100040C3O001F00010012190001000A3O0020120001000100082O0006000100020001001219000100093O0020120001000100082O0006000100020001001219000100073O00201200010001000B2O00060001000200012O000F3O00017O00203O00DA3O00DA3O00DA3O00DA3O00DA3O00DB3O00DB3O00DB3O00DB3O00DB3O00DB3O00DB3O00DD3O00DD3O00DD3O00DE3O00DE3O00DE3O00DF3O00DF3O00DF3O00E03O00E23O00E23O00E23O00E33O00E33O00E33O00E43O00E43O00E43O00E73O000A3O0003073O004B6579436F646503043O00456E756D03013O005603063O0064616E63653203043O0053746F7003063O0064616E63653503043O00706C617903073O0053746F2O70656403043O005761697403043O00506C617901143O00200100013O0001001219000200023O002001000200020001002001000200020003000610000100130001000200040C3O00130001001219000100043O0020120001000100052O0006000100020001001219000100063O0020120001000100072O0006000100020001001219000100063O0020010001000100080020120001000100092O0006000100020001001219000100043O00201200010001000A2O00060001000200012O000F3O00017O00143O00EA3O00EA3O00EA3O00EA3O00EA3O00EA3O00EB3O00EB3O00EB3O00EC3O00EC3O00EC3O00ED3O00ED3O00ED3O00ED3O00EE3O00EE3O00EE3O00F03O00A1042O00013O00013O00013O00013O00013O00013O00013O00023O00023O00023O00023O00033O00033O00033O00033O00043O00043O00043O00043O00053O00053O00053O00053O00063O00063O00063O00063O00073O00073O00073O00073O00083O00093O00093O00093O00093O00093O00093O00093O000A3O000A3O000A3O000A3O000B3O000C3O000D3O000D3O000D3O000D3O000D3O000D3O000D3O000E3O000E3O000E3O000E3O000E3O000E3O000E3O000F3O00103O00103O00103O00103O00103O00103O00103O00103O00113O00113O00113O00113O00113O00113O00113O00113O00123O00133O00143O00153O00153O00153O00153O00153O00153O00153O00163O00173O00173O00173O00173O00173O00173O00173O00173O00183O00183O00183O00183O00183O00183O00183O00183O00193O00193O00193O00193O001A3O001B3O001B3O001B3O001B3O001B3O001B3O001B3O001C3O001D3O001E3O001F3O00203O00213O00213O00213O00213O00213O00213O00213O00223O00233O00233O00233O00233O00233O00233O00233O00233O00243O00243O00243O00243O00243O00243O00243O00243O00253O00253O00253O00253O00263O00273O00273O00273O00273O00273O00273O00273O00283O00293O002A3O002B3O002C3O002D3O002D3O002D3O002D3O002D3O002D3O002D3O002E3O002F3O002F3O002F3O002F3O002F3O002F3O002F3O002F3O00303O00303O00303O00303O00303O00303O00303O00303O00313O00313O00313O00313O00323O00333O00333O00333O00333O00333O00333O00333O00343O00353O00363O00373O00373O00373O00373O00383O00393O00393O00393O00393O00393O00393O00393O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003B3O003C3O003C3O003C3O003C3O003C3O003C3O003C3O003C3O003D3O003D3O003D3O003D3O003D3O003D3O003D3O003D3O003E3O003E3O003E3O003E3O003F3O00403O00403O00403O00403O00403O00403O00403O00413O00423O00433O00443O00443O00443O00443O00443O00453O00453O00453O00453O00453O00463O00463O00483O00483O00463O00493O00493O00493O00493O00493O00493O004A3O004A3O004A3O004A3O004C3O004C3O004C3O004C3O004C3O004C3O004D3O004D3O004E3O004E3O004E3O004E3O004E3O004E3O004F3O004F3O004F3O004F3O004F3O004F3O004F3O004F3O00503O00503O00503O00503O00503O00503O00503O00503O00513O00513O00523O00523O00533O00533O00533O00533O00533O00533O00543O00543O00543O00543O00553O00553O00553O00553O00553O00553O00553O00553O00563O00563O00573O00573O00583O00583O00583O00583O00583O00583O00593O00593O00593O00593O005A3O005A3O005A3O005A3O005A3O005A3O005A3O005A3O005B3O005B3O005C3O005C3O005D3O005D3O005D3O005D3O005D3O005D3O005E3O005E3O005E3O005E3O005F3O005F3O005F3O005F3O005F3O005F3O005F3O005F3O00603O00603O00613O00613O00623O00623O00623O00623O00623O00623O00633O00633O00633O00633O00643O00643O00643O00643O00643O00643O00643O00643O00653O00653O00663O00663O00673O00673O00673O00673O00673O00673O00683O00683O00683O00683O00693O00693O00693O00693O00693O00693O00693O00693O006A3O006A3O006B3O006B3O006C3O006C3O006C3O006C3O006C3O006C3O006D3O006D3O006D3O006D3O006E3O006E3O006E3O006E3O006E3O006E3O006E3O006E3O006F3O006F3O00703O00703O00713O00713O00713O00713O00713O00713O00723O00723O00723O00733O00733O00733O00743O00743O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00753O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00763O00773O00773O00783O00783O00783O00783O00783O00783O00793O00793O00793O007A3O007A3O007A3O007B3O007B3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007C3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007D3O007E3O007E3O007F3O007F3O007F3O007F3O007F3O007F3O00803O00803O00803O00813O00813O00813O00823O00823O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00833O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00843O00853O00853O00863O00863O00863O00863O00863O00863O00873O00873O00873O00883O00883O00883O00893O00893O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008A3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008B3O008C3O008C3O008D3O008D3O008D3O008D3O008D3O008D3O008E3O008E3O008E3O008F3O008F3O008F3O00903O00903O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00913O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00923O00933O00933O00943O00943O00943O00943O00943O00943O00953O00953O00953O00963O00963O00963O00973O00973O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00983O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O00993O009A3O009A3O009B3O009B3O009B3O009B3O009B3O009B3O009C3O009C3O009C3O009C3O009C3O009C3O009D3O009D3O009E3O009E3O009E3O009E3O009E3O009F3O009F3O009F3O009F3O009F3O00A03O00A03O00A03O00A03O00A03O00A03O00A13O00A13O00A23O00A23O00A23O00A23O00A23O00A33O00A33O00A33O00A33O00A33O00A43O00A43O00A43O00A43O00A43O00A43O00A53O00A53O00A63O00A63O00A63O00A63O00A63O00A73O00A73O00A73O00A73O00A73O00A83O00A83O00A83O00A83O00A83O00A83O00A93O00A93O00AA3O00AA3O00AA3O00AA3O00AA3O00AB3O00AB3O00AB3O00AB3O00AB3O00AC3O00AC3O00AC3O00AC3O00AC3O00AC3O00AD3O00AD3O00AE3O00AE3O00AE3O00AE3O00AE3O00AF3O00AF3O00AF3O00AF3O00AF3O00B03O00B03O00B03O00B03O00B13O00B13O00B13O00B13O00B13O00B13O00B13O00B23O00B23O00B23O00B23O00B23O00B23O00B23O00B23O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B33O00B43O00B43O00B43O00B43O00B43O00B43O00B43O00B43O00B43O00B53O00B53O00B53O00B53O00B53O00B53O00B53O00B63O00B63O00B63O00B63O00B63O00B63O00B63O00B63O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B73O00B83O00B83O00B83O00B83O00B83O00B83O00B83O00B83O00B83O00B93O00B93O00B93O00B93O00B93O00B93O00B93O00BA3O00BA3O00BA3O00BA3O00BA3O00BA3O00BA3O00BA3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BB3O00BC3O00BC3O00BC3O00BC3O00BC3O00BC3O00BC3O00BC3O00BC3O00BD3O00BD3O00BD3O00BD3O00BD3O00BD3O00BD3O00BE3O00BE3O00BE3O00BE3O00BE3O00BE3O00BE3O00BE3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00BF3O00C03O00C03O00C03O00C03O00C03O00C03O00C03O00C03O00C03O00C13O00C13O00C13O00C13O00C13O00C13O00C13O00C23O00C23O00C23O00C23O00C23O00C23O00C23O00C23O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C33O00C43O00C43O00C43O00C43O00C43O00C43O00C43O00C43O00C43O00C53O00C53O00C53O00C53O00C53O00C53O00C53O00C63O00C63O00C63O00C63O00C63O00C63O00C63O00C63O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C73O00C83O00C83O00C83O00C83O00C83O00C83O00C83O00C83O00C83O00C93O00C93O00C93O00C93O00C93O00C93O00C93O00CA3O00CA3O00CA3O00CA3O00CA3O00CA3O00CA3O00CA3O00CB3O00CB3O00CB3O00CB3O00CB3O00CB3O00CB3O00CB3O00CB3O00CC3O00CC3O00CC3O00CC3O00CC3O00CC3O00CC3O00CC3O00CC3O00CD3O00CD3O00CD3O00CD3O00CE3O00CE3O00CE3O00CF3O00CF3O00CF3O00D83O00CF3O00D93O00D93O00D93O00E73O00D93O00E83O00E83O00E83O00E83O00E93O00E93O00F03O00E93O00F13O00F13O00F13O00F13O00F23O00F23O00F23O00F23O00F23O00F23O00F33O00F33O00F33O00F43O00F43O00F43O00F53O00F53O00F53O00F63O00F73O00",v8());
