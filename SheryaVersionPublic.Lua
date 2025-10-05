

-- Servicios (sin repeticiones)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local StarterPack = game:GetService("StarterPack")

-- Player
local player = Players.LocalPlayer
local LocalPlayer = Players.LocalPlayer

-- Variables globales
_G.whitelistedPlayers = _G.whitelistedPlayers or {}
if not table.find(_G.whitelistedPlayers, "") then
    table.insert(_G.whitelistedPlayers, "")
end

local connections = {}
local allActive = false

-- Función para manejar errores
local function safeCall(func, ...)
    local success, error = pcall(func, ...)
    if not success then
        warn("Error en script: " .. tostring(error))
    end
    return success
end

-- UI Window
local window = library:AddWindow("Pirlo script", {
    main_color = local rojo = Color3.fromRGB(255, 0, 0),
    min_size = Vector2.new(600, 650),
    can_resize = true,
})

local mainTab = window:AddTab("Main")
local farmTab = window:AddTab("Farm")
local miscTab = window:AddTab("Misc")
local pets = window:AddTab("Pets")
local Stats = window:AddTab("Stats")
local calculator = window:AddTab("Calculator")
local Killing = window:AddTab("Killer")
local Teleport = window:AddTab("Teleport")
local creditsTab = window:AddTab("Credits")

-- ============================================================================
-- MAIN TAB
-- ============================================================================

-- Auto Brawls Folder
local BrawlFolder = mainTab:AddFolder("  Auto Brawls")

local godModeToggle = false
BrawlFolder:AddSwitch("God Mode (Brawl)", function(State)
    godModeToggle = State
    if State then
        task.spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(0.1)
            end
        end)
    end
end)

local whitelist = {} 

local autoWinBrawlToggle = BrawlFolder:AddSwitch("Auto Win Brawls", function(bool)
    getgenv().autoWinBrawl = bool

    local function equipPunch()
        if not getgenv().autoWinBrawl then return end
        local character = game.Players.LocalPlayer.Character
        if not character then return false end
        if character:FindFirstChild("Punch") then return true end
        local backpack = game.Players.LocalPlayer.Backpack
        if not backpack then return false end
        for _, tool in pairs(backpack:GetChildren()) do
            if tool.ClassName == "Tool" and tool.Name == "Punch" then
                tool.Parent = character
                return true
            end
        end
        return false
    end

    local function isValidTarget(player)
        if not player or not player.Parent then return false end
        if player == Players.LocalPlayer then return false end
        if _G.whitelistedPlayers and table.find(_G.whitelistedPlayers, player.Name) then return false end
        local character = player.Character
        if not character or not character.Parent then return false end
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then return false end
        if not humanoid.Health or humanoid.Health <= 0 then return false end
        if humanoid:GetState() == Enum.HumanoidStateType.Dead then return false end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart or not rootPart.Parent then return false end
        return true
    end

    local function isLocalPlayerReady()
        local player = game.Players.LocalPlayer
        if not player then return false end
        local character = player.Character
        if not character or not character.Parent then return false end
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return false end
        local leftHand = character:FindFirstChild("LeftHand")
        local rightHand = character:FindFirstChild("RightHand")
        return (leftHand ~= nil or rightHand ~= nil)
    end

    local function safeTouchInterest(targetPart, localPart)
        if not targetPart or not targetPart.Parent then return false end
        if not localPart or not localPart.Parent then return false end
        local success = pcall(function()
            firetouchinterest(targetPart, localPart, 0)
            task.wait(0.01)
            firetouchinterest(targetPart, localPart, 1)
        end)
        return success
    end

    if bool then
        task.spawn(function()
            while getgenv().autoWinBrawl and task.wait(0.5) do
                if not getgenv().autoWinBrawl then break end
                pcall(function()
                    if game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible then
                        game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                        game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible = false
                    end
                end)
            end
        end)

        task.spawn(function()
            while getgenv().autoWinBrawl and task.wait(0.5) do
                if not getgenv().autoWinBrawl then break end
                equipPunch()
            end
        end)

        task.spawn(function()
            while getgenv().autoWinBrawl and task.wait(0.1) do
                if not getgenv().autoWinBrawl then break end
                if isLocalPlayerReady() and game.ReplicatedStorage.brawlInProgress.Value then
                    local player = game.Players.LocalPlayer
                    pcall(function() player.muscleEvent:FireServer("punch", "rightHand") end)
                    pcall(function() player.muscleEvent:FireServer("punch", "leftHand") end)
                end
            end
        end)

        task.spawn(function()
            while getgenv().autoWinBrawl and task.wait(0.05) do
                if not getgenv().autoWinBrawl then break end
                if isLocalPlayerReady() and game.ReplicatedStorage.brawlInProgress.Value then
                    local character = game.Players.LocalPlayer.Character
                    local leftHand = character:FindFirstChild("LeftHand")
                    local rightHand = character:FindFirstChild("RightHand")
                    for _, player in pairs(Players:GetPlayers()) do
                        if not getgenv().autoWinBrawl then break end
                        pcall(function()
                            if isValidTarget(player) then
                                local targetRoot = player.Character.HumanoidRootPart
                                if leftHand then
                                    safeTouchInterest(targetRoot, leftHand)
                                end
                                if rightHand then
                                    safeTouchInterest(targetRoot, rightHand)
                                end
                            end
                        end)
                        task.wait(0.01)
                    end
                end
            end
        end)
    end
end)

BrawlFolder:AddSwitch("Auto Join Brawls", function(bool)
    getgenv().autoJoinBrawl = bool
    if bool then
        task.spawn(function()
            while getgenv().autoJoinBrawl and task.wait(0.5) do
                if not getgenv().autoJoinBrawl then break end
                pcall(function()
                    if game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible then
                        game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                        game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible = false
                    end
                end)
            end
        end)
    end
end)

-- Jungle Gym Folder
local jungleGymFolder = mainTab:AddFolder("  Jungle Gym")

local function pressE()
    VirtualInputManager:SendKeyEvent(true, "E", false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, "E", false, game)
end

local function autoLift()
    while getgenv().working do
        LocalPlayer.muscleEvent:FireServer("rep")
        task.wait(0.1)
    end
end

local function teleportAndStart(machineName, position)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = position
        task.wait(0.1)
        pressE()
        task.spawn(autoLift)
    end
end

jungleGymFolder:AddSwitch("Jungle Bench Press", function(bool)
    if getgenv().working and not bool then
        getgenv().working = false
        return
    end
    getgenv().working = bool
    if bool then
        teleportAndStart("Bench Press", CFrame.new(-8173, 64, 1898))
    end
end)

jungleGymFolder:AddSwitch("Jungle Squat", function(bool)
    if getgenv().working and not bool then
        getgenv().working = false
        return
    end
    getgenv().working = bool
    if bool then
        teleportAndStart("Squat", CFrame.new(-8352, 34, 2878))
    end
end)

jungleGymFolder:AddSwitch("Jungle Pull Ups", function(bool)
    if getgenv().working and not bool then
        getgenv().working = false
        return
    end
    getgenv().working = bool
    if bool then
        teleportAndStart("Pull Up", CFrame.new(-8666, 34, 2070))
    end
end)

jungleGymFolder:AddSwitch("Jungle Boulder", function(bool)
    if getgenv().working and not bool then
        getgenv().working = false
        return
    end
    getgenv().working = bool
    if bool then
        teleportAndStart("Boulder", CFrame.new(-8621, 34, 2684))
    end
end)

-- All Gyms Folder
local farmGymsFolder = mainTab:AddFolder("  All Gyms")

local workoutPositions = {
    ["Bench Press"] = {
        ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        ["Legend Gym"] = CFrame.new(4111.91748, 1020.46674, -3799.97217),
        ["Muscle King Gym"] = CFrame.new(-8590.06152, 46.0167427, -6043.34717)
    },
    ["Squat"] = {
        ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
        ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477)
    },
    ["Deadlift"] = {
        ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
        ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477)
    },
    ["Pull Up"] = {
        ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
        ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477)
    }
}

local workoutTypes = {"Bench Press", "Squat", "Deadlift", "Pull Up"}
local gymLocations = {"Eternal Gym", "Legend Gym", "Muscle King Gym"}
local workoutTranslations = {
    ["Bench Press"] = "Bench Press",
    ["Squat"] = "Squat", 
    ["Deadlift"] = "Dead Lift",
    ["Pull Up"] = "Pull Up"
}

local gymToggles = {}
local selectedGym = {}

for _, workoutType in ipairs(workoutTypes) do
    local spanishWorkoutName = workoutTranslations[workoutType]
    
    local dropdown = farmGymsFolder:AddDropdown(spanishWorkoutName .. " - Gym", function(selected)
        selectedGym[workoutType] = selected
    end)
    
    for _, gymName in ipairs(gymLocations) do
        dropdown:Add(gymName)
    end
    
    local toggle = farmGymsFolder:AddSwitch(spanishWorkoutName, function(bool)
        getgenv().workingGym = bool
        getgenv().currentWorkoutType = workoutType
        
        if bool then
            local selectedGymName = selectedGym[workoutType] or gymLocations[1]
            
            if workoutPositions[workoutType] and workoutPositions[workoutType][selectedGymName] then
                for otherType, otherToggle in pairs(gymToggles) do
                    if otherType ~= workoutType and otherToggle then
                        otherToggle:Set(false)
                    end
                end
                teleportAndStart(workoutType, workoutPositions[workoutType][selectedGymName])
            end
        end
    end)
    
    gymToggles[workoutType] = toggle
end

-- Auto Snack Folder
local autoSnackFolder = mainTab:AddFolder("  Auto Snacks")

local activeSnacks = {
    ["Protein Shake"] = false,
    ["Energy Shake"] = false,
    ["TOUGH Bar"] = false,
    ["ULTRA Shake"] = false,
    ["Energy Bar"] = false,
    ["Protein Egg"] = false,
    ["Tropical Shake"] = false,
}

local snackConnections = {}

local function equipAndUse(itemName)
    local character = player.Character
    local backpack = player.Backpack
    
    if not character or not backpack then return end
    
    local tool = backpack:FindFirstChild(itemName)
    
    if tool then
        tool.Parent = character
        task.wait(0.1)
        
        local equippedTool = character:FindFirstChild(itemName)
        if equippedTool then
            equippedTool:Activate()
            
            local viewportSize = workspace.CurrentCamera.ViewportSize
            local x, y = viewportSize.X / 2, viewportSize.Y / 2
            VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
            task.wait(0.01)
            VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
        end
    end
end

local function startSnackLoop(itemName)
    if snackConnections[itemName] then
        task.cancel(snackConnections[itemName])
        snackConnections[itemName] = nil
    end
    
    snackConnections[itemName] = task.spawn(function()
        while activeSnacks[itemName] do
            local backpack = player.Backpack
            
            if backpack and backpack:FindFirstChild(itemName) then
                equipAndUse(itemName)
                task.wait(0.5)
            else
                activeSnacks[itemName] = false
                print("No more " .. itemName .. " available!")
                break
            end
            
            task.wait(0.1)
        end
    end)
end

local function startProteinEggLoop()
    if snackConnections["Protein Egg"] then
        task.cancel(snackConnections["Protein Egg"])
        snackConnections["Protein Egg"] = nil
    end
    
    snackConnections["Protein Egg"] = task.spawn(function()
        while activeSnacks["Protein Egg"] do
            local backpack = player.Backpack
            
            if backpack and backpack:FindFirstChild("Protein Egg") then
                equipAndUse("Protein Egg")
                print("Protein Egg usado! Esperando 30 minutos...")
                task.wait(1800)
            else
                activeSnacks["Protein Egg"] = false
                print("No more Protein Egg available!")
                break
            end
        end
    end)
end

local function startTropicalShakeLoop()
    if snackConnections["Tropical Shake"] then
        task.cancel(snackConnections["Tropical Shake"])
        snackConnections["Tropical Shake"] = nil
    end
    
    snackConnections["Tropical Shake"] = task.spawn(function()
        while activeSnacks["Tropical Shake"] do
            local backpack = player.Backpack
            
            if backpack and backpack:FindFirstChild("Tropical Shake") then
                equipAndUse("Tropical Shake")
                print("Tropical Shake usado! Esperando 15 minutos...")
                task.wait(900)
            else
                activeSnacks["Tropical Shake"] = false
                print("No more Tropical Shake available!")
                break
            end
        end
    end)
end

local function stopSnackLoop(itemName)
    if snackConnections[itemName] then
        task.cancel(snackConnections[itemName])
        snackConnections[itemName] = nil
    end
end

for _, snackName in pairs({"Protein Shake", "Energy Shake", "Tough Bar", "Ultra Shake", "Energy Bar"}) do
    local displayName = snackName == "Tough Bar" and "TOUGH Bar" or (snackName == "Ultra Shake" and "ULTRA Shake" or snackName)
    
    autoSnackFolder:AddSwitch(snackName, function(state)
        activeSnacks[displayName] = state
        if state then
            startSnackLoop(displayName)
        else
            stopSnackLoop(displayName)
        end
    end)
end

autoSnackFolder:AddSwitch("Protein Egg 30 Minuts", function(state)
    activeSnacks["Protein Egg"] = state
    if state then
        startProteinEggLoop()
    else
        stopSnackLoop("Protein Egg")
    end
end)

autoSnackFolder:AddSwitch("Tropical Shake 15 Minuts", function(state)
    activeSnacks["Tropical Shake"] = state
    if state then
        startTropicalShakeLoop()
    else
        stopSnackLoop("Tropical Shake")
    end
end)

-- Extras Folder
local MSCCFolder = mainTab:AddFolder("  Extras")

MSCCFolder:AddSwitch("Lock Position", function(Value)
    if Value then
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
            end
        end)
    else
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
            getgenv().posLock = nil
        end
    end
end)

MSCCFolder:AddSwitch("Anti Knockback", function(Value)
    safeCall(function()
        if Value then
            local playerName = game.Players.LocalPlayer.Name
            local rootPart = game.Workspace:FindFirstChild(playerName):FindFirstChild("HumanoidRootPart")
            if rootPart then
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000)
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.P = 1250
                bodyVelocity.Parent = rootPart
            end
        else
            local playerName = game.Players.LocalPlayer.Name
            local character = game.Workspace:FindFirstChild(playerName)
            if character then
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    local existingVelocity = rootPart:FindFirstChild("BodyVelocity")
                    if existingVelocity and existingVelocity.MaxForce == Vector3.new(100000, 0, 100000) then
                        existingVelocity:Destroy()
                    end
                end
            end
        end
    end)
end)

MSCCFolder:AddButton("Anti AFK", function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Anti AFK",
        Text = "Anti AFK se ha activado correctamente!",
        Duration = 3,
        Button1 = "OK"
    })
    
    local GC = getconnections or get_signal_cons
    if GC then
        for i, v in pairs(GC(game.Players.LocalPlayer.Idled)) do
            if v["Disable"] then
                v["Disable"](v)
            elseif v["Disconnect"] then
                v["Disconnect"](v)
            end
        end
    else
        local VirtualUser = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
    
    task.spawn(function()
        while task.wait(30) do
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end)

-- Farm Tab
local autoRockFolder = farmTab:AddFolder("  Auto Rock")

local function gettool()
    for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

local function createRockSwitch(name, selectRockName, durabilityRequirement)
    autoRockFolder:AddSwitch(name, function(Value)
        getgenv().autoFarm = Value
        
        if Value then
            task.spawn(function()
                while getgenv().autoFarm do
                    if not getgenv().autoFarm then break end
                    
                    pcall(function()
                        if LocalPlayer.Durability.Value >= durabilityRequirement then
                            local character = LocalPlayer.Character
                            if character and character:FindFirstChild("LeftHand") and character:FindFirstChild("RightHand") then
                                for i, v in pairs(Workspace.machinesFolder:GetDescendants()) do
                                    if v.Name == "neededDurability" and v.Value == durabilityRequirement then
                                        local rock = v.Parent.Rock
                                        firetouchinterest(rock, character.RightHand, 0)
                                        firetouchinterest(rock, character.RightHand, 1)
                                        firetouchinterest(rock, character.LeftHand, 0)
                                        firetouchinterest(rock, character.LeftHand, 1)
                                        gettool()
                                        break
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end)
end

local rocks = {
    {"Tiny Rock", "Tiny Island Rock", 0},
    {"Starter Rock", "Starter Island Rock", 100},
    {"Legend Beach Rock", "Legend Beach Rock", 5000},
    {"Frozen Rock", "Frost Gym Rock", 150000},
    {"Mythical Rock", "Mythical Gym Rock", 400000},
    {"Eternal Rock", "Eternal Gym Rock", 750000},
    {"Legend Rock", "Legend Gym Rock", 1000000},
    {"Muscle King Rock", "Muscle King Gym Rock", 5000000},
    {"Jungle Rock", "Ancient Jungle Rock", 10000000}
}

for _, rockData in pairs(rocks) do
    createRockSwitch(rockData[1], rockData[2], rockData[3])
end

-- Auto Tools Folder
local autoEquipToolsFolder = farmTab:AddFolder("  Auto Tools")

autoEquipToolsFolder:AddButton("Gamepass AutoLift", function()
    safeCall(function()
        local gamepassFolder = game:GetService("ReplicatedStorage").gamepassIds
        local player = game:GetService("Players").LocalPlayer
        for _, gamepass in pairs(gamepassFolder:GetChildren()) do
            local value = Instance.new("IntValue")
            value.Name = gamepass.Name
            value.Value = gamepass.Value
            value.Parent = player.ownedGamepasses
        end
    end)
end)

local function createAutoToolSwitch(toolName, globalVar)
    autoEquipToolsFolder:AddSwitch("Auto " .. toolName, function(Value)
        _G[globalVar] = Value
        
        if Value then
            task.spawn(function()
                local tool = LocalPlayer.Backpack:FindFirstChild(toolName)
                if tool then
                    LocalPlayer.Character.Humanoid:EquipTool(tool)
                end
                
                while _G[globalVar] do
                    if not _G[globalVar] then break end
                    LocalPlayer.muscleEvent:FireServer("rep")
                    task.wait(0.1)
                end
            end)
        else
            local character = LocalPlayer.Character
            if character then
                local equipped = character:FindFirstChild(toolName)
                if equipped then
                    equipped.Parent = LocalPlayer.Backpack
                end
            end
        end
    end)
end

local tools = {
    {"Weight", "AutoWeight"},
    {"Pushups", "AutoPushups"},
    {"Handstands", "AutoHandstands"},
    {"Situps", "AutoSitups"}
}

for _, toolData in pairs(tools) do
    createAutoToolSwitch(toolData[1], toolData[2])
end

autoEquipToolsFolder:AddSwitch("Auto Punch", function(Value)
    _G.fastHitActive = Value
    
    if Value then
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then
                    punch.Parent = LocalPlayer.Character
                    if punch:FindFirstChild("attackTime") then
                        punch.attackTime.Value = 0
                    end
                end
                task.wait(0.1)
            end
        end)
        
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                
                local character = LocalPlayer.Character
                if character then
                    local punchTool = character:FindFirstChild("Punch")
                    if punchTool then
                        punchTool:Activate()
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        local character = LocalPlayer.Character
        if character then
            local equipped = character:FindFirstChild("Punch")
            if equipped then
                equipped.Parent = LocalPlayer.Backpack
            end
        end
    end
end)

autoEquipToolsFolder:AddSwitch("Fast Tools", function(Value)
    _G.FastTools = Value
    
    local toolSettings = {
        {"Punch", "attackTime", Value and 0 or 0.35},
        {"Ground Slam", "attackTime", Value and 0 or 6},
        {"Stomp", "attackTime", Value and 0 or 7},
        {"Handstands", "repTime", Value and 0 or 1},
        {"Pushups", "repTime", Value and 0 or 1},
        {"Weight", "repTime", Value and 0 or 1},
        {"Situps", "repTime", Value and 0 or 1}
    }
    
    local backpack = LocalPlayer:WaitForChild("Backpack")
    
    for _, toolInfo in ipairs(toolSettings) do
        local tool = backpack:FindFirstChild(toolInfo[1])
        if tool and tool:FindFirstChild(toolInfo[2]) then
            tool[toolInfo[2]].Value = toolInfo[3]
        end
        
        local equippedTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(toolInfo[1])
        if equippedTool and equippedTool:FindFirstChild(toolInfo[2]) then
            equippedTool[toolInfo[2]].Value = toolInfo[3]
        end
    end
end)

-- Auto Rebirths Folder
local Rebirth = farmTab:AddFolder("  Auto Rebirths")

local targetRebirthAmount = 1
local leaderstats = LocalPlayer:WaitForChild("leaderstats")
local MuscleEvent = LocalPlayer.muscleEvent
local repSpeed = 10

Rebirth:AddTextBox("Target Rebirth Amount", function(value)
    local amount = tonumber(value) or 1
    local currentRebirths = leaderstats.Rebirths.Value
    if amount >= currentRebirths then
        targetRebirthAmount = amount
    end
end, {clear = false})

local targetRebirthToggle = Rebirth:AddSwitch("Target Rebirth", function(enabled)
    if enabled then
        task.spawn(function()
            while enabled do
                local currentRebirths = leaderstats.Rebirths.Value
                local requiredStrength = 10000 + 5000 * currentRebirths
                
                if currentRebirths >= targetRebirthAmount then
                    targetRebirthToggle:Set(false)
                    break
                end
                
                if leaderstats.Strength.Value >= requiredStrength then
                    ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    task.wait(0.7)
                else
                    for i = 1, repSpeed do
                        MuscleEvent:FireServer("rep")
                    end
                end
                
                task.wait(0.1)
            end
        end)
    end
end)

Rebirth:AddSwitch("Auto Rebirth (infinite)", function(state)
    if state then
        task.spawn(function()
            while state do
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer("rebirthRequest")
                task.wait(0.1)
            end
        end)
    end
end)

Rebirth:AddSwitch("Auto Teleport King", function(state)
    if state then
        task.spawn(function()
            while state and task.wait(0) do
                local player = game.Players.LocalPlayer
                if player.Character then
                    player.Character:MoveTo(Vector3.new(-8646, 17, -5738))
                end
            end
        end)
    end
end)

Rebirth:AddSwitch("Auto Size 2", function(state)
    if state then
        task.spawn(function()
            while state and task.wait(0) do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
            end
        end)
    end
end)

-- Pack Farm Folder
local PackFarmFolder = farmTab:AddFolder("  Packs Farm")

local packRebirthValues = {
    [0] = 1, [1] = 2, [2] = 4, [3] = 6, [4] = 8, [5] = 10, [6] = 12, [7] = 14, [8] = 16
}

local function formatNumber(number)
    if number >= 1e15 then return string.format("%.2fQ", number/1e15)
    elseif number >= 1e12 then return string.format("%.2fT", number/1e12)
    elseif number >= 1e9 then return string.format("%.2fB", number/1e9)
    elseif number >= 1e6 then return string.format("%.2fM", number/1e6)
    elseif number >= 1e3 then return string.format("%.2fK", number/1e3)
    end
    return tostring(math.floor(number))
end

local function unequipAllPets()
    local petsFolder = player.petsFolder
    if petsFolder then
        for _, folder in pairs(petsFolder:GetChildren()) do
            if folder:IsA("Folder") then
                for _, pet in pairs(folder:GetChildren()) do
                    ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
                end
            end
        end
    end
    task.wait(0.1)
end

local function equipSpecificPacks(packName, count)
    unequipAllPets()
    task.wait(0.2)

    local packs = {}
    if player.petsFolder and player.petsFolder:FindFirstChild("Unique") then
        for _, pet in pairs(player.petsFolder.Unique:GetChildren()) do
            if pet.Name == packName then
                table.insert(packs, pet)
            end
        end
    end

    local packsToEquip = math.min(count, #packs)
    for i = 1, packsToEquip do
        ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", packs[i])
        task.wait(0.1)
    end

    return packsToEquip
end

local function findMachine(machineName)
    local machine = workspace.machinesFolder:FindFirstChild(machineName)
    if not machine then
        for _, folder in pairs(workspace:GetChildren()) do
            if folder:IsA("Folder") and folder.Name:find("machines") then
                machine = folder:FindFirstChild(machineName)
                if machine then break end
            end
        end
    end
    return machine
end

local isPositionLocked = false
local originalCFrame = nil
local function lockPosition(lock)
    isPositionLocked = lock

    if lock and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        originalCFrame = player.Character.HumanoidRootPart.CFrame

        if not _G.positionConnection then
            _G.positionConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if isPositionLocked and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and originalCFrame then
                    player.Character.HumanoidRootPart.CFrame = originalCFrame
                    player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    player.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
                end
            end)
        end
    elseif not lock and _G.positionConnection then
        _G.positionConnection:Disconnect()
        _G.positionConnection = nil
    end
end

local targetRebirth = math.huge
local packFarmTarget = false
local packFarmInfinite = false
local fastStrength = false

PackFarmFolder:AddTextBox("Target Rebirth Amount", function(text)
    local num = tonumber(text)
    if num then
        targetRebirth = num
    else
        targetRebirth = math.huge
    end
end)

local targetPackToggle = PackFarmFolder:AddSwitch("Pack Farm | Target", function(bool)
    packFarmTarget = bool

    if bool then
        if packFarmInfinite then
            packFarmInfinite = false
        end

        if fastStrength then
            fastStrength = false
        end

        if targetRebirth ~= math.huge and targetRebirth > player.leaderstats.Rebirths.Value then
            task.spawn(function()
                lockPosition(true)

                while packFarmTarget do
                    local currentRebirths = player.leaderstats.Rebirths.Value

                    if currentRebirths >= targetRebirth then
                        packFarmTarget = false
                        targetPackToggle:Set(false)
                        lockPosition(false)
                        break
                    end

                    local rebirthCost = 10000 + (5000 * currentRebirths)
                    if player.ultimatesFolder and player.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                        local goldenRebirths = player.ultimatesFolder["Golden Rebirth"].Value
                        rebirthCost = math.floor(rebirthCost * (1 - (goldenRebirths * 0.1)))
                    end

                    local rebirthsNeeded = targetRebirth - currentRebirths
                    local packCount = 0

                    if rebirthsNeeded == 1 then
                        packCount = 0
                    else
                        for i = 8, 1, -1 do
                            if packRebirthValues[i] <= rebirthsNeeded then
                                packCount = i
                                break
                            end
                        end
                    end

                    equipSpecificPacks("Swift Samurai", 8)

                    while packFarmTarget and player.leaderstats.Strength.Value < rebirthCost do
                        for i = 1, 10 do
                            player.muscleEvent:FireServer("rep")
                        end
                        task.wait(0.1)
                    end

                    equipSpecificPacks("Tribal Overlord", packCount)

                    local machine = findMachine("Jungle Bar Lift")
                    if machine and machine:FindFirstChild("interactSeat") then
                        player.Character.HumanoidRootPart.CFrame = machine.interactSeat.CFrame * CFrame.new(0, 3, 0)
                        repeat
                            task.wait(0.1)
                            pressE()
                        until player.Character.Humanoid.Sit
                    end

                    local initialRebirths = player.leaderstats.Rebirths.Value
                    repeat
                        ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                        task.wait(0.1)
                    until player.leaderstats.Rebirths.Value > initialRebirths

                    task.wait(0.5)
                end

                lockPosition(false)
                unequipAllPets()
            end)
        else
            packFarmTarget = false
            targetPackToggle:Set(false)
        end
    else
        lockPosition(false)
        unequipAllPets()
    end
end)

local infinitePackToggle = PackFarmFolder:AddSwitch("Pack Farm | Infinite", function(bool)
    packFarmInfinite = bool

    if bool then
        if packFarmTarget then
            packFarmTarget = false
            targetPackToggle:Set(false)
        end

        if fastStrength then
            fastStrength = false
        end

        task.spawn(function()
            lockPosition(true)

            while packFarmInfinite do
                local currentRebirths = player.leaderstats.Rebirths.Value
                local rebirthCost = 10000 + (5000 * currentRebirths)
                
                if player.ultimatesFolder and player.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                    local goldenRebirths = player.ultimatesFolder["Golden Rebirth"].Value
                    rebirthCost = math.floor(rebirthCost * (1 - (goldenRebirths * 0.1)))
                end

                equipSpecificPacks("Swift Samurai", 8)

                while packFarmInfinite and player.leaderstats.Strength.Value < rebirthCost do
                    for i = 1, 10 do
                        player.muscleEvent:FireServer("rep")
                    end
                    task.wait(0.1)
                end

                equipSpecificPacks("Tribal Overlord", 8)

                local machine = findMachine("Jungle Bar Lift")
                if machine and machine:FindFirstChild("interactSeat") then
                    player.Character.HumanoidRootPart.CFrame = machine.interactSeat.CFrame * CFrame.new(0, 3, 0)
                    repeat
                        task.wait(0.1)
                        pressE()
                    until player.Character.Humanoid.Sit
                end

                local initialRebirths = player.leaderstats.Rebirths.Value
                repeat
                    ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    task.wait(0.1)
                until player.leaderstats.Rebirths.Value > initialRebirths

                task.wait(0.5)
            end

            lockPosition(false)
            unequipAllPets()
        end)
    else
        lockPosition(false)
        unequipAllPets()
    end
end)

local fastStrengthToggle = PackFarmFolder:AddSwitch("Pack Farm | Fast Strength", function(bool)
    fastStrength = bool

    if bool then
        if packFarmTarget then
            packFarmTarget = false
            targetPackToggle:Set(false)
        end

        if packFarmInfinite then
            packFarmInfinite = false
            infinitePackToggle:Set(false)
        end

        task.spawn(function()
            equipSpecificPacks("Swift Samurai", 8)

            while fastStrength do
                for i = 1, 10 do
                    player.muscleEvent:FireServer("rep")
                end
                task.wait(0.1)
            end
        end)
    else
        unequipAllPets()
    end
end)

PackFarmFolder:AddSwitch("Hide All Frames", function(state)
    local rSto = game:GetService("ReplicatedStorage")
    for _, obj in pairs(rSto:GetChildren()) do
        if obj.Name:match("Frame$") and obj:IsA("GuiObject") then
            obj.Visible = not state
        end
    end
end)

-- Anti Lag System
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local antiLagOn = false
local modifiedParts = {}
local charConn
local stepConn
local pointLight
local savedLighting = nil

local function snapshotLighting()
    return {
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        Brightness = Lighting.Brightness,
        FogStart = Lighting.FogStart,
        FogEnd = Lighting.FogEnd,
        ClockTime = Lighting.ClockTime,
        GlobalShadows = Lighting.GlobalShadows,
    }
end

local function restoreLighting(snap)
    if not snap then return end
    Lighting.Ambient = snap.Ambient
    Lighting.OutdoorAmbient = snap.OutdoorAmbient
    Lighting.Brightness = snap.Brightness
    Lighting.FogStart = snap.FogStart
    Lighting.FogEnd = snap.FogEnd
    Lighting.ClockTime = snap.ClockTime
    Lighting.GlobalShadows = snap.GlobalShadows
end

local function applyBlackoutForCharacter(character)
    if not character then return end

    if not savedLighting then
        savedLighting = snapshotLighting()
    end
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
    Lighting.Brightness = 0
    Lighting.GlobalShadows = true
    Lighting.ClockTime = 0
    Lighting.FogStart = 0
    Lighting.FogEnd = 20

    table.clear(modifiedParts)
    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst:IsA("BasePart") and not inst:IsDescendantOf(character) then
            modifiedParts[inst] = inst.LocalTransparencyModifier
            inst.LocalTransparencyModifier = 1
        end
    end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        pointLight = pointLight or Instance.new("PointLight")
        pointLight.Parent = hrp
        pointLight.Range = 20
        pointLight.Brightness = 2
        pointLight.Shadows = false
    end
end

local function removeBlackout()
    if savedLighting then
        restoreLighting(savedLighting)
        savedLighting = nil
    end
    if pointLight then
        pcall(function() pointLight:Destroy() end)
        pointLight = nil
    end
    for part, prev in pairs(modifiedParts) do
        if part and part.Parent then
            part.LocalTransparencyModifier = prev or 0
        end
    end
    table.clear(modifiedParts)
end

local function bindCharacter(character)
    if not antiLagOn then return end
    task.delay(0.1, function()
        applyBlackoutForCharacter(character)
    end)
end

local function hookCharacterEvents()
    if charConn then charConn:Disconnect() end
    charConn = LocalPlayer.CharacterAdded:Connect(bindCharacter)
end

PackFarmFolder:AddSwitch("Anti Lag (Blackout)", function(state)
    antiLagOn = state
    if state then
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        applyBlackoutForCharacter(character)
        hookCharacterEvents()

        if stepConn then stepConn:Disconnect() end
        stepConn = RunService.Heartbeat:Connect(function()
            if not antiLagOn then return end
            local character = LocalPlayer.Character
            for _, inst in ipairs(workspace:GetDescendants()) do
                if inst:IsA("BasePart") and (not character or not inst:IsDescendantOf(character)) then
                    if inst.LocalTransparencyModifier ~= 1 then
                        modifiedParts[inst] = inst.LocalTransparencyModifier
                        inst.LocalTransparencyModifier = 1
                    end
                end
            end
        end)
    else
        if stepConn then stepConn:Disconnect() stepConn = nil end
        if charConn then charConn:Disconnect() charConn = nil end
        removeBlackout()
    end
end)

-- Clean up connections when player leaves
player.AncestryChanged:Connect(function()
    if not player.Parent then
        for itemName, connection in pairs(snackConnections) do
            if connection then
                task.cancel(connection)
            end
        end
        snackConnections = {}
        
        if _G.positionConnection then
            _G.positionConnection:Disconnect()
            _G.positionConnection = nil
        end
        
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
            getgenv().posLock = nil
        end
        
        if stepConn then stepConn:Disconnect() end
        if charConn then charConn:Disconnect() end
    end
end)

-- Función para unequipar todas las pets
local function unequipAllPets()
    safeCall(function()
        local petsFolder = game.Players.LocalPlayer.petsFolder
        for _, folder in pairs(petsFolder:GetChildren()) do
            if folder:IsA("Folder") then
                for _, pet in pairs(folder:GetChildren()) do
                    game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("unequipPet", pet)
                end
            end
        end
        task.wait(0.2)
    end)
end

-- Función para equipar pets específicas
local function equipSpecificPets(petName, maxPets)
    safeCall(function()
        -- Primero unequipar todas las pets
        unequipAllPets()
        
        local petsToEquip = {}
        local uniqueFolder = game.Players.LocalPlayer.petsFolder.Unique
        
        if uniqueFolder then
            for _, pet in pairs(uniqueFolder:GetChildren()) do
                if pet.Name == petName then
                    table.insert(petsToEquip, pet)
                end
            end
        end

        local equippedCount = math.min(#petsToEquip, maxPets or 8)

        for i = 1, equippedCount do
            game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("equipPet", petsToEquip[i])
            task.wait(0.1)
        end
        
        print("Equipped " .. equippedCount .. " " .. petName .. " pets")
    end)
end

-- Botón para Swift Samurai
PackFarmFolder:AddButton("Equip Swift Samurai (8x)", function()
    equipSpecificPets("Swift Samurai", 8)
end)

-- Botón para Tribal Overlord
PackFarmFolder:AddButton("Equip Tribal Overlord (8x)", function()
    equipSpecificPets("Tribal Overlord", 8)
end)

-- ============================================================================
-- MISC TAB
-- ============================================================================

-- Misc 1 Folder
local misc1Folder = miscTab:AddFolder("  Misc 1")

local sizeValue = 2
local speedValue = 16
local autoSizeEnabled = false
local autoSpeedEnabled = false
local autoSizeConnection = nil
local autoSpeedConnection = nil

misc1Folder:AddTextBox("Auto Size", function(text)
    sizeValue = tonumber(text) or 2

    if autoSizeEnabled then
        safeCall(function()
            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", sizeValue)
        end)
    end
end)

misc1Folder:AddSwitch("Auto Set Size", function(bool)
    autoSizeEnabled = bool

    if autoSizeEnabled then
        spawn(function()
            while autoSizeEnabled do
                safeCall(function()
                    game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", sizeValue)
                end)
                wait(0.1)
            end
        end)
    end
end)

misc1Folder:AddTextBox("Auto Speed", function(text)
    speedValue = tonumber(text) or 16

    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = speedValue
    end
end)

misc1Folder:AddSwitch("Auto Set Speed", function(bool)
    autoSpeedEnabled = bool

    if autoSpeedEnabled then
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = speedValue
        end

        if autoSpeedConnection then
            autoSpeedConnection:Disconnect()
        end

        autoSpeedConnection = player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = speedValue
            end
        end)
    else
        if autoSpeedConnection then
            autoSpeedConnection:Disconnect()
            autoSpeedConnection = nil
        end
    end
end)

-- Misc 2 Folder
local Misc2 = miscTab:AddFolder("  Misc 2")

Misc2:AddButton("Infinite Yield", function()
    safeCall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

Misc2:AddButton("GhostX Hub", function()
    safeCall(function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-GhostX-Hub-7158"))()
    end)
end)

-- Misc 3 Folder
local misc3Folder = miscTab:AddFolder("  Misc 3")

misc3Folder:AddSwitch("No-Clip", function(bool)
    _G.NoClip = bool
    
    if bool then
        local noclipLoop
        noclipLoop = game:GetService("RunService").Stepped:Connect(function()
            if _G.NoClip then
                safeCall(function()
                    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end)
            else
                noclipLoop:Disconnect()
            end
        end)
        
        safeCall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "No-Clip Activado",
                Text = "Ahora puedes atravesar objetos",
                Duration = 3
            })
        end)
    end
end)

misc3Folder:AddSwitch("Jump Infinite", function(bool)
    _G.InfiniteJump = bool
    
    if bool then
        local InfiniteJumpConnection
        InfiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                safeCall(function()
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end)
            else
                InfiniteJumpConnection:Disconnect()
            end
        end)
        
        safeCall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Salto Infinito Activado",
                Text = "Ahora puedes saltar sin límites",
                Duration = 3
            })
        end)
    end
end)

local timeDropdown = misc3Folder:AddDropdown("Change Time", function(selection)
    safeCall(function()
        local lighting = game:GetService("Lighting")
        
        if selection == "Night" then
            lighting.ClockTime = 0
        elseif selection == "Day" then
            lighting.ClockTime = 12
        elseif selection == "Midnight" then
            lighting.ClockTime = 6
        end
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Time Changed",
            Text = "Time has been changed to: " .. selection,
            Duration = 3
        })
    end)
end)

timeDropdown:Add("Night")
timeDropdown:Add("Day")
timeDropdown:Add("Midnight")

-- Misc 4 Folder
local misc4Folder = miscTab:AddFolder("  Misc 4")

misc4Folder:AddSwitch("Disable Trade", function(State)
    safeCall(function()
        if State then
            game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("disableTrading")
        else
            game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("enableTrading")
        end
    end)
end)

misc4Folder:AddSwitch("Hide Pets", function(State)
    safeCall(function()
        if State then
            game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("hidePets")
        else
            game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("showPets")
        end
    end)
end)

-- ============================================================================
-- PETS TAB
-- ============================================================================

local crystalData = {
    ["Blue Crystal"] = {
        {name = "Blue Birdie", rarity = "Basic"},
        {name = "Orange Hedgehog", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Red Kitty", rarity = "Basic"},
        {name = "Dark Vampy", rarity = "Advanced"},
        {name = "Blue Bunny", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Green Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Green Crystal"] = {
        {name = "Silver Dog", rarity = "Basic"},
        {name = "Green Aura", rarity = "Advanced"},
        {name = "Dark Golem", rarity = "Advanced"},
        {name = "Green Butterfly", rarity = "Advanced"},
        {name = "Crimson Falcon", rarity = "Rare"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Frost Crystal"] = {
        {name = "Yellow Butterfly", rarity = "Advanced"},
        {name = "Purple Dragon", rarity = "Rare"},
        {name = "Blue Pheonix", rarity = "Epic"},
        {name = "Orange Pegasus", rarity = "Rare"},
        {name = "Lightning", rarity = "Rare"},
        {name = "Electro", rarity = "Advanced"}
    },
    ["Mythical Crystal"] = {
        {name = "Purple Falcon", rarity = "Rare"},
        {name = "Red Dragon", rarity = "Rare"},
        {name = "Blue Firecaster", rarity = "Epic"},
        {name = "Golden Pheonix", rarity = "Epic"},
        {name = "Power Lightning", rarity = "Rare"},
        {name = "Dark Lightning", rarity = "Epic"}
    },
    ["Inferno Crystal"] = {
        {name = "Red Firecaster", rarity = "Epic"},
        {name = "Infernal Dragon", rarity = "Unique"},
        {name = "White Pegasus", rarity = "Rare"},
        {name = "Golden Pheonix", rarity = "Epic"},
        {name = "Inferno", rarity = "Epic"},
        {name = "Dark Storm", rarity = "Unique"}
    },
    ["Legends Crystal"] = {
        {name = "Ultra Birdie", rarity = "Unique"},
        {name = "Magic Butterfly", rarity = "Unique"},
        {name = "Green Firecaster", rarity = "Epic"},
        {name = "White Pheonix", rarity = "Epic"},
        {name = "Supernova", rarity = "Epic"},
        {name = "Purple Nova", rarity = "Unique"}
    },
    ["Muscle Elite Crystal"] = {
        {name = "Frostwave Legends Penguin", rarity = "Rare"},
        {name = "Phantom Genesis Dragon", rarity = "Rare"},
        {name = "Dark Legends Manticore", rarity = "Epic"},
        {name = "Ultimate Supernova Pegasus", rarity = "Epic"},
        {name = "Aether Spirit Bunny", rarity = "Unique"},
        {name = "Cybernetic Showdown Dragon", rarity = "Unique"}
    },
    ["Galaxy Oracle Crystal"] = {
        {name = "Eternal Strike Leviathan", rarity = "Rare"},
        {name = "Lightning Strike Phantom", rarity = "Epic"},
        {name = "Darkstar Hunter", rarity = "Unique"},
        {name = "Muscle King", rarity = "Unique"},
        {name = "Azure Tundra", rarity = "Epic"},
        {name = "Ultra Inferno", rarity = "Rare"}
    },
    ["Jungle Crystal"] = {
        {name = "Entropic Blast", rarity = "Unique"},
        {name = "Muscle Sensei", rarity = "Unique"},
        {name = "Grand Supernova", rarity = "Epic"},
        {name = "Neon Guardian", rarity = "Unique"},
        {name = "Eternal Megastrike", rarity = "Unique"},
        {name = "Golden Viking", rarity = "Epic"},
        {name = "Astral Electro", rarity = "Epic"},
        {name = "Dark Electro", rarity = "Epic"},
        {name = "Enchanted Mirage", rarity = "Epic"},
        {name = "Ultra Mirage", rarity = "Unique"},
        {name = "Unstable Mirage", rarity = "Unique"}
    }
}

-- Function to find which crystal contains a specific pet/aura
local function findCrystalForItem(itemName)
    for crystalName, pets in pairs(crystalData) do
        for _, pet in ipairs(pets) do
            if pet.name == itemName then
                return crystalName
            end
        end
    end
    return nil
end

-- Variables to track current selections
local selectedPet = ""
local selectedAura = ""

pets:AddLabel("=== Pet & Aura Auto Buy ===")

-- Pet dropdown
local petDropdown = pets:AddDropdown("Select Pet", function(text)
    selectedPet = text
    local crystal = findCrystalForItem(text)
    print("Pet selected: " .. text .. " (Found in: " .. (crystal or "Unknown") .. ")")
end)

-- Add pets sorted by rarity
local petOptions = {
    "Blue Birdie", "Orange Hedgehog", "Red Kitty", "Blue Bunny", "Silver Dog",
    "Dark Vampy", "Dark Golem", "Green Butterfly", "Yellow Butterfly",
    "Crimson Falcon", "Purple Dragon", "Orange Pegasus", "Purple Falcon", 
    "Red Dragon", "White Pegasus", "Frostwave Legends Penguin", "Phantom Genesis Dragon", 
    "Eternal Strike Leviathan", "Blue Pheonix", "Blue Firecaster", "Golden Pheonix", 
    "Red Firecaster", "Green Firecaster", "White Pheonix", "Dark Legends Manticore", 
    "Ultimate Supernova Pegasus", "Lightning Strike Phantom", "Golden Viking",
    "Infernal Dragon", "Ultra Birdie", "Magic Butterfly", "Aether Spirit Bunny", 
    "Cybernetic Showdown Dragon", "Darkstar Hunter", "Muscle Sensei", "Neon Guardian"
}

for _, pet in ipairs(petOptions) do
    petDropdown:Add(pet)
end

-- Aura dropdown
local auraDropdown = pets:AddDropdown("Select Aura", function(text)
    selectedAura = text
    local crystal = findCrystalForItem(text)
    print("Aura selected: " .. text .. " (Found in: " .. (crystal or "Unknown") .. ")")
end)

local auraOptions = {
    "Blue Aura", "Green Aura", "Purple Aura", "Red Aura", "Yellow Aura",
    "Ultra Inferno", "Azure Tundra", "Grand Supernova", "Muscle King", 
    "Entropic Blast", "Eternal Megastrike"
}

for _, aura in ipairs(auraOptions) do
    auraDropdown:Add(aura)
end

pets:AddLabel("=== Auto Buy Controls ===")

-- Auto buy pet toggle
pets:AddSwitch("Auto Buy Pet", function(bool)
    _G.AutoBuyPet = bool
    
    if bool then
        if selectedPet == "" then
            print("Please select a pet first!")
            return
        end
        
        print("Auto buy pet started for: " .. selectedPet)
        spawn(function()
            while _G.AutoBuyPet and selectedPet ~= "" do
                local petToBuy = ReplicatedStorage.cPetShopFolder:FindFirstChild(selectedPet)
                if petToBuy then
                    safeCall(function()
                        ReplicatedStorage.cPetShopRemote:InvokeServer(petToBuy)
                    end)
                    print("Bought pet: " .. selectedPet)
                else
                    print("Pet not found: " .. selectedPet)
                end
                task.wait(1)
            end
        end)
    else
        print("Auto buy pet stopped")
    end
end)

-- Auto buy aura toggle
pets:AddSwitch("Auto Buy Aura", function(bool)
    _G.AutoBuyAura = bool
    
    if bool then
        if selectedAura == "" then
            print("Please select an aura first!")
            return
        end
        
        print("Auto buy aura started for: " .. selectedAura)
        spawn(function()
            while _G.AutoBuyAura and selectedAura ~= "" do
                local auraToBuy = ReplicatedStorage.cPetShopFolder:FindFirstChild(selectedAura)
                if auraToBuy then
                    safeCall(function()
                        ReplicatedStorage.cPetShopRemote:InvokeServer(auraToBuy)
                    end)
                    print("Bought aura: " .. selectedAura)
                else
                    print("Aura not found: " .. selectedAura)
                end
                task.wait(1)
            end
        end)
    else
        print("Auto buy aura stopped")
    end
end)

pets:AddLabel("=== Ultimate Upgrades ===")

-- Ultimate options
local ultimateOptions = {
    "+1 Daily Spin",
    "+1 Pet Slot",
    "+10 Item Capacity",
    "+5% Rep Speed",
    "Demon Damage",
    "Galaxy Gains",
    "Golden Rebirth",
    "Jungle Swift",
    "Muscle Mind",
    "x2 Chest Rewards",
    "x2 Quest Rewards"
}

-- Variable to track selected ultimate
local selectedUltimate = ""

-- Ultimate dropdown
local ultimateDropdown = pets:AddDropdown("Select Ultimate", function(text)
    selectedUltimate = text
    print("Ultimate selected: " .. text)
end)

-- Add all ultimate options to dropdown
for _, ultimate in ipairs(ultimateOptions) do
    ultimateDropdown:Add(ultimate)
end

-- Auto upgrade ultimate toggle
pets:AddSwitch("Auto Upgrade Ultimate", function(bool)
    _G.AutoUpgradeUltimate = bool
    
    if bool then
        if selectedUltimate == "" then
            print("Please select an ultimate first!")
            return
        end
        
        print("Auto upgrade ultimate started for: " .. selectedUltimate)
        spawn(function()
            while _G.AutoUpgradeUltimate and selectedUltimate ~= "" do
                safeCall(function()
                    game:GetService("ReplicatedStorage").rEvents.ultimatesRemote:InvokeServer(
                        "upgradeUltimate",
                        selectedUltimate
                    )
                end)
                print("Upgraded ultimate: " .. selectedUltimate)
                task.wait(1)
            end
        end)
    else
        print("Auto upgrade ultimate stopped")
    end
end)

-- ============================================================================
-- STATS TAB
-- ============================================================================

local function abbreviateNumber(value)
    if value >= 1e15 then
        return string.format("%.1fQa", value / 1e15)
    elseif value >= 1e12 then
        return string.format("%.1fT", value / 1e12)
    elseif value >= 1e9 then
        return string.format("%.1fB", value / 1e9)
    elseif value >= 1e6 then
        return string.format("%.1fM", value / 1e6)
    elseif value >= 1e3 then
        return string.format("%.1fK", value / 1e3)
    else
        return tostring(value)
    end
end

-- ============================================================================
-- SESSION STATS FOLDER
-- ============================================================================

local sessionStatsFolder = Stats:AddFolder("  Session Stats")

local sessionLabels = {
    TimeSpentLabel = sessionStatsFolder:AddLabel("Time spent in this server: 00:00"),
    StrengthGainedLabel = sessionStatsFolder:AddLabel("Amount of strength gained in this server: 0"),
    DurabilityGainedLabel = sessionStatsFolder:AddLabel("Amount of durability gained in this server: 0"),
    AgilityGainedLabel = sessionStatsFolder:AddLabel("Amount of agility gained in this server: 0"),
    KillsGainedLabel = sessionStatsFolder:AddLabel("Amount of kills gained in this server: 0"),
    EvilKarmaGainedLabel = sessionStatsFolder:AddLabel("Amount of Evil Karma gained in this server: 0"),
    GoodKarmaGainedLabel = sessionStatsFolder:AddLabel("Amount of Good Karma gained in this server: 0"),
    RebirthsGainedLabel = sessionStatsFolder:AddLabel("Amount of rebirths gained in this server: 0")
}

local function createSessionStats()
    local player = game.Players.LocalPlayer
    if not player then
        warn("Player not found!")
        return
    end

    local leaderstats = player:WaitForChild("leaderstats", 10)
    if not leaderstats then
        warn("leaderstats not found!")
        return
    end

    local strengthStat = leaderstats:WaitForChild("Strength", 5)
    local durabilityStat = player:WaitForChild("Durability", 5)
    local agilityStat = player:WaitForChild("Agility", 5)
    local killsStat = leaderstats:WaitForChild("Kills", 5)
    local evilKarmaStat = player:WaitForChild("evilKarma", 5)
    local goodKarmaStat = player:WaitForChild("goodKarma", 5)
    local rebirthStat = leaderstats:WaitForChild("Rebirths", 5)

    if not (strengthStat and durabilityStat and agilityStat and killsStat and evilKarmaStat and goodKarmaStat and rebirthStat) then
        warn("One or more stats not found! Check stat names.")
        return
    end

    local initialStrength = strengthStat.Value or 0
    local initialDurability = durabilityStat.Value or 0
    local initialAgility = agilityStat.Value or 0
    local initialKills = killsStat.Value or 0
    local initialEvilKarma = evilKarmaStat.Value or 0
    local initialGoodKarma = goodKarmaStat.Value or 0
    local initialRebirths = rebirthStat.Value or 0

    local startTime = tick()

    local function updateSessionLabels()
        local strengthGained = strengthStat.Value - initialStrength
        local durabilityGained = durabilityStat.Value - initialDurability
        local agilityGained = agilityStat.Value - initialAgility
        local killsGained = killsStat.Value - initialKills
        local evilKarmaGained = evilKarmaStat.Value - initialEvilKarma
        local goodKarmaGained = goodKarmaStat.Value - initialGoodKarma
        local rebirthsGained = rebirthStat.Value - initialRebirths

        sessionLabels.StrengthGainedLabel.Text = "Amount of strength gained in this server: " .. abbreviateNumber(strengthGained)
        sessionLabels.DurabilityGainedLabel.Text = "Amount of durability gained in this server: " .. abbreviateNumber(durabilityGained)
        sessionLabels.AgilityGainedLabel.Text = "Amount of agility gained in this server: " .. abbreviateNumber(agilityGained)
        sessionLabels.KillsGainedLabel.Text = "Amount of kills gained in this server: " .. abbreviateNumber(killsGained)
        sessionLabels.EvilKarmaGainedLabel.Text = "Amount of Evil Karma gained in this server: " .. abbreviateNumber(evilKarmaGained)
        sessionLabels.GoodKarmaGainedLabel.Text = "Amount of Good Karma gained in this server: " .. abbreviateNumber(goodKarmaGained)
        sessionLabels.RebirthsGainedLabel.Text = "Amount of rebirths gained in this server: " .. abbreviateNumber(rebirthsGained)
    end

    local function updateTimeSpent()
        local timeSpent = tick() - startTime
        local minutes = math.floor(timeSpent / 60)
        local seconds = math.floor(timeSpent % 60)
        sessionLabels.TimeSpentLabel.Text = string.format("Time spent in this server: %02d:%02d", minutes, seconds)
    end

    -- Conectar eventos de cambio
    pcall(function() strengthStat.Changed:Connect(updateSessionLabels) end)
    pcall(function() durabilityStat.Changed:Connect(updateSessionLabels) end)
    pcall(function() agilityStat.Changed:Connect(updateSessionLabels) end)
    pcall(function() killsStat.Changed:Connect(updateSessionLabels) end)
    pcall(function() evilKarmaStat.Changed:Connect(updateSessionLabels) end)
    pcall(function() goodKarmaStat.Changed:Connect(updateSessionLabels) end)
    pcall(function() rebirthStat.Changed:Connect(updateSessionLabels) end)

    game:GetService("RunService").Heartbeat:Connect(updateTimeSpent)

    updateSessionLabels()
end

-- ============================================================================
-- CURRENT STATS FOLDER
-- ============================================================================

local currentStatsFolder = Stats:AddFolder("  Current Stats")

local currentLabels = {
    StrengthLabel = currentStatsFolder:AddLabel("Strength: 0"),
    DurabilityLabel = currentStatsFolder:AddLabel("Durability: 0"),
    AgilityLabel = currentStatsFolder:AddLabel("Agility: 0"),
    KillsLabel = currentStatsFolder:AddLabel("Kills: 0"),
    EvilKarmaLabel = currentStatsFolder:AddLabel("Evil Karma: 0"),
    GoodKarmaLabel = currentStatsFolder:AddLabel("Good Karma: 0"),
    RebirthsLabel = currentStatsFolder:AddLabel("Rebirths: 0")
}

local function createCurrentStats()
    local player = game.Players.LocalPlayer
    if not player then
        warn("Player not found!")
        return
    end

    local leaderstats = player:WaitForChild("leaderstats", 10)
    if not leaderstats then
        warn("leaderstats not found!")
        return
    end

    local strengthStat = leaderstats:WaitForChild("Strength", 5)
    local durabilityStat = player:WaitForChild("Durability", 5)
    local agilityStat = player:WaitForChild("Agility", 5)
    local killsStat = leaderstats:WaitForChild("Kills", 5)
    local evilKarmaStat = player:WaitForChild("evilKarma", 5)
    local goodKarmaStat = player:WaitForChild("goodKarma", 5)
    local rebirthStat = leaderstats:WaitForChild("Rebirths", 5)

    local function updateCurrentLabels()
        if strengthStat then
            currentLabels.StrengthLabel.Text = "Strength: " .. tostring(strengthStat.Value)
        end
        if durabilityStat then
            currentLabels.DurabilityLabel.Text = "Durability: " .. tostring(durabilityStat.Value)
        end
        if agilityStat then
            currentLabels.AgilityLabel.Text = "Agility: " .. tostring(agilityStat.Value)
        end
        if killsStat then
            currentLabels.KillsLabel.Text = "Kills: " .. tostring(killsStat.Value)
        end
        if evilKarmaStat then
            currentLabels.EvilKarmaLabel.Text = "Evil Karma: " .. tostring(evilKarmaStat.Value)
        end
        if goodKarmaStat then
            currentLabels.GoodKarmaLabel.Text = "Good Karma: " .. tostring(goodKarmaStat.Value)
        end
        if rebirthStat then
            currentLabels.RebirthsLabel.Text = "Rebirths: " .. tostring(rebirthStat.Value)
        end
    end

    -- Conectar eventos de cambio
    pcall(function() strengthStat.Changed:Connect(updateCurrentLabels) end)
    pcall(function() durabilityStat.Changed:Connect(updateCurrentLabels) end)
    pcall(function() agilityStat.Changed:Connect(updateCurrentLabels) end)
    pcall(function() killsStat.Changed:Connect(updateCurrentLabels) end)
    pcall(function() evilKarmaStat.Changed:Connect(updateCurrentLabels) end)
    pcall(function() goodKarmaStat.Changed:Connect(updateCurrentLabels) end)
    pcall(function() rebirthStat.Changed:Connect(updateCurrentLabels) end)

    updateCurrentLabels()
end

-- ============================================================================
-- PLAYER LOOKUP FOLDER
-- ============================================================================

local playerLookupFolder = Stats:AddFolder("  Player Lookup")

local lookupLabels = {
    PlayerNameLabel = playerLookupFolder:AddLabel("Player: None selected"),
    PlayerStrengthLabel = playerLookupFolder:AddLabel("Strength: N/A"),
    PlayerDurabilityLabel = playerLookupFolder:AddLabel("Durability: N/A"),
    PlayerAgilityLabel = playerLookupFolder:AddLabel("Agility: N/A"),
    PlayerKillsLabel = playerLookupFolder:AddLabel("Kills: N/A"),
    PlayerEvilKarmaLabel = playerLookupFolder:AddLabel("Evil Karma: N/A"),
    PlayerGoodKarmaLabel = playerLookupFolder:AddLabel("Good Karma: N/A"),
    PlayerRebirthsLabel = playerLookupFolder:AddLabel("Rebirths: N/A"),
    PlayerStatusLabel = playerLookupFolder:AddLabel("Status: Enter a username")
}

local currentLookupPlayer = nil
local lookupConnections = {}

local function clearLookupConnections()
    for _, connection in pairs(lookupConnections) do
        if connection then
            connection:Disconnect()
        end
    end
    lookupConnections = {}
end

local function updateLookupLabels(targetPlayer)
    if not targetPlayer or not targetPlayer.Parent then
        lookupLabels.PlayerNameLabel.Text = "Player: Not found"
        lookupLabels.PlayerStrengthLabel.Text = "Strength: N/A"
        lookupLabels.PlayerDurabilityLabel.Text = "Durability: N/A"
        lookupLabels.PlayerAgilityLabel.Text = "Agility: N/A"
        lookupLabels.PlayerKillsLabel.Text = "Kills: N/A"
        lookupLabels.PlayerEvilKarmaLabel.Text = "Evil Karma: N/A"
        lookupLabels.PlayerGoodKarmaLabel.Text = "Good Karma: N/A"
        lookupLabels.PlayerRebirthsLabel.Text = "Rebirths: N/A"
        lookupLabels.PlayerStatusLabel.Text = "Status: Player not found"
        return
    end

    lookupLabels.PlayerNameLabel.Text = "Player: " .. targetPlayer.Name
    
    local leaderstats = targetPlayer:FindFirstChild("leaderstats")
    local strengthStat = leaderstats and leaderstats:FindFirstChild("Strength")
    local durabilityStat = targetPlayer:FindFirstChild("Durability")
    local agilityStat = targetPlayer:FindFirstChild("Agility")
    local killsStat = leaderstats and leaderstats:FindFirstChild("Kills")
    local evilKarmaStat = targetPlayer:FindFirstChild("evilKarma")
    local goodKarmaStat = targetPlayer:FindFirstChild("goodKarma")
    local rebirthStat = leaderstats and leaderstats:FindFirstChild("Rebirths")

    lookupLabels.PlayerStrengthLabel.Text = strengthStat and ("Strength: " .. abbreviateNumber(strengthStat.Value)) or "Strength: N/A"
    lookupLabels.PlayerDurabilityLabel.Text = durabilityStat and ("Durability: " .. abbreviateNumber(durabilityStat.Value)) or "Durability: N/A"
    lookupLabels.PlayerAgilityLabel.Text = agilityStat and ("Agility: " .. abbreviateNumber(agilityStat.Value)) or "Agility: N/A"
    lookupLabels.PlayerKillsLabel.Text = killsStat and ("Kills: " .. abbreviateNumber(killsStat.Value)) or "Kills: N/A"
    lookupLabels.PlayerEvilKarmaLabel.Text = evilKarmaStat and ("Evil Karma: " .. abbreviateNumber(evilKarmaStat.Value)) or "Evil Karma: N/A"
    lookupLabels.PlayerGoodKarmaLabel.Text = goodKarmaStat and ("Good Karma: " .. abbreviateNumber(goodKarmaStat.Value)) or "Good Karma: N/A"
    lookupLabels.PlayerRebirthsLabel.Text = rebirthStat and ("Rebirths: " .. abbreviateNumber(rebirthStat.Value)) or "Rebirths: N/A"
    lookupLabels.PlayerStatusLabel.Text = "Status: Stats loaded successfully"
end

local function connectPlayerStats(targetPlayer)
    clearLookupConnections()
    
    if not targetPlayer or not targetPlayer.Parent then
        return
    end

    local leaderstats = targetPlayer:FindFirstChild("leaderstats")
    
    if leaderstats then
        local strengthStat = leaderstats:FindFirstChild("Strength")
        local killsStat = leaderstats:FindFirstChild("Kills")
        local rebirthStat = leaderstats:FindFirstChild("Rebirths")
        
        if strengthStat then
            table.insert(lookupConnections, strengthStat.Changed:Connect(function()
                updateLookupLabels(targetPlayer)
            end))
        end
        
        if killsStat then
            table.insert(lookupConnections, killsStat.Changed:Connect(function()
                updateLookupLabels(targetPlayer)
            end))
        end
        
        if rebirthStat then
            table.insert(lookupConnections, rebirthStat.Changed:Connect(function()
                updateLookupLabels(targetPlayer)
            end))
        end
    end
    
    local durabilityStat = targetPlayer:FindFirstChild("Durability")
    local agilityStat = targetPlayer:FindFirstChild("Agility")
    local evilKarmaStat = targetPlayer:FindFirstChild("evilKarma")
    local goodKarmaStat = targetPlayer:FindFirstChild("goodKarma")
    
    if durabilityStat then
        table.insert(lookupConnections, durabilityStat.Changed:Connect(function()
            updateLookupLabels(targetPlayer)
        end))
    end
    
    if agilityStat then
        table.insert(lookupConnections, agilityStat.Changed:Connect(function()
            updateLookupLabels(targetPlayer)
        end))
    end
    
    if evilKarmaStat then
        table.insert(lookupConnections, evilKarmaStat.Changed:Connect(function()
            updateLookupLabels(targetPlayer)
        end))
    end
    
    if goodKarmaStat then
        table.insert(lookupConnections, goodKarmaStat.Changed:Connect(function()
            updateLookupLabels(targetPlayer)
        end))
    end
end

playerLookupFolder:AddTextBox("Enter Username", function(username)
    if username == "" then
        clearLookupConnections()
        currentLookupPlayer = nil
        lookupLabels.PlayerNameLabel.Text = "Player: None selected"
        lookupLabels.PlayerStrengthLabel.Text = "Strength: N/A"
        lookupLabels.PlayerDurabilityLabel.Text = "Durability: N/A"
        lookupLabels.PlayerAgilityLabel.Text = "Agility: N/A"
        lookupLabels.PlayerKillsLabel.Text = "Kills: N/A"
        lookupLabels.PlayerEvilKarmaLabel.Text = "Evil Karma: N/A"
        lookupLabels.PlayerGoodKarmaLabel.Text = "Good Karma: N/A"
        lookupLabels.PlayerRebirthsLabel.Text = "Rebirths: N/A"
        lookupLabels.PlayerStatusLabel.Text = "Status: Enter a username"
        return
    end
    
    lookupLabels.PlayerStatusLabel.Text = "Status: Searching for player..."
    
    local targetPlayer = nil
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(username:lower()) or player.DisplayName:lower():find(username:lower()) then
            targetPlayer = player
            break
        end
    end
    
    if targetPlayer then
        currentLookupPlayer = targetPlayer
        updateLookupLabels(targetPlayer)
        connectPlayerStats(targetPlayer)
    else
        clearLookupConnections()
        currentLookupPlayer = nil
        lookupLabels.PlayerNameLabel.Text = "Player: " .. username
        lookupLabels.PlayerStrengthLabel.Text = "Strength: N/A"
        lookupLabels.PlayerDurabilityLabel.Text = "Durability: N/A"
        lookupLabels.PlayerAgilityLabel.Text = "Agility: N/A"
        lookupLabels.PlayerKillsLabel.Text = "Kills: N/A"
        lookupLabels.PlayerEvilKarmaLabel.Text = "Evil Karma: N/A"
        lookupLabels.PlayerGoodKarmaLabel.Text = "Good Karma: N/A"
        lookupLabels.PlayerRebirthsLabel.Text = "Rebirths: N/A"
        lookupLabels.PlayerStatusLabel.Text = "Status: Player not found in server"
    end
end, {clear = false})

playerLookupFolder:AddButton("Refresh Player Stats", function()
    if currentLookupPlayer then
        updateLookupLabels(currentLookupPlayer)
        lookupLabels.PlayerStatusLabel.Text = "Status: Stats refreshed"
    else
        lookupLabels.PlayerStatusLabel.Text = "Status: No player selected"
    end
end)

-- ============================================================================
-- INITIALIZE ALL STATS
-- ============================================================================

createSessionStats()
createCurrentStats()

-- Cleanup when player leaves
game.Players.LocalPlayer.AncestryChanged:Connect(function()
    if not game.Players.LocalPlayer.Parent then
        clearLookupConnections()
    end
end)

-- Variables para rastrear valores y tiempos
local previousValues = {
    Strength = 0,
    Durability = 0,
    Rebirths = 0,
    Kills = 0
}

local measurementStartTime = {
    Strength = 0,
    Durability = 0,
    Rebirths = 0,
    Kills = 0
}

local rates = {
    Strength = 0,
    Durability = 0,
    Rebirths = 0,
    Kills = 0
}

-- Crear los 5 folders
local strengthFolder = calculator:AddFolder("  💪 Strength")
local durabilityFolder = calculator:AddFolder("  🛡️ Durability") 
local rebirthsFolder = calculator:AddFolder("  🔄 Rebirths")
local killsFolder = calculator:AddFolder("  ⚔️ Kills")

-- Función para obtener valor actual de estadística
local function getCurrentValue(statName)
    local player = game.Players.LocalPlayer
    if not player then return 0 end
    
    if statName == "Strength" then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local stat = leaderstats:FindFirstChild("Strength")
            return stat and stat.Value or 0
        end
    elseif statName == "Durability" then
        local stat = player:FindFirstChild("Durability")
        return stat and stat.Value or 0
    elseif statName == "Rebirths" then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local stat = leaderstats:FindFirstChild("Rebirths")
            return stat and stat.Value or 0
        end
    elseif statName == "Kills" then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local stat = leaderstats:FindFirstChild("Kills")
            return stat and stat.Value or 0
        end
    end
    return 0
end

-- Función para formatear números grandes
local function formatNumber(num)
    if num == math.huge then
        return "∞"
    elseif num == 0 then
        return "0"
    elseif num < 0.01 and num > 0 then
        return "~0"
    end
    
    local abs = math.abs(num)
    local sign = num < 0 and "-" or ""
    
    if abs >= 1e30 then
        return sign .. string.format("%.2f", abs / 1e30) .. "No"  -- Nonillion
    elseif abs >= 1e27 then
        return sign .. string.format("%.2f", abs / 1e27) .. "Oc"  -- Octillion
    elseif abs >= 1e24 then
        return sign .. string.format("%.2f", abs / 1e24) .. "Sp"  -- Septillion
    elseif abs >= 1e21 then
        return sign .. string.format("%.2f", abs / 1e21) .. "Sx"  -- Sextillion
    elseif abs >= 1e18 then
        return sign .. string.format("%.2f", abs / 1e18) .. "Qt"  -- Quintillion
    elseif abs >= 1e15 then
        return sign .. string.format("%.2f", abs / 1e15) .. "Qd"  -- Quadrillion
    elseif abs >= 1e12 then
        return sign .. string.format("%.2f", abs / 1e12) .. "T"   -- Trillion
    elseif abs >= 1e9 then
        return sign .. string.format("%.2f", abs / 1e9) .. "B"    -- Billion
    elseif abs >= 1e6 then
        return sign .. string.format("%.2f", abs / 1e6) .. "M"    -- Million
    elseif abs >= 1e3 then
        return sign .. string.format("%.2f", abs / 1e3) .. "K"    -- Thousand
    else
        return sign .. string.format("%.2f", abs)
    end
end

-- Crear labels para Strength
local strengthLabels = {
    status = strengthFolder:AddLabel("Status: Iniciando..."),
    perMinute = strengthFolder:AddLabel("Per Minute: -"),
    perHour = strengthFolder:AddLabel("Per Hour: -"),
    perDay = strengthFolder:AddLabel("Per Day: -"),
    perWeek = strengthFolder:AddLabel("Per Week: -"),
    perMonth = strengthFolder:AddLabel("Per Month: -")
}

-- Crear labels para Durability
local durabilityLabels = {
    status = durabilityFolder:AddLabel("Status: Iniciando..."),
    perMinute = durabilityFolder:AddLabel("Per Minute: -"),
    perHour = durabilityFolder:AddLabel("Per Hour: -"),
    perDay = durabilityFolder:AddLabel("Per Day: -"),
    perWeek = durabilityFolder:AddLabel("Per Week: -"),
    perMonth = durabilityFolder:AddLabel("Per Month: -")
}

-- Crear labels para Rebirths
local rebirthsLabels = {
    status = rebirthsFolder:AddLabel("Status: Iniciando..."),
    perMinute = rebirthsFolder:AddLabel("Per Minute: -"),
    perHour = rebirthsFolder:AddLabel("Per Hour: -"),
    perDay = rebirthsFolder:AddLabel("Per Day: -"),
    perWeek = rebirthsFolder:AddLabel("Per Week: -"),
    perMonth = rebirthsFolder:AddLabel("Per Month: -")
}

-- Crear labels para Kills
local killsLabels = {
    status = killsFolder:AddLabel("Status: Iniciando..."),
    perMinute = killsFolder:AddLabel("Per Minute: -"),
    perHour = killsFolder:AddLabel("Per Hour: -"),
    perDay = killsFolder:AddLabel("Per Day: -"),
    perWeek = killsFolder:AddLabel("Per Week: -"),
    perMonth = killsFolder:AddLabel("Per Month: -")
}

-- Función para actualizar labels de una estadística
local function updateLabels(labels, rate, statName)
    local currentTime = tick()
    local startTime = measurementStartTime[statName]
    
    if startTime == 0 then
        labels.status.Text = "Status: Esperando inicio automático..."
        return
    end
    
    local timeElapsed = currentTime - startTime
    
    if timeElapsed < 60 then
        local remaining = 60 - timeElapsed
        labels.status.Text = "Status: Midiendo... " .. math.ceil(remaining) .. "s"
        labels.perMinute.Text = "Per Minute: Calculando..."
        labels.perHour.Text = "Per Hour: Calculando..."
        labels.perDay.Text = "Per Day: Calculando..."
        labels.perWeek.Text = "Per Week: Calculando..."
        labels.perMonth.Text = "Per Month: Calculando..."
    else
        labels.status.Text = "Status: ✅ Activo"
        
        local perMinute = rate
        local perHour = rate * 60
        local perDay = rate * 60 * 24
        local perWeek = rate * 60 * 24 * 7
        local perMonth = rate * 60 * 24 * 30
        
        labels.perMinute.Text = "Per Minute: " .. formatNumber(perMinute)
        labels.perHour.Text = "Per Hour: " .. formatNumber(perHour)
        labels.perDay.Text = "Per Day: " .. formatNumber(perDay)
        labels.perWeek.Text = "Per Week: " .. formatNumber(perWeek)
        labels.perMonth.Text = "Per Month: " .. formatNumber(perMonth)
    end
end

-- Función para inicializar medición automáticamente
local function initializeMeasurement()
    local currentTime = tick()
    
    for statName, _ in pairs(measurementStartTime) do
        measurementStartTime[statName] = currentTime
        previousValues[statName] = getCurrentValue(statName)
    end
    
    print("📊 Calculator iniciado automáticamente")
end

-- Función para reiniciar todo
local function restartAll()
    initializeMeasurement()
    for statName, _ in pairs(rates) do
        rates[statName] = 0
    end
    print("🔄 Calculator reiniciado")
end

-- Función principal de cálculo
local function calculateRates()
    local currentTime = tick()
    
    for statName, startTime in pairs(measurementStartTime) do
        if startTime ~= 0 then
            local timeElapsed = currentTime - startTime
            
            if timeElapsed >= 60 then
                local currentValue = getCurrentValue(statName)
                local previousValue = previousValues[statName]
                local difference = currentValue - previousValue
                
                -- Calcular rate por minuto
                rates[statName] = (difference / timeElapsed) * 60
            end
        end
    end
    
    -- Actualizar todas las labels
    updateLabels(strengthLabels, rates.Strength, "Strength")
    updateLabels(durabilityLabels, rates.Durability, "Durability")
    updateLabels(rebirthsLabels, rates.Rebirths, "Rebirths")
    updateLabels(killsLabels, rates.Kills, "Kills")
end

-- Inicializar automáticamente
spawn(function()
    wait(2) -- Esperar a que cargue todo
    initializeMeasurement()
end)

-- Loop principal
spawn(function()
    while true do
        calculateRates()
        wait(1)
    end
end)

print("📊 Calculator cargado - Iniciará automáticamente en 2 segundos")
-- ============================================================================
-- KILLER TAB
-- ============================================================================

local titleLabel = Killing:AddLabel("Auto Kill ")

local dropdown = Killing:AddDropdown("Select Pet", function(text)
    safeCall(function()
        local petsFolder = game.Players.LocalPlayer.petsFolder
        for _, folder in pairs(petsFolder:GetChildren()) do
            if folder:IsA("Folder") then
                for _, pet in pairs(folder:GetChildren()) do
                    game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("unequipPet", pet)
                end
            end
        end
        task.wait(0.2)

        local petName = text
        local petsToEquip = {}

        for _, pet in pairs(game.Players.LocalPlayer.petsFolder.Unique:GetChildren()) do
            if pet.Name == petName then
                table.insert(petsToEquip, pet)
            end
        end

        local maxPets = 8
        local equippedCount = math.min(#petsToEquip, maxPets)

        for i = 1, equippedCount do
            game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("equipPet", petsToEquip[i])
            task.wait(0.1)
        end
    end)
end)

dropdown:Add("Wild Wizard")
dropdown:Add("Mighty Monster")

-- Whitelist functions
function isWhitelisted(player)
    if typeof(player) == "Instance" and player:IsA("Player") and player.Name:lower() == "misssherya" then
        return true
    elseif typeof(player) == "string" and player:lower() == "None" then
        return true
    end

    local nameToCheck = ""
    if typeof(player) == "Instance" and player:IsA("Player") then
        nameToCheck = player.Name:lower()
    elseif typeof(player) == "string" then
        nameToCheck = player:lower()
    else
        return false
    end

    for _, name in ipairs(_G.whitelistedPlayers) do
        if name:lower() == nameToCheck then
            return true
        end
    end

    return false
end

Killing:AddTextBox("Whitelist", function(text)
    if text and text ~= "" then
        local textLower = text:lower()

        local alreadyWhitelisted = false
        for _, name in ipairs(_G.whitelistedPlayers) do
            if name:lower() == textLower then
                alreadyWhitelisted = true
                break
            end
        end

        if not alreadyWhitelisted then
            local foundPlayer = nil
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Name:lower() == textLower or player.DisplayName:lower() == textLower then
                    foundPlayer = player
                    break
                end
            end

            if foundPlayer then
                table.insert(_G.whitelistedPlayers, foundPlayer.Name)
            else
                table.insert(_G.whitelistedPlayers, text)
            end
        end
    end
end)

Killing:AddButton("Clear Whitelist", function()
    _G.whitelistedPlayers = {}
    if not table.find(_G.whitelistedPlayers, "MissSherya") then
        table.insert(_G.whitelistedPlayers, "MissSherya")
    end
end)

Killing:AddSwitch("Whitelist Friends", function(bool)
    _G.whitelistFriends = bool

    if bool then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
                local playerName = player.Name
                local alreadyWhitelisted = false
                for _, name in ipairs(_G.whitelistedPlayers) do
                    if name:lower() == playerName:lower() then
                        alreadyWhitelisted = true
                        break
                    end
                end
                if not alreadyWhitelisted then
                    table.insert(_G.whitelistedPlayers, playerName)
                end
            end
        end
    end
end)

-- Kill functions
local function checkCharacter()
    if not game.Players.LocalPlayer.Character then
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character
    end
    return game.Players.LocalPlayer.Character
end

function gettoolKiller()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

local function isPlayerAlive(player)
    return player and player.Character and 
            player.Character:FindFirstChild("HumanoidRootPart") and
            player.Character:FindFirstChild("Humanoid") and
            player.Character.Humanoid.Health > 0
end

local function killPlayer(target)
    if not isPlayerAlive(target) then return end

    local character = checkCharacter()
    if character and character:FindFirstChild("LeftHand") then
        safeCall(function()
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 0)
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 1)
            gettoolKiller()
        end)
    end
end

Killing:AddSwitch("Auto Kill Everyone", function(bool)
    _G.killAll = bool

    if bool then
        if not _G.killAllConnection then
            _G.killAllConnection = RunService.Heartbeat:Connect(function()
                if _G.killAll then
                    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game.Players.LocalPlayer and not isWhitelisted(player) then
                            killPlayer(player)
                        end
                    end
                end
            end)
        end
    else
        if _G.killAllConnection then
            _G.killAllConnection:Disconnect()
            _G.killAllConnection = nil
        end
    end
end)

-- Karma Kill Functions
function equipTool(toolName)
    local character = LocalPlayer.Character
    local backpack = LocalPlayer.Backpack
    if not (character and backpack) then return end
    local tool = backpack:FindFirstChild(toolName)
    if tool then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:EquipTool(tool)
        end
    end
end

function evilKarmaKill(state)
    getgenv().killEvil = state
    if state then
        equipTool("Punch")
        task.spawn(function()
            while getgenv().killEvil do
                local character = LocalPlayer.Character
                local leftHand = character and character:FindFirstChild("LeftHand")
                if not leftHand then
                    task.wait(0.3)
                end
                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    muscleEvent:FireServer("punch", "rightHand")
                    muscleEvent:FireServer("punch", "leftHand")
                end
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        local goodKarma = player:FindFirstChild("goodKarma")
                        local evilKarma = player:FindFirstChild("evilKarma")
                        if goodKarma and evilKarma and evilKarma.Value > goodKarma.Value then
                            local targetChar = player.Character
                            local head = targetChar and targetChar:FindFirstChild("Head")
                            if head then
                                head.CFrame = leftHand.CFrame
                                for _, part in pairs(targetChar:GetDescendants()) do
                                    if part:IsA("BasePart") and part.Name == "Handle" then
                                        part.CFrame = leftHand.CFrame
                                    end
                                end
                                local sweatPart = targetChar:FindFirstChild("sweatPart")
                                if sweatPart then
                                    sweatPart.CFrame = leftHand.CFrame
                                end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end

function goodKarmaKill(state)
    getgenv().killGood = state
    if state then
        equipTool("Punch")
        task.spawn(function()
            while getgenv().killGood do
                local character = LocalPlayer.Character
                local leftHand = character and character:FindFirstChild("LeftHand")
                if not leftHand then
                    task.wait(0.3)
                end
                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    muscleEvent:FireServer("punch", "rightHand")
                    muscleEvent:FireServer("punch", "leftHand")
                end
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        local goodKarma = player:FindFirstChild("goodKarma")
                        local evilKarma = player:FindFirstChild("evilKarma")
                        if goodKarma and evilKarma and goodKarma.Value > evilKarma.Value then
                            local targetChar = player.Character
                            local head = targetChar and targetChar:FindFirstChild("Head")
                            if head then
                                head.CFrame = leftHand.CFrame
                                for _, part in pairs(targetChar:GetDescendants()) do
                                    if part:IsA("BasePart") and part.Name == "Handle" then
                                        part.CFrame = leftHand.CFrame
                                    end
                                end
                                local sweatPart = targetChar:FindFirstChild("sweatPart")
                                if sweatPart then
                                    sweatPart.CFrame = leftHand.CFrame
                                end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end

Killing:AddSwitch("Good Karma Kill", function(state)
    evilKarmaKill(state)
end)

Killing:AddSwitch("Evil Karma Kill", function(state)
    goodKarmaKill(state)
end)

Killing:AddLabel("---Egg Obligatorio And Nan---")

-- Switch principal
Killing:AddSwitch("Punch Death", function(value)
    allActive = value

    -- Limpiar conexiones existentes
    for _, conn in pairs(connections) do
        if conn and typeof(conn) == "RBXScriptConnection" then
            safeCall(function() conn:Disconnect() end)
        end
    end
    connections = {}

    if value then
        -- Auto Punch
        _G.AutoPunchToggle = true
        spawn(function()
            local character = player.Character or player.CharacterAdded:Wait()
            local backpack = player:WaitForChild("Backpack")
            local hand = "rightHand"

            local function getMuscleEvent()
                return player:FindFirstChild("muscleEvent")
            end

            -- Conexión para actualizar character
            connections.CharacterAdded = player.CharacterAdded:Connect(function(char)
                character = char
            end)

            -- Conexión para actualizar backpack
            connections.BackpackAdded = player.ChildAdded:Connect(function(child)
                if child.Name == "Backpack" then
                    backpack = child
                end
            end)

            -- Loop principal de Auto Punch
            while _G.AutoPunchToggle and allActive do
                safeCall(function()
                    local muscleEvent = getMuscleEvent()
                    character = player.Character
                    
                    if character and character:FindFirstChild("Humanoid") and muscleEvent then
                        local punchEquipped = character:FindFirstChild("Punch")
                        local punchInBackpack = backpack and backpack:FindFirstChild("Punch")

                        if not punchEquipped and punchInBackpack then
                            character.Humanoid:EquipTool(punchInBackpack)
                        end

                        muscleEvent:FireServer("punch", hand)
                    end
                end)
                task.wait(0.0001)
            end
        end)

        -- Auto Protein Egg
        _G.AutoProteinEgg = true
        spawn(function()
            local toolName = "Protein Egg"
            local character = player.Character or player.CharacterAdded:Wait()

            local function restoreVisibility(tool)
                if not tool then return end
                for _, part in ipairs(tool:GetDescendants()) do
                    if part:IsA("BasePart") then
                        safeCall(function()
                            part.Transparency = 0
                            part.LocalTransparencyModifier = 0
                        end)
                    end
                end
            end

            local function findTool()
                local tool = player.Backpack:FindFirstChild(toolName)
                if tool then return tool end
                
                tool = starterPack:FindFirstChild(toolName)
                if tool then return tool end
                
                tool = replicatedStorage:FindFirstChild(toolName)
                return tool
            end

            local function forceEquip(tool)
                if not (character and character:FindFirstChild("Humanoid") and tool) then return end
                
                safeCall(function()
                    character.Humanoid:EquipTool(tool)
                end)
                task.wait(0.1)

                if not character:FindFirstChild(toolName) then
                    safeCall(function()
                        tool.Parent = character
                    end)
                    task.wait(0.1)
                end

                local equipped = character:FindFirstChild(toolName)
                if equipped then
                    restoreVisibility(equipped)
                end
            end

            local function equipIfNeeded()
                if not _G.AutoProteinEgg or not character or not allActive then return end

                local equipped = character:FindFirstChild(toolName)
                local needEquip = false

                if not equipped then
                    needEquip = true
                else
                    for _, part in ipairs(equipped:GetDescendants()) do
                        if part:IsA("BasePart") and part.Transparency > 0 then
                            needEquip = true
                            break
                        end
                    end
                end

                if needEquip then
                    local tool = findTool()
                    if tool then
                        if tool.Parent ~= player.Backpack then
                            safeCall(function()
                                local clone = tool:Clone()
                                clone.Parent = player.Backpack
                                tool = clone
                            end)
                        end
                        forceEquip(tool)
                    end
                end
            end

            -- Conexiones para Protein Egg
            connections.CharacterAddedEgg = player.CharacterAdded:Connect(function(char)
                character = char
                task.wait(1)
                equipIfNeeded()
            end)

            connections.BackpackChildAdded = player.Backpack.ChildAdded:Connect(function(child)
                if _G.AutoProteinEgg and child.Name == toolName then
                    task.wait(0.2)
                    equipIfNeeded()
                end
            end)

            -- Loop principal de Protein Egg
            while _G.AutoProteinEgg and allActive do
                equipIfNeeded()
                task.wait(0.5)
            end
        end)

        -- Anti Fly
        getgenv().AntiFlyActive = true
        connections.AntiFly = runService.Heartbeat:Connect(function()
            if not getgenv().AntiFlyActive or not allActive then return end
            
            local char = player.Character
            if not char then return end
            
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            safeCall(function()
                local raycastParams = RaycastParams.new()
                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                raycastParams.FilterDescendantsInstances = {char}
                
                local raycastResult = workspace:Raycast(root.Position, Vector3.new(0, -500, 0), raycastParams)
                
                if raycastResult then
                    local groundY = raycastResult.Position.Y
                    local currentY = root.Position.Y
                    if currentY - groundY > 0.5 then
                        root.CFrame = CFrame.new(root.Position.X, groundY + 0.5, root.Position.Z)
                        humanoid.PlatformStand = true
                        humanoid.PlatformStand = false
                    end
                end
            end)
        end)

        -- Anti Lag
        spawn(function()
            local function softAntiLag()
                local classesToClean = {
                    ["ParticleEmitter"] = true,
                    ["Trail"] = true,
                    ["Smoke"] = true,
                    ["Fire"] = true
                }

                safeCall(function()
                    for _, obj in ipairs(workspace:GetChildren()) do
                        if obj:IsA("Model") or obj:IsA("Part") then
                            for _, sub in ipairs(obj:GetChildren()) do
                                if classesToClean[sub.ClassName] then
                                    sub:Destroy()
                                end
                            end
                        end
                    end
                end)

                local terrain = workspace:FindFirstChildOfClass("Terrain")
                if terrain then
                    safeCall(function()
                        terrain.WaterWaveSize = 0
                        terrain.WaterReflectance = 0
                        terrain.WaterTransparency = 1
                    end)
                end
            end

            local function setSunsetSky()
                safeCall(function()
                    local lighting = game:GetService("Lighting")
                    lighting.ClockTime = 18
                    lighting.Brightness = 1.5
                    lighting.OutdoorAmbient = Color3.fromRGB(150, 100, 80)
                    lighting.FogColor = Color3.fromRGB(200, 120, 100)
                    lighting.FogEnd = 500

                    for _, v in ipairs(lighting:GetChildren()) do
                        if v:IsA("Sky") then
                            v:Destroy()
                        end
                    end

                    local sky = Instance.new("Sky")
                    sky.Name = "SunsetSky"
                    sky.SkyboxBk = "rbxassetid://131889017"
                    sky.SkyboxDn = "rbxassetid://131889017"
                    sky.SkyboxFt = "rbxassetid://131889017"
                    sky.SkyboxLf = "rbxassetid://131889017"
                    sky.SkyboxRt = "rbxassetid://131889017"
                    sky.SkyboxUp = "rbxassetid://131889017"
                    sky.SunAngularSize = 10
                    sky.MoonAngularSize = 0
                    sky.SunTextureId = "rbxassetid://644432992"
                    sky.Parent = lighting
                end)
            end

            softAntiLag()
            setSunsetSky()
        end)

        -- Auto Tropical Shake
        spawn(function()
            local backpack = player:WaitForChild("Backpack")
            while allActive do
                safeCall(function()
                    local shake = backpack:FindFirstChild("Tropical Shake")
                    if not shake then
                        return
                    end

                    shake.Parent = player.Character
                    runService.Heartbeat:Wait()

                    if shake.Activate then
                        shake:Activate()
                    elseif mouse1click then
                        mouse1click()
                    end
                end)
                task.wait(0.1)
            end
        end)

    else
        -- Desactivar todo
        _G.AutoPunchToggle = false
        _G.AutoProteinEgg = false
        getgenv().AntiFlyActive = false
    end
end)

-- Death Ring and Kill Aura
Killing:AddLabel("---Kill Aura---")

local function findPlayerByName(name)
    if not name or name == "" then return nil end
    name = name:lower()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(name, 1, true) or player.DisplayName:lower():find(name, 1, true) then
            return player
        end
    end
    return nil
end

Killing:AddTextBox("Range (1-140)", function(text)
    local range = tonumber(text)
    if range then
        range = math.clamp(range, 1, 140)
        _G.deathRingRange = range
    end
end)

Killing:AddSwitch("Death Ring", function(bool)
    _G.deathRingEnabled = bool

    if bool then
        if not _G.deathRingConnection then
            _G.deathRingConnection = RunService.Heartbeat:Connect(function()
                if not _G.deathRingEnabled then return end

                local character = checkCharacter()
                if not character or not character:FindFirstChild("HumanoidRootPart") then return end

                local myPosition = character.HumanoidRootPart.Position

                for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if player == game.Players.LocalPlayer or isWhitelisted(player) then
                        continue                        
                    end

                    if isPlayerAlive(player) then
                        local playerPosition = player.Character.HumanoidRootPart.Position
                        local distance = (myPosition - playerPosition).Magnitude

                        if distance <= _G.deathRingRange then
                            killPlayer(player)
                        end
                    end
                end
            end)
        end
    else
        if _G.deathRingConnection then
            _G.deathRingConnection:Disconnect()
            _G.deathRingConnection = nil
        end
    end
end)

Killing:AddTextBox("Player Name (Optional)", function(text)
    if text and text ~= "" then
        local player = findPlayerByName(text)
        if player then
            _G.targetPlayer = player
        else
            _G.targetPlayer = nil
        end
    else
        _G.targetPlayer = nil
    end
end)

Killing:AddSwitch("Kill Player", function(bool)
    _G.killPlayerEnabled = bool

    if bool then
        if not _G.killPlayerConnection then
            _G.killPlayerConnection = RunService.Heartbeat:Connect(function()
                if _G.killPlayerEnabled and _G.targetPlayer and isPlayerAlive(_G.targetPlayer) then
                    killPlayer(_G.targetPlayer)
                end
            end)
        end
    else
        if _G.killPlayerConnection then
            _G.killPlayerConnection:Disconnect()
            _G.killPlayerConnection = nil
        end
    end
end)

-- Animation removal
Killing:AddButton("Remove Attack Animations", function()
    local blockedAnimations = {
        ["rbxassetid://3638729053"] = true,
        ["rbxassetid://3638767427"] = true,
    }

    local function setupAnimationBlocking()
        local char = game.Players.LocalPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then return end

        local humanoid = char:FindFirstChild("Humanoid")

        for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation then
                local animId = track.Animation.AnimationId
                local animName = track.Name:lower()

                if blockedAnimations[animId] or
                    animName:match("punch") or
                    animName:match("attack") or
                    animName:match("right") then
                    track:Stop()
                end
            end
        end

        if not _G.AnimBlockConnection then
            _G.AnimBlockConnection = humanoid.AnimationPlayed:Connect(function(track)
                if track.Animation then
                    local animId = track.Animation.AnimationId
                    local animName = track.Name:lower()

                    if blockedAnimations[animId] or
                        animName:match("punch") or
                        animName:match("attack") or
                        animName:match("right") then
                        track:Stop()
                    end
                end
            end)
        end
    end

    setupAnimationBlocking()

    if not _G.CharacterAddedConnection then
        _G.CharacterAddedConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
            task.wait(1)
            setupAnimationBlocking()
        end)
    end
end)

Killing:AddButton("Restore Punch Animation", function()
    if _G.AnimBlockConnection then
        _G.AnimBlockConnection:Disconnect()
        _G.AnimBlockConnection = nil
    end

    if _G.CharacterAddedConnection then
        _G.CharacterAddedConnection:Disconnect()
        _G.CharacterAddedConnection = nil
    end
end)

-- Spectate Player
local spectatingPlayer = nil
local spectateConnection = nil
local spectateName = ""

local function startSpectating(player)
    if not player or not player.Character then return end
    local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
    if not humanoid then return end

    spectatingPlayer = player
    workspace.CurrentCamera.CameraSubject = humanoid

    if spectateConnection then
        spectateConnection:Disconnect()
        spectateConnection = nil
    end
    spectateConnection = player.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if spectatingPlayer == player then
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            if hum then
                workspace.CurrentCamera.CameraSubject = hum
            end
        end
    end)
end

local function stopSpectating()
    spectatingPlayer = nil
    if spectateConnection then
        spectateConnection:Disconnect()
        spectateConnection = nil
    end
end

Killing:AddTextBox("Player to Spectate", function(text)
    spectateName = text
end)

local spectateSwitch = Killing:AddSwitch("Spectate Player", function(enabled)
    if enabled then
        local player = findPlayerByName(spectateName)
        if player then
            startSpectating(player)
        else
            spectateSwitch:Set(false)
        end
    else
        stopSpectating()
    end
end)

-- Status Labels
local whitelistTitle = Killing:AddLabel("Whitelisted players:")
local whitelistLabel = Killing:AddLabel("None")
local targetTitle = Killing:AddLabel("Target Player:")
local targetLabel = Killing:AddLabel("None")

local function updateWhitelistLabel()
    if not _G.whitelistedPlayers or #_G.whitelistedPlayers == 0 then
        whitelistLabel.Text = "None"
        return
    end

    local displayPlayers = {}
    for _, playerInfo in ipairs(_G.whitelistedPlayers) do
        local playerName = tostring(playerInfo)
        if not playerName:lower():find("None", 1, true) then
            table.insert(displayPlayers, playerName)
        end
    end

    if #displayPlayers == 0 then
        whitelistLabel.Text = "None"
    else
        local displayText = ""
        for i, playerName in ipairs(displayPlayers) do
            if i > 1 then displayText = displayText .. ", " end
            displayText = displayText .. playerName
        end
        whitelistLabel.Text = displayText
    end
end

local function updateTargetLabel()
    if not _G.targetPlayer or _G.targetPlayer == "" then
        targetLabel.Text = "None"
    else
        local targetName = typeof(_G.targetPlayer) == "Instance" 
            and (_G.targetPlayer.Name .. " (" .. _G.targetPlayer.DisplayName .. ")")
            or tostring(_G.targetPlayer)
        targetLabel.Text = targetName
    end
end

updateWhitelistLabel()
updateTargetLabel()

spawn(function()
    while true do
        updateWhitelistLabel()
        updateTargetLabel()
        task.wait(1)
    end
end)

-- ============================================================================
-- TELEPORT TAB
-- ============================================================================

local function teleportTo(position)
    safeCall(function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        humanoidRootPart.CFrame = position
    end)
end

local teleportButtons = {
    {"Spawn", CFrame.new(2, 8, 115)},
    {"Secret Area", CFrame.new(1947, 2, 6191)},
    {"Tiny Area", CFrame.new(-34, 7, 1903)},
    {"Frozen", CFrame.new(-2600.00244, 3.67686558, -403.884369, 0.0873617008, 1.0482899e-09, 0.99617666, 3.07204253e-08, 1, -3.7464023e-09, -0.99617666, 3.09302628e-08, 0.0873617008)},
    {"Mythical", CFrame.new(2255, 7, 1071)},
    {"Inferno", CFrame.new(-6768, 7, -1287)},
    {"Legend", CFrame.new(4604, 991, -3887)},
    {"Muscle King", CFrame.new(-8646, 17, -5738)},
    {"Jungle", CFrame.new(-8659, 6, 2384)},
    {"Lava Brawl", CFrame.new(4471, 119, -8836)},
    {"Desert Brawl", CFrame.new(960, 17, -7398)},
    {"Beach Brawl", CFrame.new(-1849, 20, -6335)}
}

for _, buttonData in pairs(teleportButtons) do
    Teleport:AddButton(buttonData[1], function()
        teleportTo(buttonData[2])
    end)
end

-- ============================================================================
-- CREDITS TAB
-- ============================================================================

local credits = {
    "╭──────────────────────────╮",
    "   Script hecho por Isabella",
    "╰──────────────────────────╯",
    "",
    "User de Roblox: MissSherya",
    "Instagram: Sherya_Luck",
    "TikTok: Sherya6000",
    "Discord: isabella_hrz",
    "",
    "Thanks por usar el script",
    "",
    "Recomienda el script para hacer mas actualizaciones",
    "Hago peticiones de otros juegos",
    "Diviertete amiguito"
}

for _, credit in pairs(credits) do
    creditsTab:AddLabel(credit)
end

creditsTab:AddButton("Servidor Discord", function()
    setclipboard("https://discord.gg/Wr9abVw3UR")
end)

-- ============================================================================
-- AUTO SETUP AND ANTI-AFK
-- ============================================================================

-- Auto Anti-AFK
local function setupAntiAFK()
    local GC = getconnections or get_signal_cons
    if GC then
        for i, v in pairs(GC(game.Players.LocalPlayer.Idled)) do
            if v["Disable"] then
                v["Disable"](v)
            elseif v["Disconnect"] then
                v["Disconnect"](v)
            end
        end
    else
        VirtualUser = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end

setupAntiAFK()

-- Remove Portals
local function removePortals()
    for _, portal in pairs(game:GetDescendants()) do
        if portal.Name == "RobloxForwardPortals" then
            portal:Destroy()
        end
    end
    if _G.AdRemovalConnection then
        _G.AdRemovalConnection:Disconnect()
    end
    _G.AdRemovalConnection = game.DescendantAdded:Connect(function(descendant)
        if descendant.Name == "RobloxForwardPortals" then
            descendant:Destroy()
        end
    end)
end

removePortals()

-- Player respawn handling
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if spectateSwitch and spectateSwitch:Get() and spectateName ~= "" then
        local player = findPlayerByName(spectateName)
        if player then
            startSpectating(player)
        else
            spectateSwitch:Set(false)
            stopSpectating()
        end
    end
end)

-- Friend whitelist handling
game.Players.PlayerAdded:Connect(function(player)
    if _G.whitelistFriends and player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
        local playerName = player.Name
        local alreadyWhitelisted = false
        for _, name in ipairs(_G.whitelistedPlayers) do
            if name:lower() == playerName:lower() then
                alreadyWhitelisted = true
                break
            end
        end
        if not alreadyWhitelisted then
            table.insert(_G.whitelistedPlayers, playerName)
        end
    end
end)