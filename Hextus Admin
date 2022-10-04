-- Gui to Lua
-- Version: 3.2

-- Instances:

_G.load = game:IsLoaded()

if (_G.load == true) then 
    
    local Admin = {
        Commands = {},
        Functions = {},
        Utilities = {},
        NormalPrefix = "/"
    }
    
    local spawnpos = nil
    
    local Args = nil
    
    local Settings = {
        CommandBarPrefix = ";"
    }
    
    local plr_ = game:GetService("Players").LocalPlayer
    local LocalPlayer = plr_
    local character = plr_.Character or plr_["CharacterAdded"]:Wait()
    local Mouse = plr_:GetMouse()
    local Players = game:GetService("Players") -- woops forgot to define players
    
    local MainUI = Instance.new("ScreenGui")
    local CommandBar = Instance.new("Frame")
    local Bar = Instance.new("Frame")
    local Arrow = Instance.new("TextLabel")
    local CommandInput = Instance.new("TextBox")
    
    --Properties:
    
    MainUI.Name = "MainUI"
    MainUI.Parent = game:GetService("CoreGui")
     --.LocalPlayer:FindFirstChild("PlayerGui")
    MainUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    CommandBar.Name = "CommandBar"
    CommandBar.Parent = MainUI
    CommandBar.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
    CommandBar.BorderSizePixel = 0
    CommandBar.Position = UDim2.new(0.280887544, 0, 0.949379265, 0)
    CommandBar.Size = UDim2.new(0, 564, 0, 37)
    
    Bar.Name = "Bar"
    Bar.Parent = CommandBar
    Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Bar.BackgroundTransparency = 1.000
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0.0124113476, 0, 0, 0)
    Bar.Size = UDim2.new(0, 550, 0, 37)
    
    Arrow.Name = "Arrow"
    Arrow.Parent = Bar
    Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.BackgroundTransparency = 1.000
    Arrow.Position = UDim2.new(0, 0, 0.297297299, 0)
    Arrow.Size = UDim2.new(0, 76, 0, 14)
    Arrow.Font = Enum.Font.SourceSans
    Arrow.Text = "?"
    Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.TextSize = 18.000
    Arrow.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    
    CommandInput.Name = "CommandInput"
    CommandInput.Parent = Bar
    CommandInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CommandInput.BackgroundTransparency = 1.000
    CommandInput.Position = UDim2.new(0.105454542, 0, 0.297297299, 0)
    CommandInput.Size = UDim2.new(0, 480, 0, 13)
    CommandInput.Font = Enum.Font.SourceSans
    CommandInput.Text = ""
    CommandInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    CommandInput.TextSize = 18.000
    
    Mouse.KeyDown:Connect(
        function(Pressed)
            if Pressed == Settings.CommandBarPrefix then
                CommandInput:CaptureFocus()
                repeat
                    task.wait()
                until CommandInput.Text ~= ""
                CommandInput.Text = ""
            end
        end
    )
    
    Chatted =
        plr_.Chatted:Connect(
        function(msg)
            msg = msg:lower()
            Args = msg:split(" ")
            for index, cmd in pairs(Admin.Commands) do
                if Args[1] == "/e " then
                    table.remove(Args, 1)
                end
                if Args[1] == Admin.NormalPrefix .. cmd[1]:lower() then
                    cmd[3]()
                end
            end
        end
    )
    
    CommandInput.FocusLost:Connect(
        function()
            local msg = CommandInput.Text:lower()
            Args = msg:split(" ")
            for index, cmd in pairs(Admin.Commands) do
                if Args[1] == cmd[1]:lower() then
                    print(msg)
                    cmd[3]()
                end
            end
        end
    )
    
    function CreateCommand(Name, Desc, Func)
        table.insert(Admin.Commands, {Name, Desc, Func})
    end
    
    function GetPlayer(String)
        local toreturn = {}
        if String:lower() == "all" or String:lower() == "others" then
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= LocalPlayer then
                    table.insert(toreturn, v)
                end
            end
        else
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if
                    v.Name:sub(1, #String):lower() == String:lower() or
                        v.DisplayName:sub(1, #String):lower() == String:lower()
                 then
                    return {v}
                end
            end
        end
        return toreturn
    end
    
    local getCharacter = function(Char)
        local Character = Char or LocalPlayer.Character
        return Character
    end
    
    local function sprays(int)
        local LocalPlayer = game:GetService("Players").LocalPlayer
        int = int or #game:GetService("Players"):GetPlayers()
        local Dropped = {}
        for i = 1, int do
            firetouchinterest(LocalPlayer.Character.Head, workspace["Handle"], 0)
            firetouchinterest(LocalPlayer.Character.Head, workspace["Handle"], 1)
            repeat
                game:GetService("RunService").Heartbeat:wait()
            until LocalPlayer.Character:FindFirstChildOfClass("Tool") ~= nil
            local grabbed = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            table.insert(Dropped, grabbed)
            grabbed.Parent = workspace
        end
        for i, v in pairs(Dropped) do
            LocalPlayer.Character.Humanoid:EquipTool(v)
        end
        task.wait()
        LocalPlayer.Character.Humanoid:UnequipTools()
        return Dropped
    end
    
    local getRoot = function(Plr)
        return Plr and getCharacter(Plr):FindFirstChild("HumanoidRootPart") or
            getCharacter():FindFirstChild("HumanoidRootPart")
    end
    
    local getPos = function()
        local cf, pos = getRoot().CFrame, getRoot().Position
        return cf or pos
    end
    
    local fakeHumanoid = function(Humanoid)
        local Humanoid = Humanoid or plr_.Character:FindFirstChildOfClass("Humanoid")
        local Clone = Humanoid:Clone()
        Clone.Parent = plr_.Character
        Humanoid:Destroy()
        return Humanoid
    end
    
    local attach_part = function(x, y, b)
        firetouchinterest(x, y, b)
    end
    
    CreateCommand(
        "walkspeed",
        "walkspeeds LocalPlayer",
        function()
            LocalPlayer.Character.Humanoid.WalKSpeed = tonumber(Args[2])
        end
    )
    
    CreateCommand(
        "jp",
        "jumpower",
        function()
            LocalPlayer.Character.Humanoid.JumpPower = tonumber(Args[2])
        end
    )
    
    CreateCommand(
        "hh",
        "hipheights localplayer",
        function()
            LocalPlayer.Character.Humanoid.HipHeight = tonumber(Args[2])
        end
    )
    
    function onAvatarChanger()
        local humdesc = game.Players:GetHumanoidDescriptionFromUserId(game.Players.LocalPlayer.UserId)
        humdesc.RunAnimation = 10901036755
        local Char = game.Players:CreateHumanoidModelFromUserId(game.Players.LocalPlayer.UserId)
        
        Char.PrimaryPart.Anchored = true
        
        Char.Parent = game.Workspace
        
        Char:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.PrimaryPart.CFrame + Vector3.new(0,5,0))
        
        game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
        
        local hum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        
        hum:ApplyDescription(humdesc)
    end
    
    CreateCommand(
        "ccc", "client character changer", function()
            onAvatarChanger()
        end
    )
    
    CreateCommand(
        "dupesprays",
        "dupe(s) the spray(s) from fencing",
        function()
            local Amount = tonumber(Args[2])
            Service =
                setmetatable(
                {
                    Get = function(Self, Serv)
                        if Service[Serv] then
                            return Service[Serv]
                        end
                        local S = game:GetService(Serv)
                        if S then
                            Service[Serv] = S
                        end
                        return S
                    end
                },
                {
                    __index = function(Self, Index)
                        local S = game:GetService(Index)
                        if S then
                            Service[Index] = S
                        end
                        return S
                    end
                }
            )
    
            workspace["FallenPartsDestroyHeight"] = 0 / 1 / 0
    
            local Create = function(Class, Parent)
                local Inst = Instance.new(Class)
                Inst["Parent"] = Parent
                return Inst
            end
    
            print("Hi! - Synttax :D")
    
            local LP = Service["Players"].LocalPlayer
            local Char = LP["Character"]
    
            Char:BreakJoints()
            LP.CharacterAdded:Wait()
            Char = LP["Character"]
            wait(.2)
    
            local Yield = Instance.new("BindableEvent")
    
            local C =
                Char.ChildAdded:Connect(
                function(Obj)
                    if rawequal(Obj["Name"], "Spray") then
                        Yield:Fire()
                    end
                end
            )
    
            local Root, Humanoid = Char["HumanoidRootPart"], Char["Humanoid"]
    
            Root["CFrame"] = CFrame.new(-137.723511, 3.4000001, -57.1764297)
    
            local Sprays = {}
    
            for I = 1, Amount + 1 do
                firetouchinterest(Root, workspace["Handle"], 0)
                firetouchinterest(Root, workspace["Handle"], 1)
                Yield["Event"]:Wait()
                Service["RunService"].Heartbeat:Wait()
                table.insert(Sprays, Char["Spray"])
                Char["Spray"].Parent = workspace
            end
    
            Yield:Destroy()
            C:Disconnect()
    
            for K, V in next, Sprays do
                Humanoid:EquipTool(V)
            end
    
            Root["Anchored"] = true
    
            wait(.6)
            Humanoid:UnequipTools()
    
            for K, V in next, Sprays do
                V["Parent"] = Char
            end
    
            Root["Anchored"] = false
        end
    )
    
    CreateCommand(
        "stealtools",
        "steals the player's tools from workspace",
        function()
            workspace.ChildAdded:Connect(
                function(object)
                    if object:IsA("Tool") and object.Name == "Boombox" or object.Name == "Foil" then
                        object.Parent = LocalPlayer.Character
                    end
                end
            )
        end
    )
    
    CreateCommand(
        "kill",
        "tool kill's player",
        function()
            local Target = GetPlayer(Args[2])
            local OldPos = getRoot().CFrame
            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            for i, v in next, Target do
                repeat
                    local Clone = Humanoid:Clone()
                    Clone.Parent = LocalPlayer.Character
                    getCharacter().Animate.Disabled = true
                    getCharacter().Animate.Disabled = false
                    game:GetService("Players").LocalPlayer.Character.Humanoid:Destroy()
                    Clone:ChangeState(15)
                    local TargRoot = getRoot(v)
                    local Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    Tool.Parent = LocalPlayer.Character
                    firetouchinterest(Tool.Handle, v.Character.HumanoidRootPart, 0)
                    firetouchinterest(Tool.Handle, v.Character.HumanoidRootPart, 1)
                    v.Character.Humanoid:ChangeState(15)
                    task.wait()
                until true
            end
            LocalPlayer.CharacterAdded:Wait()
            repeat
                task.wait()
                LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = OldPos
            until getRoot().CFrame == OldPos
        end
    )
    
    CreateCommand(
        "skill",
        "server kill",
        function()
            local OldPos = getRoot().CFrame
            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            for i, v in next, game:service("Players"):GetPlayers() do
                repeat
                    if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                    end
                    local Clone = Humanoid:Clone()
                    Clone.Parent = LocalPlayer.Character
                    getCharacter().Animate.Disabled = true
                    getCharacter().Animate.Disabled = false
                    game:GetService("Players").LocalPlayer.Character.Humanoid:Destroy()
                    Clone:ChangeState(15)
                    local TargRoot = getRoot(v)
                    local Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    Tool.Parent = LocalPlayer.Character
                    firetouchinterest(Tool.Handle, v.Character.HumanoidRootPart, 0)
                    firetouchinterest(Tool.Handle, v.Character.HumanoidRootPart, 1)
                    v.Character.Humanoid:ChangeState(15)
                    task.wait()
                until true
            end
            LocalPlayer.CharacterAdded:Wait()
            repeat
                task.wait()
                LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = OldPos
            until getRoot().CFrame == OldPos
        end
    )
    
    CreateCommand(
        "firecd",
        "fire click detector tool(s)",
        function()
            local amount = 0
            local howmany = Args[2]
            for i, v in next, Workspace:GetDescendants() do
                if (v:IsA("ClickDetector")) then
                    fireclickdetector(v)
                    amount = amount + 1
                    if (howmany and amount == tonumber(howmany)) then
                        break
                    end
                end
            end
        end
    )

    CreateCommand("droptools", "dupe/'n drop tools", function()
        local ToolNames = { 'LinkedSword3' }
        local Target = workspace.Base
        
        -- DO NOT MODIFY BELOW --
        
        local LocalPlayer = game:GetService'Players'.LocalPlayer
        
        if not LocalPlayer.Character then return end
        
        local Humanoid = LocalPlayer.Character:FindFirstChildOfClass'Humanoid' if not Humanoid then return end
        
        Humanoid:UnequipTools()
        
        local OldParent = Target.Parent
        
        Target.Parent = LocalPlayer.Character

        print(Target.Parent)
        
        for _, Tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            for _, Name in pairs(ToolNames) do
                if Tool.Name:lower():sub(1, #Name) == Name:lower() then
                    Humanoid:EquipTool(Tool)
                    warn"ya"
                    Tool.Parent = game:GetService"Lighting"
                    Humanoid:EquipTool(Tool)
                    Tool.Parent = Target
                    Tool.Parent = LocalPlayer.Backpack
                    Tool.Parent = game:GetService"Lighting"
                    print"Done."
                end
            end
        end
        
        Target.Parent = OldParent
    end) 
    
    CreateCommand(
        "sprays",
        "dupe(s) the fencing spray(s)",
        function()
            sprays(Args[2])
        end
    )
    
    local tool = nil
    
    CreateCommand(
        "antitool",
        "prevents skids from attaching to you",
        function()
            LocalPlayer.Character.ChildAdded:Connect(
                function(object)
                    if object:IsA("Tool") then
                        object:Destroy()
                    end
                end
            )
        end
    )
    
    CreateCommand("rj", "rejoins u", function()
        game:service'TeleportService':Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)
    
    CreateCommand(
        "rjdupe",
        "rejoins and dupe(s) the tool(s)",
        function()
            local AmountToDupe = 15
    
            local plr = game:GetService("Players").LocalPlayer
            local char = plr.Character
            local pos = char.HumanoidRootPart.Position
            local http = game:GetService("HttpService")
    
            local file = "rejoindupe.json"
            writefile(
                file,
                http:JSONEncode(
                    {
                        ["AmountToDupe"] = AmountToDupe,
                        ["CurrentAmount"] = 0
                    }
                )
            )
            char.HumanoidRootPart.CFrame = CFrame.new(0, 999999, 0)
            for i, v in pairs(plr.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = char
                end
            end
            wait(.3)
            for i, v in pairs(char:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = workspace
                end
            end
    
            local dupescript =
                [[
           game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
           repeat wait() until game:GetService("Players").LocalPlayer
           repeat wait() until game:GetService("Players").LocalPlayer.Character
           repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
           game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%s)
           local plr = game:GetService("Players").LocalPlayer
           local char = plr.Character
           local file = "%s"
           local a = readfile(file)
           local data = game:GetService("HttpService"):JSONDecode(a)
           if data['CurrentAmount'] >= data['AmountToDupe'] then
               wait(0.5)
               for i,v in pairs(workspace:GetChildren()) do
                   if v:IsA("Tool") then
                       char.Humanoid:EquipTool(v)
                   end
               end
               return
           else
               wait()
               char.HumanoidRootPart.CFrame = CFrame.new(0,999999,0)
               for i,v in pairs(plr.Backpack:GetChildren()) do
                   if v:IsA("Tool") then
                       v.Parent = char
                   end
               end
               wait(.3)
               for i,v in pairs(char:GetChildren()) do
                   if v:IsA("Tool") then
                       v.Parent = workspace
                   end
               end
               wait(.1)
               data['CurrentAmount'] = data['CurrentAmount'] + 1
               writefile(file,game:GetService("HttpService"):JSONEncode(data))
           end
           syn.queue_on_teleport(readfile("%s"))
           repeat
           game:GetService("TeleportService"):Teleport(game.PlaceId)    
           wait(0.5)
           until nil
        ]]
            dupescript = string.format(dupescript, tostring(pos), file, "dupescript.lua")
    
            writefile("dupescript.lua", dupescript)
            syn.queue_on_teleport(dupescript)
            game:GetService("TeleportService"):Teleport(game.PlaceId)
        end
    )
    
    CreateCommand(
        "dupetools",
        "dupes the amount of tool(s)",
        function()
            local Start = LocalPlayer.Character.PrimaryPart.CFrame
            local Amount = tonumber(Args[2]) or #game:GetService("Players"):GetPlayers()
            local unequip = function()
                LocalPlayer.Character.Humanoid:UnequipTools()
                repeat
                    wait()
                until LocalPlayer.Character:FindFirstChildOfClass "Tool" == nil
            end
            unequip()
            local f = #LocalPlayer.Backpack:GetChildren()
            workspace["FallenPartsDestroyHeight"] = 0 / 1 / 0
            for i = 1, Amount do
                repeat
                    wait()
                until LocalPlayer.Character.PrimaryPart ~= nil and LocalPlayer.Character.Humanoid ~= nil
                unequip()
                LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 4000055550, 0))
                wait(.3)
                for i, v in pairs(LocalPlayer.Backpack:children()) do
                    hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    hum:EquipTool(v)
                    v.Parent = game.Lighting
                end
                for i, v in pairs(LocalPlayer.Character:children()) do
                    if v:IsA "Tool" then
                        hum:EquipTool(game.Lighting:WaitForChild("Tool"))
                    end
                end
                wait()
                LocalPlayer.Character:Destroy()
                LocalPlayer.CharacterAdded:wait()
                repeat
                    wait()
                until LocalPlayer.Character.PrimaryPart and LocalPlayer.Character.Humanoid ~= nil
                f = f + 1
                for i, v in pairs(workspace:GetChildren()) do
                    if v:IsA "Tool" then
                        firetouchinterest(LocalPlayer.Character.PrimaryPart, v.Handle, 0)
                        firetouchinterest(LocalPlayer.Character.PrimaryPart, v.Handle, 1)
                    end
                end
                repeat
                    wait()
                until workspace:FindFirstChildOfClass "Tool" == nil
                unequip()
            end
            for i, v in pairs(workspace:GetChildren()) do
                if v:IsA "Tool" and v.Handle ~= nil then
                    firetouchinterest(LocalPlayer.Character.PrimaryPart, v.Handle, 0)
                    firetouchinterest(LocalPlayer.Character.PrimaryPart, v.Handle, 1)
                end
            end
            wait(.2)
            unequip()
            LocalPlayer.Character:SetPrimaryPartCFrame(Start)
        end
    )
    
    CreateCommand(
        "tkill",
        "tool kill player",
        function()
            local Target = GetPlayer(Args[2])
            for _, Player in pairs(Target) do
                local OldPos = getRoot().CFrame
                local hum = Instance.new("Humanoid", LocalPlayer.Character)
                hum:ChangeState(15)
                LocalPlayer.Character.Animate.Disabled = true
                LocalPlayer.Character.Animate.Disabled = false
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
                local Tools = {}
                for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if tool:IsA("Tool") then
                        table.insert(Tools, tool)
                    end
                end
                for _, x in next, Tools do
                    local Arm =
                        game:service("Players").LocalPlayer.Character["Right Arm"].CFrame *
                        CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
                    x.Grip = Arm:toObjectSpace(Player.Character["Torso"].CFrame):inverse()
                    x.Parent = LocalPlayer.Character
                    firetouchinterest(Player.Character.HumanoidRootPart, x.Handle, 0)
                    firetouchinterest(Player.Character.HumanoidRootPart, x.Handle, 1)
                    wait(0.4)
                end
                LocalPlayer.CharacterAdded:Wait()
                repeat
                    task.wait()
                    LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = OldPos
                until getRoot().CFrame == OldPos
                wait(.4)
            end
        end
    )
    
    CreateCommand(
        "setspawn",
        "sets the spawn to a pos",
        function()
            local plr = game:GetService("Players").LocalPlayer.Character
            pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
            plr.Archivable = true
            Respawning = plr:Clone()
            Respawning.Parent = workspace
            plr:ClearAllChildren()
            workspace.CurrentCamera.CameraSubject = workspace.Respawning
            wait(5.25)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            Respawning:Destroy()
        end
    )
    
    CreateCommand("voidkick", "void kick's plr", function()
        local function prep(plr)
            local Character = game:service("Players").LocalPlayer.Character
            local Backpack = game:service("Players").LocalPlayer.Backpack
            local LLeg = Character:FindFirstChild("Left Leg") if LLeg then LLeg:Destroy() end
            local RLeg = Character:FindFirstChild("Right Leg") if RLeg then RLeg:Destroy() end
            game["Run Service"].Heartbeat:connect(function()
                game:service("Players").LocalPlayer.MaximumSimulationRadius = math.huge
                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge*math.huge)
            end)
            cframe = plr.Character.HumanoidRootPart.CFrame
            workspace.FallenPartsDestroyHeight = math.huge - math.huge
            if Character:FindFirstChildOfClass("Tool") then
                Character:FindFirstChildOfClass("Tool").Parent = Backpack
            end
            Character.Humanoid:Remove()
            local wow = Instance.new("Humanoid", Character)
            local tool = Backpack:FindFirstChildOfClass("Tool")
            tool.Parent = Character
            plr.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
            plr.Character:SetPrimaryPartCFrame(CFrame.new(0, -10000000000, 0))
            repeat 
                game:GetService('RunService').Heartbeat:Wait() 
                plr.Character.HumanoidRootPart.CFrame = tool.Handle.CFrame 
            until tool.Parent == plr.Character
            plr:Destroy()
          end
    
          for i,v in next, GetPlayer(Args[2]) do 
              if v:IsA("Player") then 
                   prep(v) 
                   v:Destroy()
              end 
          end 
    end) 
    
    CreateCommand(
        "killall",
        "fencing server kill all",
        function()
            Service =
                setmetatable(
                {
                    Get = function(Self, Serv)
                        if Service[Serv] then
                            return Service[Serv]
                        end
                        local S = game:GetService(Serv)
                        if S then
                            Service[Serv] = S
                        end
                        return S
                    end
                },
                {
                    __index = function(Self, Index)
                        local S = game:GetService(Index)
                        if S then
                            Service[Index] = S
                        end
                        return S
                    end
                }
            )
    
            workspace["FallenPartsDestroyHeight"] = 0 / 1 / 0
    
            local Create = function(Class, Parent)
                local Inst = Instance.new(Class)
                Inst["Parent"] = Parent
                return Inst
            end
    
            print("Hi! - Synttax :D")
    
            local LP = Service["Players"].LocalPlayer
            local Char = LP["Character"]
    
            Char:BreakJoints()
            LP.CharacterAdded:Wait()
            Char = LP["Character"]
            wait(.2)
    
            local Yield = Instance.new("BindableEvent")
    
            local C =
                Char.ChildAdded:Connect(
                function(Obj)
                    if rawequal(Obj["Name"], "Spray") then
                        Yield:Fire()
                    end
                end
            )
    
            local Root, Humanoid = Char["HumanoidRootPart"], Char["Humanoid"]
    
            Root.CFrame = Root.CFrame * CFrame.new(0, 15, 50)
    
            local Sprays = {}
    
            for I = 1, Service["Players"]["MaxPlayers"] + 1 do
                firetouchinterest(Root, workspace["Handle"], 0)
                firetouchinterest(Root, workspace["Handle"], 1)
                Yield["Event"]:Wait()
                Service["RunService"].Heartbeat:Wait()
                table.insert(Sprays, Char["Spray"])
                Char["Spray"].Parent = workspace
            end
    
            Yield:Destroy()
            C:Disconnect()
    
            for K, V in next, Sprays do
                Humanoid:EquipTool(V)
            end
    
            Root["Anchored"] = true
    
            wait(.6)
            Humanoid:UnequipTools()
    
            local Clone = Humanoid:Clone()
            Clone["Parent"] = Char
            Humanoid:Destroy()
    
            for K, V in next, Sprays do
                V["Parent"] = Char
            end
    
            Root["Anchored"] = false
    
            Clone:ChangeState(15)
    
            local Forces, Ignore = {}, {}
    
            for I = 1, #Sprays do
                local Spray = Sprays[I]
                local Player = Service["Players"]:GetPlayers()[I]
                if Player ~= LP then
                    if Spray ~= nil and Player ~= nil then
                        local PChar = workspace:FindFirstChild(Player["Name"])
                        if PChar ~= nil then
                            local PRoot, PHum =
                                PChar:FindFirstChild("HumanoidRootPart") or PChar:FindFirstChild("Torso") or
                                    PChar:FindFirstChild("UpperTorso") or
                                    PChar:FindFirstChild("Head"),
                                PChar:FindFirstChildOfClass("Humanoid")
                            if PRoot ~= nil and PHum ~= nil then
                                Spray["Grip"] = CFrame.new(0, 0, I * 1.5)
                                firetouchinterest(PRoot, Spray.Handle, 0)
                                firetouchinterest(PRoot, Spray.Handle, 1)
                            end
                        end
                    end
                end
            end
        end
    )
    
    CreateCommand(
        "bringall",
        "fencing server bring all",
        function()
            Service =
                setmetatable(
                {
                    Get = function(Self, Serv)
                        if Service[Serv] then
                            return Service[Serv]
                        end
                        local S = game:GetService(Serv)
                        if S then
                            Service[Serv] = S
                        end
                        return S
                    end
                },
                {
                    __index = function(Self, Index)
                        local S = game:GetService(Index)
                        if S then
                            Service[Index] = S
                        end
                        return S
                    end
                }
            )
    
            workspace["FallenPartsDestroyHeight"] = 0 / 1 / 0
    
            local Create = function(Class, Parent)
                local Inst = Instance.new(Class)
                Inst["Parent"] = Parent
                return Inst
            end
    
            print("Hi! - Synttax :D")
    
            local LP = Service["Players"].LocalPlayer
            local Char = LP["Character"]
    
            Char:BreakJoints()
            LP.CharacterAdded:Wait()
            Char = LP["Character"]
            wait(.2)
    
            local Yield = Instance.new("BindableEvent")
    
            local C =
                Char.ChildAdded:Connect(
                function(Obj)
                    if rawequal(Obj["Name"], "Spray") then
                        Yield:Fire()
                    end
                end
            )
    
            local Root, Humanoid = Char["HumanoidRootPart"], Char["Humanoid"]
    
            Root.CFrame = Root.CFrame * CFrame.new(0, 15, 50)
    
            local Sprays = {}
    
            for I = 1, Service["Players"]["MaxPlayers"] + 1 do
                firetouchinterest(Root, workspace["Handle"], 0)
                firetouchinterest(Root, workspace["Handle"], 1)
                Yield["Event"]:Wait()
                Service["RunService"].Heartbeat:Wait()
                table.insert(Sprays, Char["Spray"])
                Char["Spray"].Parent = workspace
            end
    
            Yield:Destroy()
            C:Disconnect()
    
            for K, V in next, Sprays do
                Humanoid:EquipTool(V)
            end
    
            Root["Anchored"] = true
    
            wait(.6)
            Humanoid:UnequipTools()
    
            local Clone = Humanoid:Clone()
            Clone["Parent"] = Char
            Humanoid:Destroy()
    
            for K, V in next, Sprays do
                V["Parent"] = Char
            end
    
            Root["Anchored"] = false
    
            local Forces, Ignore = {}, {}
    
            for I = 1, #Sprays do
                local Spray = Sprays[I]
                local Player = Service["Players"]:GetPlayers()[I]
                if Player ~= LP then
                    if Spray ~= nil and Player ~= nil then
                        local PChar = workspace:FindFirstChild(Player["Name"])
                        if PChar ~= nil then
                            local PRoot, PHum =
                                PChar:FindFirstChild("HumanoidRootPart") or PChar:FindFirstChild("Torso") or
                                    PChar:FindFirstChild("UpperTorso") or
                                    PChar:FindFirstChild("Head"),
                                PChar:FindFirstChildOfClass("Humanoid")
                            if PRoot ~= nil and PHum ~= nil then
                                Spray["Grip"] = CFrame.new(0, 0, I * 1.5)
                                firetouchinterest(PRoot, Spray.Handle, 0)
                                firetouchinterest(PRoot, Spray.Handle, 1)
                            end
                        end
                    end
                end
            end
        end
    )
    
    CreateCommand(
        "commandcount",
        "gives the amount of commands(s) counted",
        function()
            for index, commands in next, Admin.Commands do
                warn(index)
            end
        end
    )
    
    CreateCommand(
        "voidall",
        "fencing server void all",
        function()
            Service =
                setmetatable(
                {
                    Get = function(Self, Serv)
                        if Service[Serv] then
                            return Service[Serv]
                        end
                        local S = game:GetService(Serv)
                        if S then
                            Service[Serv] = S
                        end
                        return S
                    end
                },
                {
                    __index = function(Self, Index)
                        local S = game:GetService(Index)
                        if S then
                            Service[Index] = S
                        end
                        return S
                    end
                }
            )
    
            workspace["FallenPartsDestroyHeight"] = 0 / 1 / 0
    
            local Create = function(Class, Parent)
                local Inst = Instance.new(Class)
                Inst["Parent"] = Parent
                return Inst
            end
    
            print("Hi! - Synttax :D")
    
            local LP = Service["Players"].LocalPlayer
            local Char = LP["Character"]
    
            Char:BreakJoints()
            LP.CharacterAdded:Wait()
            Char = LP["Character"]
            wait(.2)
    
            local Yield = Instance.new("BindableEvent")
    
            local C =
                Char.ChildAdded:Connect(
                function(Obj)
                    if rawequal(Obj["Name"], "Spray") then
                        Yield:Fire()
                    end
                end
            )
    
            local Root, Humanoid = Char["HumanoidRootPart"], Char["Humanoid"]
    
            Root.CFrame = Root.CFrame * CFrame.new(0, 15, 50)
    
            local Sprays = {}
    
            for I = 1, Service["Players"]["MaxPlayers"] + 1 do
                firetouchinterest(Root, workspace["Handle"], 0)
                firetouchinterest(Root, workspace["Handle"], 1)
                Yield["Event"]:Wait()
                Service["RunService"].Heartbeat:Wait()
                table.insert(Sprays, Char["Spray"])
                Char["Spray"].Parent = workspace
            end
    
            Yield:Destroy()
            C:Disconnect()
    
            for K, V in next, Sprays do
                Humanoid:EquipTool(V)
            end
    
            Root["Anchored"] = true
    
            wait(.6)
            Humanoid:UnequipTools()
    
            local Clone = Humanoid:Clone()
            Clone["Parent"] = Char
            Humanoid:Destroy()
    
            for K, V in next, Sprays do
                V["Parent"] = Char
            end
    
            Root["Anchored"] = false
    
            local Forces, Ignore = {}, {}
    
            for I = 1, #Sprays do
                local Spray = Sprays[I]
                local Player = Service["Players"]:GetPlayers()[I]
                if Player ~= LP then
                    if Spray ~= nil and Player ~= nil then
                        local PChar = workspace:FindFirstChild(Player["Name"])
                        if PChar ~= nil then
                            local PRoot, PHum =
                                PChar:FindFirstChild("HumanoidRootPart") or PChar:FindFirstChild("Torso") or
                                    PChar:FindFirstChild("UpperTorso") or
                                    PChar:FindFirstChild("Head"),
                                PChar:FindFirstChildOfClass("Humanoid")
                            if PRoot ~= nil and PHum ~= nil then
                                Spray["Grip"] = CFrame.new(0, 0, I * 1.5)
                                firetouchinterest(PRoot, Spray.Handle, 0)
                                firetouchinterest(PRoot, Spray.Handle, 1)
                            end
                        end
                    end
                end
            end
            for i = 1, 4 do
                PChar.Humanoid.RootPart.CFrame = CFrame.new(0, 0 / 1, 0)
            end
            wait(0.4)
            for i = 1, 4 do
                LocalPlayer.Character:SetPrimaryPartCFrame(PChar.Humanoid.RootPart.CFrame)
            end
        end
    )
    
    CreateCommand(
        "fsfling",
        "fencing server bring all",
        function()
            Service =
                setmetatable(
                {
                    Get = function(Self, Serv)
                        if Service[Serv] then
                            return Service[Serv]
                        end
                        local S = game:GetService(Serv)
                        if S then
                            Service[Serv] = S
                        end
                        return S
                    end
                },
                {
                    __index = function(Self, Index)
                        local S = game:GetService(Index)
                        if S then
                            Service[Index] = S
                        end
                        return S
                    end
                }
            )
    
            workspace["FallenPartsDestroyHeight"] = 0 / 1 / 0
    
            local Create = function(Class, Parent)
                local Inst = Instance.new(Class)
                Inst["Parent"] = Parent
                return Inst
            end
    
            print("Hi! - Synttax :D")
    
            local LP = Service["Players"].LocalPlayer
            local Char = LP["Character"]
    
            Char:BreakJoints()
            LP.CharacterAdded:Wait()
            Char = LP["Character"]
            wait(.2)
    
            local Yield = Instance.new("BindableEvent")
    
            local C =
                Char.ChildAdded:Connect(
                function(Obj)
                    if rawequal(Obj["Name"], "Spray") then
                        Yield:Fire()
                    end
                end
            )
    
            local Root, Humanoid = Char["HumanoidRootPart"], Char["Humanoid"]
    
            Root.CFrame = Root.CFrame * CFrame.new(0, 15, 50)
    
            local Sprays = {}
    
            for I = 1, Service["Players"]["MaxPlayers"] + 1 do
                firetouchinterest(Root, workspace["Handle"], 0)
                firetouchinterest(Root, workspace["Handle"], 1)
                Yield["Event"]:Wait()
                Service["RunService"].Heartbeat:Wait()
                table.insert(Sprays, Char["Spray"])
                Char["Spray"].Parent = workspace
            end
    
            Yield:Destroy()
            C:Disconnect()
    
            for K, V in next, Sprays do
                Humanoid:EquipTool(V)
            end
    
            Root["Anchored"] = true
    
            wait(.6)
            Humanoid:UnequipTools()
    
            local Clone = Humanoid:Clone()
            Clone["Parent"] = Char
            Humanoid:Destroy()
    
            for K, V in next, Sprays do
                V["Parent"] = Char
            end
    
            Root["Anchored"] = false
    
            local Forces, Ignore = {}, {}
    
            for I = 1, #Sprays do
                local Spray = Sprays[I]
                local Player = Service["Players"]:GetPlayers()[I]
                if Player ~= LP then
                    if Spray ~= nil and Player ~= nil then
                        local PChar = workspace:FindFirstChild(Player["Name"])
                        if PChar ~= nil then
                            local PRoot, PHum =
                                PChar:FindFirstChild("HumanoidRootPart") or PChar:FindFirstChild("Torso") or
                                    PChar:FindFirstChild("UpperTorso") or
                                    PChar:FindFirstChild("Head"),
                                PChar:FindFirstChildOfClass("Humanoid")
                            if PRoot ~= nil and PHum ~= nil then
                                Spray["Grip"] = CFrame.new(0, 0, I * 1.5)
                                firetouchinterest(PRoot, Spray.Handle, 0)
                                firetouchinterest(PRoot, Spray.Handle, 1)
                                local bodyvel = Instance.new("BodyVelocity", PRoot)
                                bodyvel.Velocity = Vector3.new(9e9, 9e9, 9e9)
                                
                            end
                        end
                    end
                end
            end
        end
    )
    
    local claim = false 
    local attached = true
    
    
    function onAttach(lplayer,v,enabled)
        lplayer.Character.Humanoid.Name = 1
        local l = lplayer.Character["1"]:Clone()
        l.Parent = lplayer.Character
        l.Name = "Humanoid"
        task.wait(0.1)
        lplayer.Character["1"]:Destroy()
        game:GetService("Workspace").CurrentCamera.CameraSubject = lplayer.Character
        lplayer.Character.Animate.Disabled = true
        task.wait(0.1)
        lplayer.Character.Animate.Disabled = false
        lplayer.Character.Humanoid.DisplayDistanceType = "None"
        tool = nil 
        for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
        tool = lplayer.Character.Humanoid:EquipTool(v)
        print(tool.Parent)
        end
    
        firetouchinterest(v.Character.Head, tool.Handle, 0)
        firetouchinterest(v.Character.Head, tool.Handle, 1)
        lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
        task.wait(0.3)
        lplayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[v.Name].Character["Left Arm"].CFrame
    end 
    
    function onClaim(plr,LocalPlayer,enabled)
        if (enabled) then 
             enabled = true 
             claim = enabled 
             onAttach(LocalPlayer,plr,claim)
             local pos = plr.Character.HumanoidRootPart.Position 
             
             workspace["FallenPartsDestroyHeight"] = -500000*50
             for i = 0,3 do 
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -5000000, 0)
                task.wait(0.3)
             end 
             task.wait(0.3)
    
             for i = 0,3 do 
                LocalPlayer.Character.HumanoidRootPart.Position = pos
            end
    
    
        end 
    end 
    
    CreateCommand(
        "attach",
        "attaches to player",
        function()
            for i, plr in next, GetPlayer(Args[2]) do 
                onAttach(LocalPlayer,plr,attached)
            end 
        end
    )
    
    CreateCommand("claim", "claims plr", function()
        for i, plr in next, GetPlayer(Args[2]) do 
            print(plr.Name)
            onClaim(plr,LocalPlayer,claim)
        end 
    end) 
    
    CreateCommand(
        "r6",
        "reanimates you to r6",
        function()
        end
    )
    
    CreateCommand(
        "fling",
        "flings victim",
        function()
        end
    )
    
    CreateCommand(
        "swim",
        "local swim",
        function()
        end
    )
    
    CreateCommand(
        "noclip",
        "noclips you | localsided",
        function()
        end
    )
    
    CreateCommand(
        "tptkill",
        "teleport tool kill",
        function()
        end
    )
    
    CreateCommand(
        "jail",
        "doll house jail",
        function()
        end
    )
    
    CreateCommand(
        "size",
        "sizes your hat handle",
        function()
        end
    )
    
    CreateCommand(
        "control",
        "attaches then controls player",
        function()
        end
    )
    
    CreateCommand(
        "annoying",
        "creates an annoying OOF sound [not sure if it still works]",
        function()
        end
    )
    
    CreateCommand(
        "car",
        "gives you a car ride",
        function()
            if
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                    Enum.HumanoidRigType.R6
             then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 70
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = 0.0001
                game:GetService("Players").LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                    "rbxassetid://129342287"
                game:GetService("Players").LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "rbxassetid://129342287"
                game:GetService("Players").LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                    "rbxassetid://129342287"
                game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                    "rbxassetid://129342287"
                game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                    "rbxassetid://129342287"
                game:GetService("Players").LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                    "rbxassetid://129342287"
                for i, thing in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if thing.ClassName == "Part" then
                        thing.CustomPhysicalProperties = PhysicalProperties.new(0.04, 0, 0)
                    end
                end
                local r6height = "-1.03"
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").HipHeight = r6height
            elseif
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                    Enum.HumanoidRigType.R15
             then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 70
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = 0.0001
                game:GetService("Players").LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                    "rbxassetid://3360694441"
                game:GetService("Players").LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "rbxassetid://3360694441"
                game:GetService("Players").LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                    "rbxassetid://3360694441"
                game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                    "rbxassetid://3360694441"
                game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                    "rbxassetid://3360694441"
                game:GetService("Players").LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                    "rbxassetid://3360694441"
                for i, thing in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if thing.ClassName == "MeshPart" then
                        thing.CustomPhysicalProperties = PhysicalProperties.new(0.04, 0, 0)
                    end
                end
                local r15height = "0.56"
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").HipHeight = r15height
            end
        end
    )
    
    CreateCommand(
        "zombie",
        "r15/r6 zombie animation",
        function()
            game:GetService("Players").LocalPlayer.CharacterAdded:Connect(
                function()
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").HipHeight = 2.45
                    local animate = game:GetService("Players").LocalPlayer.Character:WaitForChild("Animate")
                    if
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                            Enum.HumanoidRigType.R15
                     then
                        wait(0.1)
                        animate.run.RunAnim.AnimationId = "rbxassetid://3489173414"
                        animate.walk.WalkAnim.AnimationId = "rbxassetid://3489174223"
                        animate.fall.FallAnim.AnimationId = "rbxassetid://616157476"
                        animate.jump.JumpAnim.AnimationId = "rbxassetid://616161997"
                        animate.idle.Animation1.AnimationId = "rbxassetid://3489171152"
                        animate.idle.Animation2.AnimationId = "rbxassetid://3489171152"
                        animate.swim.Swim.AnimationId = "rbxassetid://616165109"
                        animate.swimidle.SwimIdle.AnimationId = "rbxassetid://616166655"
                        animate.climb.ClimbAnim.AnimationId = "rbxassetid://616156119"
                        animate.toolslash.ToolSlashAnim.AnimationId = "rbxassetid://3489169607"
                        animate.toollunge.ToolLungeAnim.AnimationId = "rbxassetid://3489169607"
                    end
                    local tool = Instance.new("Tool")
                    local handle = Instance.new("Part")
                    tool.Name = "Swing"
                    tool.Parent = game:GetService("Players").LocalPlayer.Backpack
                    tool.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
                    tool.GripForward = Vector3.new(-0, -1, -0)
                    tool.GripRight = Vector3.new(0, 0, 1)
                    tool.GripUp = Vector3.new(1, 0, 0)
                    handle.Name = "Handle"
                    handle.Parent = tool
                    handle.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
                    handle.Orientation = Vector3.new(0, 180, 90)
                    handle.Position = Vector3.new(-17.2635937, 15.4915619, 46)
                    handle.Rotation = Vector3.new(-180, 0, -90)
                    handle.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
                    handle.Transparency = 1
                    handle.Size = Vector3.new(1, 1.20000005, 1)
                    handle.BottomSurface = Enum.SurfaceType.Weld
                    handle.BrickColor = BrickColor.new("Really black")
                    handle.Material = Enum.Material.Metal
                    handle.TopSurface = Enum.SurfaceType.Smooth
                    handle.brickColor = BrickColor.new("Really black")
                    function swing()
                        if
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                                Enum.HumanoidRigType.R15
                         then
                            swinganim = Instance.new("Animation")
                            swinganim.AnimationId = "rbxassetid://3489169607"
                            swingit =
                                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(
                                swinganim
                            )
                            swingit:Play()
                            wait(0.96700000762939)
                            swingit:Stop()
                            swingit:Destroy()
                            swinganim:Destroy()
                        end
                    end
                    tool.Activated:Connect(swing)
                end
            )
        end
    )
    
    CreateCommand(
        "tfling",
        "tool fling player",
        function()
        end
    )
    
    CreateCommand(
        "noarms",
        "gives you no arms",
        function()
            local r15arms = {
                game:GetService("Players").LocalPlayer.Character.RightUpperArm,
                game:GetService("Players").LocalPlayer.Character.LeftUpperArm
            }
            local r6arms = {
                game:GetService("Players").LocalPlayer.Character["Right Arm"],
                game:GetService("Players").LocalPlayer.Character["Left Arm"]
            }
            if
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                    Enum.HumanoidRigType.R15
             then
                for i, v in pairs(r15arms) do
                    v:Delete()
                end
            elseif
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                    Enum.HumanoidRigType.R6
             then
                for i, v in pairs(r6arms) do
                    v:Delete()
                end
            end
        end
    )
    
    CreateCommand(
        "nolimbs",
        "gives you no limbs",
        function()
            local r15limbs = {
                game:GetService("Players").LocalPlayer.Character.RightUpperArm,
                game:GetService("Players").LocalPlayer.Character.LeftUpperArm,
                game:GetService("Players").LocalPlayer.Character.RightUpperLeg,
                game:GetService("Players").LocalPlayer.Character.LeftUpperLeg
            }
            local r6limbs = {
                game:GetService("Players").LocalPlayer.Character["Right Arm"],
                game:GetService("Players").LocalPlayer.Character["Left Arm"],
                game:GetService("Players").LocalPlayer.Character["Right Leg"],
                game:GetService("Players").LocalPlayer.Character["Left Leg"]
            }
            if
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                    Enum.HumanoidRigType.R15
             then
                for i, v in pairs(r15limbs) do
                    v:Delete()
                end
            elseif
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType ==
                    Enum.HumanoidRigType.R6
             then
                for i, v in pairs(r6limbs) do
                    v:Delete()
                end
            end
        end
    )
    
    CreateCommand(
        "antikill",
        "stops skids from killing u",
        function()
            local antikill = false
            local a = nil
            if antikill then
                antikill = false
            else
                antikill = true
            end
            a =
                game.RunService.Stepped:Connect(
                function(x)
                    if antikill then
                        local mouse = LocalPlayer:GetMouse()
                        local uis = game:GetService "UserInputService"
                        local root = LocalPlayer.Character["HumanoidRootPart"]
                        if uis.MouseBehavior == Enum.MouseBehavior.LockCenter then
                            local ray = Ray.new(root.Position, mouse.UnitRay.Direction * 5000)
                            local part, pos = workspace:FindPartOnRayWithIgnoreList(ray, {workspace})
    
                            root.CFrame = CFrame.new(root.Position, Vector3.new(pos.X, root.Position.Y, pos.Z))
                        end
    
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = true
                        game:GetService("Players").LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
                    else
                        game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = false
                        a:Disconnect()
                    end
                end
            )
        end
    )
    
    CreateCommand(
        "antifling",
        "anti fling from skids tryna fling you",
        function()
            game["Run Service"].Heartbeat:Connect(
                function()
                    game:GetService("RunService").Stepped:Wait()
                    for _, player in pairs(game:service("Players"):GetPlayers()) do
                        if player ~= LocalPlayer then
                            local character = player.Character
                            if character then
                                for _, part in pairs(character:GetChildren()) do
                                    if part:IsA("BasePart") then
                                        part.CanCollide = false
                                    end
                                end
                            end
                        end
                    end
                    for i, v in pairs(workspace:GetChildren()) do
                        if v:IsA("Accessory") and v:FindFirstChild("Handle") then
                            v.Handle.CanCollide = false
                        end
                    end
                end
            )
        end
    )
    
    for i, v in pairs(Admin.Commands) do
        print(v[1] .. " : " .. v[2] .. " \n")
    end
    
    local function BORD_fake_script() -- Bar.LocalScript
        local script = Instance.new("LocalScript", Bar)
    
        function zigzag(X)
            return math.acos(math.cos(X * math.pi)) / math.pi
        end
    
        counter = 0
    
        while wait(0.1) do
            script.Parent.BackgroundColor3 = Color3.fromHSV(zigzag(counter), 1, 1)
    
            counter = counter + 0.01
        end
    end
    coroutine.wrap(BORD_fake_script)()
    local function HBRC_fake_script() -- Command_Input.LocalScript
        local script = Instance.new("LocalScript", CommandInput)
    
        function zigzag(X)
            return math.acos(math.cos(X * math.pi)) / math.pi
        end
    
        counter = 0
    
        while wait(0.1) do
            script.Parent.TextColor3 = Color3.fromHSV(zigzag(counter), 1, 1)
    
            counter = counter + 0.01
        end
    end
    coroutine.wrap(HBRC_fake_script)()
    local function CVTMGGP_fake_script() -- TextButton.LocalScript
        local script = Instance.new("LocalScript", TextLabel)
    
        function zigzag(X)
            return math.acos(math.cos(X * math.pi)) / math.pi
        end
    
        counter = 0
    
        while wait(0.1) do
            TextLabel.TextColor3 = Color3.fromHSV(zigzag(counter), 1, 1)
    
            counter = counter + 0.01
        end
    end
    coroutine.wrap(CVTMGGP_fake_script)()
    local function SWWI_fake_script() -- CommandHolder.LocalScript
        local script = Instance.new("LocalScript", Bar)
    
        function zigzag(X)
            return math.acos(math.cos(X * math.pi)) / math.pi
        end
    
        counter = 0
    
        while wait(0.1) do
            script.Parent.BorderColor3 = Color3.fromHSV(zigzag(counter), 1, 1)
    
            counter = counter + 0.01
        end
    end
    coroutine.wrap(SWWI_fake_script)()
    
else
    warn"Couldn't load game."
end 
