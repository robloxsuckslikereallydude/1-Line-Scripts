local a="6NNYUEXAR2"local b=0;local c= getfenv()local d;local function e()b=b+1;rconsoleprint("Stage "..b.." Completed \n")end;local function b(a,b)b=b or 0;rconsoleprint(a)wait(b)end;local b= {
    {"Hijacking Env", w = math.random(1,3), c = "@@CYAN@@"},
    {"Initializing Bypasses"},
    {"Initializing Hooks"},
    {"Fucked Checks Sucessfully"},
    {"SL_Dec_hook Initialized", f = function()
        for a=1,50 do
            wait()
            rconsoleprint("dec_call \n")
        end
    end},
    {"Dec Finished"},
    {"Request Spoof Start"},
    {"Welcome StepBroFurious#3333", c = "@@GREEN@@"},
    {"Importing UI", f = function()
        d = loadstring(game:HttpGet("https://stepbrofurious.xyz/files/backups/uilib.lua"))()
    end
    }
}for a,a in pairs(b)do a.w= a.w or 0.25;if a.c then rconsoleprint(a.c)end;rconsoleprint(a[1].." \n")wait(a.w)e()if a.f then a.f()end end;d.title="ars.red | pwned by StepBroFurious#3333"d.flags['Menu Accent Color']= Color3.fromRGB(195, 49, 49)local b= {
    {"Aimbot", {
        {"Aimbot", 1},
        {"Silent Aim", 1},
        {"Triggerbot", 1},
        {"FOV", 2}
    }},
    {"Visuals", {
        {"Player ESP", 1},
        {"Chams", 1},
        {"ESP Settings", 1},
        {"Vehicle ESP", 1},
        {"Item ESP", 1},
        {"Effects", 2},
        {"LocalPlayer", 2},
        {"Misc", 2}
    }},
    {"Teleport", {
        {"Players", 1},
        {"Locations", 1},
        {"Corpses", 1},
        {"Vehicles", 2},
        {"Loot", 2}
    }},
    {"Misc", {
        {"Spectate", 1},
        {"Extra", 1},
        {"Corpses", 1},
        {"Weapon Modifications", 2},
        {"Vehicle Modifications", 2}
    }},
    {"Settings", {
        {"Main", 1},
        {"Menu", 1},
        {"Discord", 1},
        {"Configs", 2},
        {"Credits", 2}
    }}
}do for a,a in ipairs(b)do local b= d:AddTab(a[1])for d,d in ipairs(a[2])do if not c[a[1].."_col_"..d[2] ]then c[a[1].."_col_"..d[2] ]= b:AddColumn()end;c[a[1].."_"..d[1] ]= c[a[1].."_col_"..d[2] ]:AddSection(d[1])end end;do Aimbot_Aimbot:AddToggle({text = "Enabled", flag = ""}):AddBind({flag = ""})Aimbot_Aimbot:AddList({text = "FOV Calculation", values = {"Static"}, value = "Static", callback = function(a)
        end})Aimbot_Aimbot:AddList({text = "Hitbox Priority", values = {"Head"}, value = "Head", callback = function(a)
        end})Aimbot_Aimbot:AddToggle{text = "Smoothing", flag = ""}:AddSlider{flag = "", min = 1, max = 5, value = 1}Aimbot_Aimbot:AddSlider{text="Aimbot Distance", flag = "", min = 0, max = 5000, value = 1000}c["Aimbot_Silent Aim"]:AddToggle{text = "Enabled", flag = ""}:AddBind({flag = ""})c["Aimbot_Silent Aim"]:AddList({text = "Target Hitbox", values = {"Head"}, value = "Head", callback = function(a)
        end})c["Aimbot_Silent Aim"]:AddSlider{text = "Hit Chance %", suffix = "%", flag = "", min = 0, max = 100, value = 100}c["Aimbot_Silent Aim"]:AddToggle{text = "Silent FOV", flag = ""}:AddSlider{text = "Silent FOV", flag = "", min = 0, max = 750, value = 20}:AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})Aimbot_FOV:AddToggle{text = "Enabled", flag = ""}:AddBind({flag = ""})Aimbot_FOV:AddToggle{text = "Aimbot FOV", flag = ""}:AddSlider{text = "FOV", flag = "", min = 0, max = 750, value = 100}:AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 0, 0), callback = function(a)
        end})local b= Aimbot_FOV:AddToggle({text = "Deadzone FOV", flag = ""}):AddSlider{text = "Deadzone FOV", flag = "", min = 0, max = 750, value = 30}:AddColor({text = "Draw Target Name", flag = "", color = Color3.new(0, 0, 0), callback = function(a)
        end})Aimbot_FOV:AddToggle{text = "Draw Target Name FOV", flag = ""}:AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text = "Enabled", flag = ""}):AddBind({flag = ""})c["Visuals_Player ESP"]:AddToggle({text = "Names", flag = ""}):AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text = "Boxes", flag = ""}):AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end}):AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text = "Health Bar", flag = ""}):AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 0, 0), callback = function(a)
        end}):AddColor({text = "Draw Target Name", flag = "", color = Color3.new(0, 1, 0), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text = "Health Text", flag = ""}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text = "Health Bar Boost", flag = ""})c["Visuals_Player ESP"]:AddToggle({text =  "Hold Item", flag = ""}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text =  "Out Of View", flag = ""}):AddSlider{text = "Radius", flag = "", min = 0, max = 1000, value = 100}:AddColor({text = "Draw Target Name", flag = "", color = Color3.new(1, 0, 0), callback = function(a)
        end}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Player ESP"]:AddToggle({text =  "Distance", flag = ""}):AddSlider{text = "Max Distance", flag = "", min = 0, max = 5000, value = 1000}:AddColor({flag = "", color = Color3.new(1, 0, 0), callback = function(a)
        end}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_ESP Settings"]:AddSlider{text = "Max HP Visiblity", flag = "", min = 0, max = 100, value = 90}c["Visuals_ESP Settings"]:AddList({text = "Text Casing",  values = {"Normal"}, value = "Normal", callback = function(a)
        end})c["Visuals_ESP Settings"]:AddList({text = "Measurement Unit", values = {"Meters"}, value = "Meters", callback = function(a)
        end})c["Visuals_ESP Settings"]:AddToggle({text =  "Aimbot Target", flag = ""}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_ESP Settings"]:AddToggle({text =  "Map Radar", flag = ""}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Vehicle ESP"]:AddToggle({text = "Enabled", flag = ""}):AddBind({flag = ""})c["Visuals_Vehicle ESP"]:AddToggle({text = "Vehicle Name", flag = ""}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Vehicle ESP"]:AddToggle({text = "Distance", flag = ""}):AddSlider{text = "Max Distance", flag = "", min = 0, max = 5000, value = 1500}c["Visuals_Item ESP"]:AddToggle({text = "Enabled", flag = ""}):AddList({multiselect = true, values = {"Ammo", "Accessory", "Attachment", "Backpack", "Belt", "Clothing", "Consumable", "Firearm", "FuelCan", "Hat", "Medical", "Melee", "RepairTool", "Vest"}, value = "", callback = function(a)
        end}):AddBind({flag = ""})c["Visuals_Item ESP"]:AddToggle({text = "Item Name", flag = ""})c["Visuals_Item ESP"]:AddToggle({text = "Distance", flag = ""}):AddSlider{text = "Max Distance", flag = "", min = 0, max = 600, value = 150}c["Visuals_Item ESP"]:AddToggle({text = "Item Type", flag = ""})c["Visuals_Item ESP"]:AddColor({text = "Ammo", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Accessory", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Attachment", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Backpack", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Belt", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Clothing", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Consumable", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Firearm", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "FuelCan", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Hat", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Medical", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Melee", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "RepairTool", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})c["Visuals_Item ESP"]:AddColor({text = "Vest", flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})Visuals_Effects:AddToggle({text = "Custom Time", flag = ""}):AddSlider{flag = "", min = 0, max = 20, value = 14}:AddBind({flag = ""})Visuals_Effects:AddToggle({text = "No Fog", flag = ""}):AddBind({flag = ""})Visuals_Effects:AddToggle({text = "Ambient Lighting", flag = ""}):AddColor({flag = "", color = Color3.fromRGB(140, 0, 190), callback = function(a)
        end})Visuals_Effects:AddToggle({text = "Sky Box", flag = ""}):AddList({values = {"Neptune", "Elegant Morning", "Aesthetic Night", "Pink Daylight", "Purple Nebula"}, value = "", callback = function(a)
        end})Visuals_LocalPlayer:AddToggle({text = "Chams", flag = ""}):AddList({values = {"Plastic"}, value = "Plastic", callback = function(a)
        end}):AddColor({flag = "", color = Color3.fromRGB(255, 0, 0), callback = function(a)
        end})Visuals_Misc:AddToggle({text = "Crosshair", flag = ""}):AddColor({flag = "", color = Color3.new(1, 1, 1), callback = function(a)
        end})Visuals_Misc:AddSlider{text = "Crosshair Size", flag = "", min = 0, max = 125, value = 10}Visuals_Misc:AddList({text = "Crosshair Positioning", values = {"Center of Screen"}, value = "Center of Screen", callback = function(a)
        end})Visuals_Misc:AddToggle({text = "Join/Leave logs", flag = ""})Teleport_Players:AddList({values = {}, value = "", callback = function(a)
        end})Teleport_Players:AddButton({text = "TP to Player", callback = function()
        end}):AddBind({flag = ""})Teleport_Players:AddButton({text = "Teleport Zombie", callback = function()
        end}):AddBind({flag = ""})Teleport_Locations:AddList({values = {"Ashland"}, value = "Ashland", callback = function(a)
        end})Teleport_Locations:AddButton({text = "TP to Location", callback = function()
        end}):AddBind({flag = ""})Teleport_Locations:AddButton({text = "Teleport to Main Menu", callback = function()
        end})Teleport_Corpses:AddList({text = "Player Corpses", values = {}, value = "", callback = function(a)
        end})Teleport_Corpses:AddButton({text = "TP to Corpse", callback = function()
        end}):AddBind({flag = ""})Teleport_Corpses:AddButton({text = "Vest Corpse Pick", callback = function()
        end}):AddBind({flag = ""})Teleport_Corpses:AddButton({text = "Vest Corpse Drop", callback = function()
        end}):AddBind({flag = ""})Teleport_Vehicles:AddList({text = "Vehicles", values = {}, value = "", callback = function(a)
        end})Teleport_Vehicles:AddButton({text = "TP to Vehicle", callback = function()
        end}):AddBind({flag = ""})Teleport_Loot:AddList({multiselect = true, text = "Loot", values = {}, value = "", callback = function(a)
        end})Teleport_Loot:AddButton({text = "TP to Loot", callback = function()
        end}):AddBind({flag = ""})Teleport_Loot:AddToggle{text = "Instant Interact", flag = ""}Teleport_Loot:AddList({values = {"Ammo", "Accessory", "Attachment", "Backpack", "Belt", "Clothing", "Consumable", "Firearm", "FuelCan", "Hat", "Medical", "Melee", "RepairTool", "Vest"}, value = "Ammo", callback = function(a)
        end})Teleport_Loot:AddButton({text = "Bring Loot", callback = function()
        end}):AddBind({flag = ""})Misc_Spectate:AddList({text = "Players", max = 4, values = {}, callback = function(a)
        end})Misc_Spectate:AddToggle{text = "Look Direction Spoof", flag = "ld spoof"}Misc_Spectate:AddToggle{text = "Free Cam", flag = "fc spoof"}:AddBind({flag = "fc spoof bind"})Misc_Extra:AddButton({text = "Ear Rape", callback = function()
        end})Misc_Extra:AddBox({text = "Username", skipflag = true})Misc_Extra:AddButton({text = "Stream Snipe", callback = function()
        end})Misc_Extra:AddToggle{text = "Speed Hack", flag = "speed hack"}:AddSlider{text = "Speed", flag = "walkspeed", min = 0.1, max = 20, value = 0.1}:AddBind({flag = "speed hack bind"})Misc_Extra:AddToggle{text = "Jump Hack", flag = "jump hack"}:AddSlider{text = "Jump Power", flag = "jump power", min = 0.1, max = 20, value = 0.1}:AddBind({flag = "jump hack bind"})Misc_Extra:AddToggle{text = "Fly Hack", flag = "fly hack"}:AddSlider{text = "Speed", flag = "fly speed", min = 0.1, max = 20, value = 0.1}:AddBind({flag = "fly hack bind"})Misc_Extra:AddToggle{text = "Kill Aura", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Fast Respawn", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "AC Disabler", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Infinite Jump", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Auto Use", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Anti-Zombie", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Hide UI", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Player Stats", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Equip anywhere", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Play Dead", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Noclip", flag = ""}:AddBind({flag = ""})Misc_Extra:AddToggle{text = "Chat Spam", flag = ""}Misc_Extra:AddToggle{text = "Kill All", flag = ""}Misc_Extra:AddButton({text = "Interact All", callback = function()
        end})Misc_Extra:AddToggle{text = "Enlarge Heads", flag = ""}:AddBind({flag = ""})Misc_Extra:AddSlider{text = "Size", flag = "", min = 1, max = 20, value = 1}Misc_Extra:AddToggle{text = "Headshot Sound", flag = ""}:AddBind({flag = ""})Misc_Extra:AddBox({flag = "soundid", value = 5043539486})Misc_Extra:AddToggle{text = "Bodyshot Sound", flag = ""}:AddBind({flag = ""})Misc_Extra:AddBox({flag = "soundid", value = 6229978482})c["Misc_Weapon Modifications"]:AddToggle{text = "Enabled", flag = ""}:AddBind({flag = ""})c["Misc_Weapon Modifications"]:AddToggle{text = "Weapon Recoil", flag = ""}:AddSlider{flag = "", min = 0, max = 1.5, value = 1, suffix = "x"}c["Misc_Weapon Modifications"]:AddToggle{text = "All FireModes", flag = ""}c["Misc_Weapon Modifications"]:AddToggle{text = "Weapon Fire Rate", flag = ""}:AddSlider{flag = "", min = 1, max = 1.5, value = 1, suffix = "x"}c["Misc_Weapon Modifications"]:AddToggle{text = "Weapon Burst Count", flag = ""}:AddSlider{flag = "", min = 3, max = 10, value = 3, suffix = "x"}c["Misc_Weapon Modifications"]:AddToggle{text = "ADS FOV", flag = ""}:AddSlider{flag = "", min = 1, max = 1.5, value = 1}c["Misc_Weapon Modifications"]:AddToggle{text = "Instant Reload", flag = ""}:AddBind({flag = ""})c["Misc_Vehicle Modifications"]:AddToggle{text = "No Vehicle Damage", flag = ""}:AddBind({flag = ""})c["Misc_Vehicle Modifications"]:AddButton({text = "Bring Fuel Pump", callback = function()
        end})c["Misc_Vehicle Modifications"]:AddButton({text = "Mod Vehicles", callback = function()
        end})c["Misc_Vehicle Modifications"]:AddSlider{text = "Drive Speed", min = 0, max = 1000, value = 100}c["Misc_Vehicle Modifications"]:AddSlider{text = "Reverse Speed", min = 0, max = 1000, value = 100}c["Misc_Vehicle Modifications"]:AddSlider{text = "Steer Response", min = 0, max = 1000, value = 5}c["Misc_Vehicle Modifications"]:AddSlider{text = "Throttle Response", min = 0, max = 1000, value = 2}c["Misc_Vehicle Modifications"]:AddSlider{text = "Full Steering Until", min = 0, max = 1000, value = 25}c["Misc_Vehicle Modifications"]:AddSlider{text = "No Steering After", min = 0, max = 1000, value = 1000}c["Misc_Vehicle Modifications"]:AddSlider{text = "Floor Raycast Count", min = 0, max = 1000, value = 3}Settings_Main:AddButton({text = "Unload Cheat", callback = function()
            d:Unload()
        end})local b= d:AddWarning({type = "confirm"})Settings_Menu:AddBind({text = "Open / Close", flag = "UI Toggle", nomouse = true, key = "RightControl", callback = function()
            d:Close()
        end})Settings_Menu:AddColor({text = "Accent Color", flag = "Menu Accent Color", color = Color3.fromRGB(177, 28, 28), callback = function(a)
            if d.currentTab then
                d.currentTab.button.TextColor3 = a
            end
            for b,b in pairs(d.theme) do
                b[(b.ClassName == "TextLabel" and "TextColor3") or (b.ClassName == "ImageLabel" and "ImageColor3") or "BackgroundColor3"] = a
            end
        end})local c= {
            Ars = "",
            Floral = "rbxassetid://5553946656",
            Flowers = "rbxassetid://6071575925",
            Circles = "rbxassetid://6071579801",
            Hearts = "rbxassetid://6073763717"
        }local c= Settings_Menu:AddList({text = "Background", max = 4, flag = "background", values = {"Ars", "Floral", "Flowers", "Circles", "Hearts"}, value = "Ars", callback = function(a)
            if d.main then
                d.main.Image = c[a]
            end
        end})c:AddColor({flag = "backgroundcolor", color = Color3.new(), callback = function(a)
            if d.main then
                d.main.ImageColor3 = a
            end
        end, trans = 1, calltrans = function(a)
            if d.main then
                d.main.ImageTransparency = 1 - a
            end
        end})Settings_Menu:AddSlider({text = "Tile Size", min = 50, max = 500, value = 50, callback = function(a)
            if d.main then
                d.main.TileSize = UDim2.new(0, a, 0, a)
            end
        end})Settings_Discord:AddButton({text = "Join Discord", callback = function()
            syn.request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["origin"] = "https://discord.com",
                },
                Body = game:GetService("HttpService"):JSONEncode(
                {
                    ["args"] = {
                        ["code"] = a,
                    },
                    ["cmd"] = "INVITE_BROWSER",
                    ["nonce"] = "."
                })
            })
        end})Settings_Discord:AddButton({text = "Copy Discord Invite", callback = function()
            setclipboard("https://discord.com/invite/"..a)
        end})Settings_Configs:AddBox({text = "Config Name", skipflag = true})Settings_Configs:AddList({text = "Configs", skipflag = true, flag = "Config List", values = d:GetConfigs(), value = ""})Settings_Configs:AddButton({text = "Create", callback = function()
            d:GetConfigs()
            writefile(d.foldername .. "/" .. d.flags["Config Name"] .. d.fileext, "{}")
            d.options["Config List"]:AddValue(d.flags["Config Name"])
        end})Settings_Configs:AddButton({text = "Save", callback = function()
            local a, c, e = d.round(d.flags["Menu Accent Color"])
            b.text = "Are you sure you want to save the current settings to config <font color='rgb(" .. a .. "," .. c .. "," .. e .. ")'>" .. d.flags["Config List"] .. "</font>?"
            if b:Show() then
                d:SaveConfig(d.flags["Config List"])
            end
        end})Settings_Configs:AddButton({text = "Load", callback = function()
            local a, c, e = d.round(d.flags["Menu Accent Color"])
            b.text = "Are you sure you want to load config <font color='rgb(" .. a .. "," .. c .. "," .. e .. ")'>" .. d.flags["Config List"] .. "</font>?"
            if b:Show() then
                d:LoadConfig(d.flags["Config List"])
            end
        end})Settings_Configs:AddButton({text = "Delete", callback = function()
            local a, c, e = d.round(d.flags["Menu Accent Color"])
            b.text = "Are you sure you want to delete config <font color='rgb(" .. a .. "," .. c .. "," .. e .. ")'>" .. d.flags["Config List"] .. "</font>?"
            if b:Show() then
                local a = d.flags["Config List"]
                if table.find(d:GetConfigs(), a) and isfile(d.foldername .. "/" .. a .. d.fileext) then
                    d.options["Config List"]:RemoveValue(a)
                    delfile(d.foldername .. "/" .. a .. d.fileext)
                end
            end
        end})Settings_Credits:AddLabel("1nferious#1691 ~ main dev")Settings_Credits:AddLabel("Scream#3766 ~ pfs dev")Settings_Credits:AddLabel("CriShoux#7827 ~ bismillah")Settings_Credits:AddLabel("JohnGoober#0120 ~ ida")Settings_Credits:AddLabel("chubs#1872 ~ designer")Settings_Credits:AddLabel("zal#0010 ~ awesome :3")Settings_Credits:AddLabel("IHaxU#0001 ~ gamer")Settings_Credits:AddLabel("HyperNite#8962 ~ wl-dev")d:Init()d:selectTab(d.tabs[1])end end
