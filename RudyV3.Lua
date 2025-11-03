-- 🌌 Cambiar fondo del cielo automáticamente al ejecutar el script
task.spawn(function()
    repeat task.wait() until game:IsLoaded()
    task.wait(2) -- Espera 2 segundos para asegurar que Lighting esté completamente cargado

    local Lighting = game:GetService("Lighting")

    -- Eliminar cualquier cielo previo
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end

    -- Crear nuevo cielo personalizado
    local sky = Instance.new("Sky")
    sky.Name = "HZ_CustomSky"

    -- 🖼️ ID de la imagen de fondo (cambiá aquí si querés otro)
    local id = "rbxassetid://107408690705422"

    sky.SkyboxBk = id
    sky.SkyboxDn = id
    sky.SkyboxFt = id
    sky.SkyboxLf = id
    sky.SkyboxRt = id
    sky.SkyboxUp = id
    sky.StarCount = 3000
    sky.SunAngularSize = 20
    sky.MoonAngularSize = 11
    sky.Parent = Lighting

    -- Ajustar iluminación general
    Lighting.Brightness = 2
    Lighting.Ambient = Color3.fromRGB(180, 180, 180)
    Lighting.OutdoorAmbient = Color3.fromRGB(120, 120, 120)
    Lighting.ClockTime = 14 -- (2 PM, día claro)

    print("[✅] Fondo del cielo cambiado correctamente a la imagen personalizada.")
end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/IJNTJNNPTJ/farm/refs/heads/main/.ODlib", true))()

-- 🪟 Crear ventana principal
local window = library:AddWindow("OMEGADEZZ HUB | Secret SCRIPT - Deobfuscated By Alejandro", {
    main_color = Color3.fromRGB(120, 0, 0), -- rojo oscuro
    min_size = Vector2.new(444, 470),
    can_minimize = true
})

-----------------------------------------------------
-- TU SCRIPT ORIGINAL (NO SE TOCA, SOLO AÑADIDA LA LIBRERÍA)
-----------------------------------------------------

local farmTab = window:AddTab("Rock")
farmTab:AddLabel("HonnyDezz es tu papi, Farmea duro, Mmm bien duro")
 
local function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
 
local tinyIslandRockSwitch = farmTab:AddSwitch("Isla Pequeña (Como la tuya) - 0-1k Fuerza", function(bool)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 0 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local starterIslandRockSwitch = farmTab:AddSwitch("Gran Roca - Requiere: 100+ Durabilidad", function(bool)
    selectrock = "Starter Island Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 100 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 100 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local legendBeachRockSwitch = farmTab:AddSwitch("Roca Dorada - Requiere: 5k+ Durabilidad", function(bool)
    selectrock = "Legend Beach Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local frostGymRockSwitch = farmTab:AddSwitch("Roca / Gimnasio Helado - 1 Renacimientos", function(bool)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 150000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local mythicalGymRockSwitch = farmTab:AddSwitch("Roca / Gimnasio Mitico - 3 Renacimientos", function(bool)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 400000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local eternalGymRockSwitch = farmTab:AddSwitch("Roca / Gimnasio Eterno - 15 Renacimientos", function(bool)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 750000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local legendGymRockSwitch = farmTab:AddSwitch("Roca / Gimnasio de Leyendas - 30 Renacimientos", function(bool)
    selectrock = "Legend Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 1000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local muscleKingGymRockSwitch = farmTab:AddSwitch("Roca / Rey Muscular - 5 Renacimientos", function(bool)
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local ancientJungleRockSwitch = farmTab:AddSwitch("Roca / Gimnacio Jungla - 60 Renacimientos", function(bool)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 10000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

farmTab:AddLabel("━━━━━━━ Aqui puedes Golpear TODAS las ROCAS ━━━━━━━")

-----------------------------------------------------
-- 🧠 PESTAÑA: SETTINGS (completa)
-----------------------------------------------------

local settingsTab = window:AddTab("Settings")
settingsTab:AddLabel(" ━━━━━━━ Configuraciones Generales ━━━━━━━")

-- 📡 Referencias
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-----------------------------------------------------
-- 🔘 Anti AFK
-----------------------------------------------------
settingsTab:AddSwitch("Anti AFK", function(state)
    if state then
        local func = loadstring(game:HttpGet("https://pastebin.com/raw/dA9B82yb", true))
        if func then
            func()
            print("[✅] Anti AFK activado correctamente.")
        else
            warn("[❌] Error al cargar el Anti AFK.")
        end
    else
        print("[⚪] Anti AFK desactivado (no se ejecutará).")
    end
end)

-----------------------------------------------------
-- 🥊 Auto Punch
-----------------------------------------------------
settingsTab:AddSwitch("Auto Punch", function(Value)
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
                task.wait()
            end
        end)
    else
        local character = LocalPlayer.Character
        local equipped = character and character:FindFirstChild("Punch")
        if equipped then
            equipped.Parent = LocalPlayer.Backpack
        end
    end
end)

-----------------------------------------------------
-- ⚡ Fast Tools
-----------------------------------------------------
settingsTab:AddSwitch("Fast Tools", function(Value)
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

-----------------------------------------------------
-- 🌋 Golpear todas las rocas al mismo tiempo
-----------------------------------------------------
farmTab:AddSwitch("Golpear TODAS las Rocas", function(State)
    getgenv().FarmAllRocks = State

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Workspace = game:GetService("Workspace")

    local function gettool()
        for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Punch" and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
        LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
    end

    if State then
        task.spawn(function()
            while getgenv().FarmAllRocks do
                task.wait(0.01)
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("LeftHand") or not char:FindFirstChild("RightHand") then continue end

                for _, v in pairs(Workspace.machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Parent:FindFirstChild("Rock") then
                        -- 🔥 Golpea la roca con ambas manos
                        firetouchinterest(v.Parent.Rock, char.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, char.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, char.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, char.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end)
    else
        getgenv().FarmAllRocks = false
    end
end)
-----------------------------------------------------
-- 🧊 Lock Position (bloquear posición del jugador)
-----------------------------------------------------

-- Funciones para bloquear / desbloquear la posición
local lockedConnection = nil
local lockedCFrame = nil

local function lockPlayerPosition(currentCFrame)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        warn("[⚠️] No se encontró el personaje para bloquear la posición.")
        return
    end

    lockedCFrame = currentCFrame
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")

    -- Mantiene la posición fija
    lockedConnection = game:GetService("RunService").Stepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = lockedCFrame
        end
    end)

    print("[✅] Posición bloqueada.")
end

local function unlockPlayerPosition()
    if lockedConnection then
        lockedConnection:Disconnect()
        lockedConnection = nil
        print("[⚪] Posición desbloqueada.")
    end
end

-----------------------------------------------------
-- 🔘 Switch para Lock Position
-----------------------------------------------------
settingsTab:AddSwitch("Lock Position", function(bool)
    local player = game:GetService("Players").LocalPlayer

    if bool then
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local currentPosition = player.Character.HumanoidRootPart.CFrame
            lockPlayerPosition(currentPosition)
        end
    else
        unlockPlayerPosition()
    end
end)

settingsTab:AddLabel("━━━━━━━ Isla para Farmear BUGS ━━━━━━━").TextSize = 17

-----------------------------------------------------
-- 🛡️ Anti Kill (teletransportarse a zona segura)
-----------------------------------------------------

settingsTab:AddSwitch("TP Isla Pequeña", function(enabled)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        warn("[⚠️] No se encontró el HumanoidRootPart.")
        return
    end

    if enabled then
        -- 🔹 Coordenadas seguras
        local safePosition = Vector3.new(279.186, 41.634, 2592.543)

        -- 🔹 Teletransportar y anclar al lugar
        hrp.CFrame = CFrame.new(safePosition)
        hrp.Anchored = true

        print("[✅] Anti Kill activado — Jugador teletransportado y anclado a zona segura.")
    else
        -- 🔹 Restaurar movimiento
        hrp.Anchored = false
        print("[⚪] Anti Kill desactivado — Movimiento restaurado.")

        -- Si querés devolverlo al spawn, descomentá esta línea:
        -- hrp.CFrame = workspace:WaitForChild("SpawnLocation").CFrame
    end
end)

-----------------------------------------------------
-- 🧙 Modo Dios (joinBrawl + teletransporte)
-----------------------------------------------------
local godModeToggle = false
settingsTab:AddSwitch("Modo Dios", function(State)
    godModeToggle = State

    if State then
        task.spawn(function()
            while godModeToggle do
                -- Verificamos que el personaje y el HRP existen
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")

                if hrp then
                    -- 🔹 Teletransportar a la ubicación deseada
                    local safePos = Vector3.new(1126.429, -6.844, -7097.365)
                    hrp.CFrame = CFrame.new(safePos)
                end

                -- 🔹 Activar el evento de brawl
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")

                -- Espera antes del siguiente ciclo
                task.wait()
            end
        end)
    end
end)

-- ----------------------------
-- 🎁 PESTAÑA: GIFT (robusta)
-- ----------------------------
local Gift = window:AddTab("Gift")
Gift:AddLabel("Gifting Protein egg:").TextSize = 22

local proteinEggLabel = Gift:AddLabel("Protein Eggs: 0")
proteinEggLabel.TextSize = 20

local selectedEggPlayer = nil
local eggCount = 0

local eggDropdown = Gift:AddDropdown("Player to Gift Eggs", function(selectedDisplayName)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.DisplayName == selectedDisplayName then
            selectedEggPlayer = plr
            break
        end
    end
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= Players.LocalPlayer then
        eggDropdown:Add(plr.DisplayName)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= Players.LocalPlayer then
        eggDropdown:Add(plr.DisplayName)
    end
end)

Gift:AddTextBox("Amount of Eggs", function(text)
    eggCount = tonumber(text) or 0
end)

Gift:AddButton("Gift Eggs", function()
    if selectedEggPlayer and eggCount > 0 then
        for i = 1, eggCount do
            local egg = Players.LocalPlayer.consumablesFolder:FindFirstChild("Protein Egg")
            if egg then
                ReplicatedStorage.rEvents.giftRemote:InvokeServer("giftRequest", selectedEggPlayer, egg)
                task.wait(0.1)
            end
        end
    end
end)

Gift:AddLabel("Gifting Tropical Shakes:").TextSize = 22

local tropicalShakeLabel = Gift:AddLabel("Tropical Shakes: 0")
tropicalShakeLabel.TextSize = 18

local selectedShakePlayer = nil
local shakeCount = 0

local shakeDropdown = Gift:AddDropdown("Player to Gift Tropical Shakes", function(selectedDisplayName)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.DisplayName == selectedDisplayName then
            selectedShakePlayer = plr
            break
        end
    end
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= Players.LocalPlayer then
        shakeDropdown:Add(plr.DisplayName)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= Players.LocalPlayer then
        shakeDropdown:Add(plr.DisplayName)
    end
end)

Gift:AddTextBox("Tropical Shakes gift", function(text)
    shakeCount = tonumber(text) or 0
end)

Gift:AddButton("Gift Tropical Shakes", function()
    if selectedShakePlayer and shakeCount > 0 then
        for i = 1, shakeCount do
            local shake = Players.LocalPlayer.consumablesFolder:FindFirstChild("Tropical Shake")
            if shake then
                ReplicatedStorage.rEvents.giftRemote:InvokeServer("giftRequest", selectedShakePlayer, shake)
                task.wait(0.1)
            end
        end
    end
end)

local function updateItemCount()
    local proteinEggCount = 0
    local tropicalShakeCount = 0

    local backpack = Players.LocalPlayer:WaitForChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item.Name == "Protein Egg" then
                proteinEggCount = proteinEggCount + 1
            elseif item.Name == "Tropical Shake" or item.Name == "Piñas" then
                tropicalShakeCount = tropicalShakeCount + 1
            end
        end
    end

    proteinEggLabel.Text = "Protein Eggs: " .. proteinEggCount
    tropicalShakeLabel.Text = "Tropical Shakes: " .. tropicalShakeCount
end

task.spawn(function()
    while true do
        updateItemCount()
        task.wait(0.25)
    end
end)


-----------------------------------------------------
-- 🧠 BOTONES DE TAMAÑO (añadidos al final del SETTINGS TAB)
-----------------------------------------------------
settingsTab:AddLabel("━━━━━━━ Elige tu Tamaño ━━━━━━━")

-- 🌟 Tamaño Nano
settingsTab:AddButton("Tamaño NaN", function()
    local args = {"changeSize", 0/0}
    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("changeSpeedSizeRemote"):InvokeServer(unpack(args))
end)

-- 🌟 Tamaño Nano
settingsTab:AddButton("Tamaño 2", function()
    local args = {"changeSize", 2}
    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("changeSpeedSizeRemote"):InvokeServer(unpack(args))
end)

-----------------------------------------------------
local pets = window:AddTab(       "Pets")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Crystal data structure with exact names from your original code
local crystalData = {
    ["Blue Crystal"] = {
        {name = "Blue Birdie", rarity = "Basic"},
        {name = "Orange Hedgehog", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Red Kitty", rarity = "Basic"},
        {name = "Dark Vampy", rarity = "Advanced"},
        {name = "Blue Bunny", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Green Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
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
        {name = "Green Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
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

-- Function to collect all unique pets and auras
local function getAllPetsAndAuras()
    local allPets = {}
    local allAuras = {}
    
    for crystalName, pets in pairs(crystalData) do
        for _, pet in ipairs(pets) do
            if string.find(pet.name, "Aura") then
                if not allAuras[pet.name] then
                    allAuras[pet.name] = {name = pet.name, rarity = pet.rarity, crystal = crystalName}
                end
            else
                if not allPets[pet.name] then
                    allPets[pet.name] = {name = pet.name, rarity = pet.rarity, crystal = crystalName}
                end
            end
        end
    end
    
    return allPets, allAuras
end

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

-- Get all pets and auras
local allPets, allAuras = getAllPetsAndAuras()

pets:AddLabel("━━━━━━━ Comprar PET y AURAS ━━━━━━━")

-- Pet dropdown
local petDropdown = pets:AddDropdown("Seleccionar PET", function(text)
    selectedPet = text
    local crystal = findCrystalForItem(text)
    print("Pet selected: " .. text .. " (Found in: " .. (crystal or "Unknown") .. ")")
end)

-- Add all pets manually (sorted by rarity)
-- Basic Pets
petDropdown:Add("Blue Birdie (Basic)")
petDropdown:Add("Orange Hedgehog (Basic)")
petDropdown:Add("Red Kitty (Basic)")
petDropdown:Add("Blue Bunny (Basic)")
petDropdown:Add("Silver Dog (Basic)")

-- Advanced Pets
petDropdown:Add("Dark Vampy (Advanced)")
petDropdown:Add("Dark Golem (Advanced)")
petDropdown:Add("Green Butterfly (Advanced)")
petDropdown:Add("Yellow Butterfly (Advanced)")

-- Rare Pets
petDropdown:Add("Crimson Falcon (Rare)")
petDropdown:Add("Purple Dragon (Rare)")
petDropdown:Add("Orange Pegasus (Rare)")
petDropdown:Add("Purple Falcon (Rare)")
petDropdown:Add("Red Dragon (Rare)")
petDropdown:Add("White Pegasus (Rare)")
petDropdown:Add("Frostwave Legends Penguin (Rare)")
petDropdown:Add("Phantom Genesis Dragon (Rare)")
petDropdown:Add("Eternal Strike Leviathan (Rare)")

-- Epic Pets
petDropdown:Add("Blue Pheonix (Epic)")
petDropdown:Add("Blue Firecaster (Epic)")
petDropdown:Add("Golden Pheonix (Epic)")
petDropdown:Add("Red Firecaster (Epic)")
petDropdown:Add("Green Firecaster (Epic)")
petDropdown:Add("White Pheonix (Epic)")
petDropdown:Add("Dark Legends Manticore (Epic)")
petDropdown:Add("Ultimate Supernova Pegasus (Epic)")
petDropdown:Add("Lightning Strike Phantom (Epic)")
petDropdown:Add("Golden Viking (Epic)")

-- Unique Pets
petDropdown:Add("Infernal Dragon (Unique)")
petDropdown:Add("Ultra Birdie (Unique)")
petDropdown:Add("Magic Butterfly (Unique)")
petDropdown:Add("Aether Spirit Bunny (Unique)")
petDropdown:Add("Cybernetic Showdown Dragon (Unique)")
petDropdown:Add("Darkstar Hunter (Unique)")
petDropdown:Add("Muscle Sensei (Unique)")
petDropdown:Add("Neon Guardian (Unique)")

-- Aura dropdown
local auraDropdown = pets:AddDropdown("Seleccionar AURA", function(text)
    selectedAura = text
    local crystal = findCrystalForItem(text)
    print("Aura selected: " .. text .. " (Found in: " .. (crystal or "Unknown") .. ")")
end)

-- Add all auras manually (sorted by rarity)
-- Basic Auras
auraDropdown:Add("Blue Aura (Basic)")
auraDropdown:Add("Green Aura (Basic)")
auraDropdown:Add("Purple Aura (Basic)")
auraDropdown:Add("Red Aura (Basic)")
auraDropdown:Add("Yellow Aura (Basic)")
auraDropdown:Add("Ultra Inferno  (Rare)")
auraDropdown:Add("Azure Tundra (Epic)")
auraDropdown:Add("Grand Supernova (Epic)")
auraDropdown:Add("Muscle King (Unique)")
auraDropdown:Add("Entropic Blast (Unique)")
auraDropdown:Add("Eternal Megastrike (Unique)")

pets:AddLabel("━━━━━━━ Sistema para Comprar ━━━━━━━")

-- Auto buy pet toggle
pets:AddSwitch("Auto Comprar PETS", function(bool)
    _G.AutoBuyPet = bool
    
    if bool then
        if selectedPet == "" then
            print("Please select a pet first!")
            return
        end
        
        -- Extract pet name from dropdown selection (remove rarity part)
        local petName = selectedPet:match("^(.-)%s*%(")
        if not petName then
            petName = selectedPet
        end
        
        local crystal = findCrystalForItem(petName)
        if not crystal then
            print("Could not find crystal for pet: " .. petName)
            return
        end
        
        print("Auto buy pet started for: " .. petName .. " from " .. crystal)
        spawn(function()
            while _G.AutoBuyPet and selectedPet ~= "" do
                local petToBuy = ReplicatedStorage.cPetShopFolder:FindFirstChild(petName)
                if petToBuy then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(petToBuy)
                    print("Bought pet: " .. petName)
                else
                    print("Pet not found: " .. petName)
                end
                task.wait(0.1)
            end
        end)
    else
        print("Auto buy pet stopped")
    end
end)

-- Auto buy aura toggle
pets:AddSwitch("Auto Comprar AURA", function(bool)
    _G.AutoBuyAura = bool
    
    if bool then
        if selectedAura == "" then
            print("Please select an aura first!")
            return
        end
        
        -- Extract aura name from dropdown selection (remove rarity part)
        local auraName = selectedAura:match("^(.-)%s*%(")
        if not auraName then
            auraName = selectedAura
        end
        
        local crystal = findCrystalForItem(auraName)
        if not crystal then
            print("Could not find crystal for aura: " .. auraName)
            return
        end
        
        print("Auto buy aura started for: " .. auraName .. " from " .. crystal)
        spawn(function()
            while _G.AutoBuyAura and selectedAura ~= "" do
                local auraToBuy = ReplicatedStorage.cPetShopFolder:FindFirstChild(auraName)
                if auraToBuy then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(auraToBuy)
                    print("Bought aura: " .. auraName)
                else
                    print("Aura not found: " .. auraName)
                end
                task.wait(0.1)
            end
        end)
    else
        print("Auto buy aura stopped")
    end
end)

pets:AddLabel("━━━━━━━ Equipar Pet de FARM ━━━━━━━")

-- Equipar 8 Neon Guardian
pets:AddButton("Equipar 8 Neon Guardian", function()
    print("[⚙️] Equipando 8 Neon Guardian...")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Referencia al evento remoto
    local equipPetEvent = ReplicatedStorage:WaitForChild("rEvents"):FindFirstChild("equipPetEvent")
    if not equipPetEvent then
        warn("❌ No se encontró 'equipPetEvent'.")
        return
    end

    -- Carpeta de mascotas
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then
        warn("❌ No se encontró 'petsFolder'.")
        return
    end

    -- Desequipar todas las mascotas rápidamente
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end

    task.wait(0.1) -- pequeño delay para asegurar que se procese el desequipado

    -- Equipar 8 Neon Guardian
    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Neon Guardian" then
                    equipPetEvent:FireServer("equipPet", pet)
                    equipped += 1
                    print("[✅] Equipado Neon Guardian #" .. equipped)
                    if equipped >= maxEquip then
                        print("[🏁] Se equiparon 8 Neon Guardian(s).")
                        return
                    end
                end
            end
        end
    end

    print("[🏁] Se equiparon " .. equipped .. " Neon Guardian(s).")
end)

-- Equipar 8 Darkstar Hunter
pets:AddButton("Equipar 8 Darkstar Hunter", function()
    print("[⚙️] Equipando 8 Darkstar Hunter...")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Referencia al evento remoto
    local equipPetEvent = ReplicatedStorage:WaitForChild("rEvents"):FindFirstChild("equipPetEvent")
    if not equipPetEvent then
        warn("❌ No se encontró 'equipPetEvent'.")
        return
    end

    -- Carpeta de mascotas
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then
        warn("❌ No se encontró 'petsFolder'.")
        return
    end

    -- Desequipar todas las mascotas rápidamente
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end

    task.wait(0.1) -- pequeño delay para asegurar que se procese el desequipado

    -- Equipar 8 Darkstar Hunter
    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Darkstar Hunter" then
                    equipPetEvent:FireServer("equipPet", pet)
                    equipped += 1
                    print("[✅] Equipado Darkstar Hunter #" .. equipped)
                    if equipped >= maxEquip then
                        print("[🏁] Se equiparon 8 Darkstar Hunter(s).")
                        return
                    end
                end
            end
        end
    end

    print("[🏁] Se equiparon " .. equipped .. " Darkstar Hunter(s).")
end)

-- Auto vender mascotas no deseadas
pets:AddButton("Auto Vender Mascotas", function()
    local petsFolder = game.Players.LocalPlayer:FindFirstChild("petsFolder")
    local rEvents = ReplicatedStorage:FindFirstChild("rEvents")
    local sellEvent = rEvents and (rEvents:FindFirstChild("sellPetEvent") or rEvents:FindFirstChild("SellPetEvent"))

    if not petsFolder then
        warn("❌ No se encontró la carpeta 'petsFolder'.")
        return
    end
    if not sellEvent then
        warn("❌ No se encontró el evento 'sellPetEvent'.")
        return
    end

    -- Lista de mascotas a vender
    local autoSellPetsByName = {
        ["Blue Birdie"] = true,
        ["Orange Hedgehog"] = true,
        ["Red Kitty"] = true,
        ["Blue Bunny"] = true,
        ["Silver Dog"] = true,
        ["Dark Vampy"] = true,
        ["Dark Golem"] = true,
        ["Green Butterfly"] = true,
        ["Yellow Butterfly"] = true,
        ["Crimson Falcon"] = true,
        ["Purple Dragon"] = true,
        ["Orange Pegasus"] = true,
        ["Purple Falcon"] = true,
        ["Red Dragon"] = true,
        ["White Pegasus"] = true
    }

    local totalSold = 0
    for _, rarityFolder in pairs(petsFolder:GetChildren()) do
        if rarityFolder:IsA("Folder") then
            for _, pet in pairs(rarityFolder:GetChildren()) do
                if autoSellPetsByName[pet.Name] then
                    pcall(function()
                        if sellEvent:IsA("RemoteFunction") then
                            sellEvent:InvokeServer("sellPet", pet)
                        else
                            sellEvent:FireServer("sellPet", pet)
                        end
                    end)
                    print("💸 Vendido:", pet.Name)
                    totalSold += 1
                    task.wait(0.1)
                end
            end
        end
    end
    print("Total vendido:", totalSold)
end)

-- Auto vender mascotas no deseadas
pets:AddButton("Auto Vender Neon y Dark", function()
    local petsFolder = game.Players.LocalPlayer:FindFirstChild("petsFolder")
    local rEvents = ReplicatedStorage:FindFirstChild("rEvents")
    local sellEvent = rEvents and (rEvents:FindFirstChild("sellPetEvent") or rEvents:FindFirstChild("SellPetEvent"))

    if not petsFolder then
        warn("❌ No se encontró la carpeta 'petsFolder'.")
        return
    end
    if not sellEvent then
        warn("❌ No se encontró el evento 'sellPetEvent'.")
        return
    end

    -- Lista de mascotas a vender
    local autoSellPetsByName = {
        ["Darkstar Hunter"] = true,
        ["Neon Guardian"] = true,
    }

    local totalSold = 0
    for _, rarityFolder in pairs(petsFolder:GetChildren()) do
        if rarityFolder:IsA("Folder") then
            for _, pet in pairs(rarityFolder:GetChildren()) do
                if autoSellPetsByName[pet.Name] then
                    pcall(function()
                        if sellEvent:IsA("RemoteFunction") then
                            sellEvent:InvokeServer("sellPet", pet)
                        else
                            sellEvent:FireServer("sellPet", pet)
                        end
                    end)
                    print("💸 Vendido:", pet.Name)
                    totalSold += 1
                    task.wait(0.1)
                end
            end
        end
    end
    print("Total vendido:", totalSold)
end)


pets:AddLabel("━━━━━━━ Equipar Pet PACKS ━━━━━━━")

pets:AddButton("Equipar 8 Mighty Monster", function()
    print("[⚙️] Equipando 8 Mighty Monster...")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Referencia al evento remoto
    local equipPetEvent = ReplicatedStorage:WaitForChild("rEvents"):FindFirstChild("equipPetEvent")
    if not equipPetEvent then
        warn("❌ No se encontró 'equipPetEvent'.")
        return
    end

    -- Carpeta de mascotas
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then
        warn("❌ No se encontró 'petsFolder'.")
        return
    end

    -- Desequipar todas las mascotas rápidamente
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end

    task.wait(0.1) -- pequeño delay para asegurar que se procese el desequipado

    -- Equipar 8 Mighty Monster
    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Mighty Monster" then
                    equipPetEvent:FireServer("equipPet", pet)
                    equipped += 1
                    print("[✅] Equipado Mighty Monster #" .. equipped)
                    if equipped >= maxEquip then
                        print("[🏁] Se equiparon 8 Mighty Monster(s).")
                        return
                    end
                end
            end
        end
    end

    print("[🏁] Se equiparon " .. equipped .. " Mighty Monster(s).")
end)

pets:AddButton("Equipar 8 Tribal Overlord", function()
    print("[⚙️] Equipando 8 Tribal Overlord...")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Referencia al evento remoto
    local equipPetEvent = ReplicatedStorage:WaitForChild("rEvents"):FindFirstChild("equipPetEvent")
    if not equipPetEvent then
        warn("❌ No se encontró 'equipPetEvent'.")
        return
    end

    -- Carpeta de mascotas
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then
        warn("❌ No se encontró 'petsFolder'.")
        return
    end

    -- Desequipar todas las mascotas rápidamente
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end

    task.wait(0.1) -- pequeño delay para asegurar que se procese el desequipado

    -- Equipar 8 Tribal Overlord
    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Tribal Overlord" then
                    equipPetEvent:FireServer("equipPet", pet)
                    equipped += 1
                    print("[✅] Equipado Tribal Overlord #" .. equipped)
                    if equipped >= maxEquip then
                        print("[🏁] Se equiparon 8 Tribal Overlord(s).")
                        return
                    end
                end
            end
        end
    end

    print("[🏁] Se equiparon " .. equipped .. " Tribal Overlord(s).")
end)

pets:AddButton("Equip 8 Swift Samurai", function()
    print("Botón presionado: equipando 8 Swift Samurai")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Primero desequipamos todo
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then return end

    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.1)

    -- Ahora equipamos máximo 8 "Swift Samurai"
    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Swift Samurai" then
                    ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                    equipped += 1
                    print("Equipado Swift Samurai #" .. equipped)

                    if equipped >= maxEquip then
                        return -- salir cuando ya haya 8 equipados
                    end
                end
            end
        end
    end

    print("Se equiparon " .. equipped .. " Swift Samurai")
end)

pets:AddButton("Equip 8 Wild Wizard", function()
    print("Botón presionado: equipando 8 Wild Wizard")

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Primero desequipamos todo
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if not petsFolder then return end

    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.1)

    -- Ahora equipamos máximo 8 "Wild Wizard"
    local equipped = 0
    local maxEquip = 8
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                if pet.Name == "Wild Wizard" then
                    ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                    equipped += 1
                    print("Equipado Wild Wizard #" .. equipped)

                    if equipped >= maxEquip then
                        return -- salir cuando ya haya 8 equipados
                    end
                end
            end
        end
    end

    print("Se equiparon " .. equipped .. " Swift Samurai")
end)


-- 🎭 TAB DE EMOTES (o cualquier otro nombre de tab)
local emoteTab = window:AddTab("Tags")
emoteTab:AddLabel("━━━━━━━ Aqui puedes elegir Emotes ━━━━━━━").TextSize = 17
-- Botón para ejecutar el loadstring
emoteTab:AddButton("Cargar Emotes", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/SJtnmgKp"))()
end)

emoteTab:AddLabel("━━━━━━━ Aqui puedes elegir tu TAG ━━━━━━━").TextSize = 17

-- 🌈 TAG ARCOÍRIS - HonnyDezz
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local currentTagText = "HonnyDezz"

-- 🧠 Función para crear o actualizar el tag
local function createOrUpdateTag(char)
    task.wait(0.5)
    if not char:FindFirstChild("Head") then return end

    -- Borrar tag anterior si ya existe
    local old = char.Head:FindFirstChild("CustomTag")
    if old then old:Destroy() end

    -- Crear BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "CustomTag"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 4.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = char.Head

    -- Crear texto
    local text = Instance.new("TextLabel")
    text.Parent = billboard
    text.BackgroundTransparency = 1
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Text = currentTagText
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextStrokeTransparency = 0.2
    text.TextScaled = true
    text.Font = Enum.Font.GothamBold

    -- 🌈 Efecto arcoíris dinámico
    task.spawn(function()
        while billboard.Parent and text.Parent do
            local t = tick() * 1 -- velocidad del color
            text.TextColor3 = Color3.fromHSV((t % 1), 1, 1)
            task.wait(0.05)
        end
    end)
end

-- 📦 Crear tag al cargar personaje
player.CharacterAdded:Connect(createOrUpdateTag)
if player.Character then createOrUpdateTag(player.Character) end


-- 📦 Crear tag al cargar personaje
player.CharacterAdded:Connect(createOrUpdateTag)
if player.Character then createOrUpdateTag(player.Character) end


emoteTab:AddButton("🔥 Clan HZ", function()
    currentTagText = "🔥 Clan HZ 🔥"
    currentTagColor = Color3.fromRGB(255, 70, 70)
    createOrUpdateTag(player.Character)
    library:Notification("✅ Tag aplicado: Clan HZ")
end)

emoteTab:AddButton("🔥 Team Honny", function()
    currentTagText = "🔥 Team Honny 🔥"
    currentTagColor = Color3.fromRGB(255, 70, 70)
    createOrUpdateTag(player.Character)
    library:Notification("✅ Tag aplicado: Team Honny")
end)

emoteTab:AddButton("👑 HZ Top", function()
    currentTagText = "👑 HZ Top 👑"
    currentTagColor = Color3.fromRGB(255, 255, 0)
    createOrUpdateTag(player.Character)
    library:Notification("✅ Tag aplicado: HZ Top")
end)

emoteTab:AddButton("⚡ Somos DEZZ", function()
    currentTagText = "⚡ Somos DEZZ ⚡"
    currentTagColor = Color3.fromRGB(140, 0, 255)
    createOrUpdateTag(player.Character)
    library:Notification("✅ Tag aplicado: Somos DEZZ")
end)

emoteTab:AddLabel("━━━━━━━ Aqui puedes eliminar tu TAG ━━━━━━━").TextSize = 17

-- 🗑️ Botón opcional para quitar el tag
emoteTab:AddButton("❌ Quitar Tag", function()
    if player.Character and player.Character:FindFirstChild("Head") then
        local old = player.Character.Head:FindFirstChild("CustomTag")
        if old then
            old:Destroy()
            library:Notification("🧹 Tag eliminado.")
        else
            library:Notification("⚠️ No tienes tag activo.")
        end
    end
end)

emoteTab:AddLabel("━━━━━━━ Aqui puedes Teletransportarte ━━━━━━━").TextSize = 17

emoteTab:AddButton("Secret Area", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(1947, 2, 6191)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Secret Area",
        Duration = 0
    })
end)

emoteTab:AddButton("Spawn", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(2, 8, 115)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Spawn",
        Duration = 0
    })
end)

emoteTab:AddButton("Muscle King Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-8646, 17, -5738)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Muscle King",
        Duration = 0
    })
end)

emoteTab:AddButton("Jungle Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-8659, 6, 2384)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Jungle Island",
        Duration = 0
    })
end)

emoteTab:AddButton("Brawl Lava", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(4471, 119, -8836)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Brawl Lava",
        Duration = 0
    })
end)

emoteTab:AddButton("Brawl Desert", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(960, 17, -7398)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Brawl Desert",
        Duration = 0
    })
end)


settingsTab:AddLabel("━━━━━━━ Elimina todos los batidos ━━━━━━━")

local autoEatBoostsEnabled = false

local boostsList = {
    "ULTRA Shake",
    "TOUGH Bar",
    "Protein Shake",
    "Energy Shake",
    "Protein Bar",
    "Energy Bar",
    "Tropical Shake"
}

local function eatAllBoosts()
    local player = game.Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()

    for _, boostName in ipairs(boostsList) do
        local boost = backpack:FindFirstChild(boostName)
        while boost do
            boost.Parent = character
            pcall(function()
                boost:Activate()
            end)
            task.wait(0)
            boost = backpack:FindFirstChild(boostName)
        end
    end
end

task.spawn(function()
    while true do
        if autoEatBoostsEnabled then
            eatAllBoosts()
            task.wait(2)
        else
            task.wait(1)
        end
    end
end)

settingsTab:AddSwitch("Auto Eliminar Inventory", function(state)
    autoEatBoostsEnabled = state
end)

local button = settingsTab:AddButton("Eliminar Animacion de Puños", function()
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
            local connection = humanoid.AnimationPlayed:Connect(function(track)
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

            _G.AnimBlockConnection = connection
        end
    end

    setupAnimationBlocking()

    local function overrideToolActivation()
        local function processTool(tool)
            if tool and (tool.Name == "Punch" or tool.Name:match("Attack") or tool.Name:match("Right")) then
                if not tool:GetAttribute("ActivatedOverride") then
                    tool:SetAttribute("ActivatedOverride", true)

                    local connection = tool.Activated:Connect(function()
                        task.wait(0.05)

                        local char = game.Players.LocalPlayer.Character
                        if char and char:FindFirstChild("Humanoid") then
                            for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
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
                        end
                    end)

                    if not _G.ToolConnections then
                        _G.ToolConnections = {}
                    end
                    _G.ToolConnections[tool] = connection
                end
            end
        end

        for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            processTool(tool)
        end

        local char = game.Players.LocalPlayer.Character
        if char then
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    processTool(tool)
                end
            end
        end

        if not _G.BackpackAddedConnection then
            _G.BackpackAddedConnection = game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    processTool(child)
                end
            end)
        end

        if not _G.CharacterToolAddedConnection and char then
            _G.CharacterToolAddedConnection = char.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    processTool(child)
                end
            end)
        end
    end

    overrideToolActivation()

    if not _G.AnimMonitorConnection then
        _G.AnimMonitorConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if tick() % 0.5 < 0.01 then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
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
                end
            end
        end)
    end

    if not _G.CharacterAddedConnection then
        _G.CharacterAddedConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
            task.wait(1)
            setupAnimationBlocking()
            overrideToolActivation()

            if _G.CharacterToolAddedConnection then
                _G.CharacterToolAddedConnection:Disconnect()
            end

            _G.CharacterToolAddedConnection = newChar.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    processTool(child)
                end
            end)
        end)
    end
end)

function RecoveryPunch()
    if _G.AnimBlockConnection then
        _G.AnimBlockConnection:Disconnect()
        _G.AnimBlockConnection = nil
    end
    if _G.AnimMonitorConnection then
        _G.AnimMonitorConnection:Disconnect()
        _G.AnimMonitorConnection = nil
    end
    if _G.ToolConnections then
        for _, conn in pairs(_G.ToolConnections) do
            if conn then conn:Disconnect() end
        end
        _G.ToolConnections = nil
    end
    if _G.BackpackAddedConnection then
        _G.BackpackAddedConnection:Disconnect()
        _G.BackpackAddedConnection = nil
    end
    if _G.CharacterToolAddedConnection then
        _G.CharacterToolAddedConnection:Disconnect()
        _G.CharacterToolAddedConnection = nil
    end
    if _G.CharacterAddedConnection then
        _G.CharacterAddedConnection:Disconnect()
        _G.CharacterAddedConnection = nil
    end
end

settingsTab:AddButton("Colocar Animacion de Puños", function()
    RecoveryPunch()
end)

-----------------------------------------------------
-- 📊 PESTAÑA: STATS (Cronómetro inteligente)
-----------------------------------------------------

local features = window:AddTab("Stats")

-- 📌 Jugador local
local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local strengthStat = leaderstats:WaitForChild("Strength")
local durabilityStat = player:WaitForChild("Durability")

-- 🔢 Formato de números
local function formatNumber(number)
    local isNegative = number < 0
    number = math.abs(number)
    if number >= 1e15 then
        return (isNegative and "-" or "") .. string.format("%.2fQa", number / 1e15)
    elseif number >= 1e12 then
        return (isNegative and "-" or "") .. string.format("%.2fT", number / 1e12)
    elseif number >= 1e9 then
        return (isNegative and "-" or "") .. string.format("%.2fB", number / 1e9)
    elseif number >= 1e6 then
        return (isNegative and "-" or "") .. string.format("%.2fM", number / 1e6)
    elseif number >= 1e3 then
        return (isNegative and "-" or "") .. string.format("%.2fK", number / 1e3)
    else
        return (isNegative and "-" or "") .. string.format("%.2f", number)
    end
end

local function formatNumberWithCommas(number)
    local formatted = tostring(number):reverse():gsub("(%d%d%d)", "%1,"):reverse()
    return formatted:gsub("^,", "")
end

local function formatAbbreviated(number)
    local abbreviations = {"", "K", "M", "B", "T", "Qa", "Qi"}
    local index = 1
    while number >= 1000 and index < #abbreviations do
        number = number / 1000
        index = index + 1
    end
    return string.format("%.2f", number) .. abbreviations[index]
end

local function formatDisplay(value)
    return "[ " .. formatNumberWithCommas(value) .. " | " .. formatAbbreviated(value) .. " ]"
end

-----------------------------------------------------
-- 🕒 Etiquetas visuales
-----------------------------------------------------

local stopwatchLabel = features:AddLabel("⏱ Tiempo de Repetición: 0d 0h 0m 0s")
stopwatchLabel.TextSize = 20

local projectedStrengthLabel = features:AddLabel("📈 Fuerza: 0/Hora | 0/Día | 0/Semana | 0/Mes")
projectedStrengthLabel.TextSize = 17

local projectedDurabilityLabel = features:AddLabel("📉 Durabilidad: 0/Hora | 0/Día | 0/Semana | 0/Mes")
projectedDurabilityLabel.TextSize = 17

features:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

features:AddLabel("Estadísticas Personales").TextSize = 17

local strengthLabel = features:AddLabel("Fuerza: 0 | Ganado: 0")
strengthLabel.TextSize = 17

local durabilityLabel = features:AddLabel("Durabilidad: 0 | Ganado: 0")
durabilityLabel.TextSize = 17

-----------------------------------------------------
-- ⏱ Cronómetro y cálculos
-----------------------------------------------------

local startTime = tick()
local initialStrength = strengthStat.Value
local initialDurability = player:WaitForChild("Durability").Value
local trackingStarted = false

local strengthHistory = {}
local durabilityHistory = {}
local calculationInterval = 10

task.spawn(function()
    local lastCalcTime = tick()

    while task.wait(0.2) do
        local currentTime = tick()
        local currentStrength = strengthStat.Value
        local currentDurability = durabilityStat.Value

        -------------------------------------------------
        -- 🔥 Inicia cuando detecta aumento de fuerza o durabilidad
        -------------------------------------------------
        if not trackingStarted then
            if currentStrength > initialStrength or currentDurability > initialDurability then
                trackingStarted = true
                startTime = currentTime
                strengthHistory = {}
                durabilityHistory = {}
                if library.Notification then
                    library:Notification("⏱ Entrenamiento iniciado — fuerza detectada.")
                else
                    print("[⏱️] Cronómetro iniciado — comenzaste a ganar fuerza o durabilidad.")
                end
            end
        end

        -------------------------------------------------
        -- ⌛ Cálculos de tiempo y progreso
        -------------------------------------------------
        if trackingStarted then
            local elapsed = currentTime - startTime
            local d = math.floor(elapsed / 86400)
            local h = math.floor((elapsed % 86400) / 3600)
            local m = math.floor((elapsed % 3600) / 60)
            local s = math.floor(elapsed % 60)

            stopwatchLabel.Text = string.format("⏱ Tiempo de Repetición: %dd %dh %dm %ds", d, h, m, s)

            local strengthGain = currentStrength - initialStrength
            local durabilityGain = currentDurability - initialDurability

            strengthLabel.Text = "Fuerza: " .. formatNumber(currentStrength) .. " | Ganado: " .. formatNumber(strengthGain)
            durabilityLabel.Text = "Durabilidad: " .. formatNumber(currentDurability) .. " | Ganado: " .. formatNumber(durabilityGain)

            table.insert(strengthHistory, {time = currentTime, value = currentStrength})
            table.insert(durabilityHistory, {time = currentTime, value = currentDurability})

            while #strengthHistory > 0 and currentTime - strengthHistory[1].time > calculationInterval do
                table.remove(strengthHistory, 1)
            end
            while #durabilityHistory > 0 and currentTime - durabilityHistory[1].time > calculationInterval do
                table.remove(durabilityHistory, 1)
            end

            if currentTime - lastCalcTime >= calculationInterval then
                lastCalcTime = currentTime

                if #strengthHistory >= 2 then
                    local delta = strengthHistory[#strengthHistory].value - strengthHistory[1].value
                    local perSec = delta / calculationInterval
                    projectedStrengthLabel.Text = string.format(
                        "📈 Fuerza: %s/Hora | %s/Día | %s/Semana | %s/Mes",
                        formatNumber(perSec * 3600),
                        formatNumber(perSec * 86400),
                        formatNumber(perSec * 604800),
                        formatNumber(perSec * 2592000)
                    )
                end

                if #durabilityHistory >= 2 then
                    local delta = durabilityHistory[#durabilityHistory].value - durabilityHistory[1].value
                    local perSec = delta / calculationInterval
                    projectedDurabilityLabel.Text = string.format(
                        "📉 Durabilidad: %s/Hora | %s/Día | %s/Semana | %s/Mes",
                        formatNumber(perSec * 3600),
                        formatNumber(perSec * 86400),
                        formatNumber(perSec * 604800),
                        formatNumber(perSec * 2592000)
                    )
                end
            end
        end
    end
end)


-- 📋 Sección de otros jugadores
features:AddLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
features:AddLabel("Ver Estadísticas de Otros Jugadores").TextSize = 17

local SelectPlayerName = ""

-- Dropdown de jugadores
local PlayerDrop = features:AddDropdown("Seleccionar Jugador", function(Value)
    SelectPlayerName = Value:match("| (.+)")
end)

for _, Plr in ipairs(game:GetService("Players"):GetPlayers()) do
    local displayName = Plr.DisplayName .. " | " .. Plr.Name
    PlayerDrop:Add(displayName)
end

-- Labels para stats del jugador seleccionado
local labelStrengthOther = features:AddLabel("Fuerza: N/A")
local labelDurabilityOther = features:AddLabel("Durabilidad: N/A")
local labelRebirthOther = features:AddLabel("Renacimientos: N/A")

features:AddButton("🛡️ Activar Anti-Touch Rebirth", function()
    local player = game:GetService("Players").LocalPlayer
    local gui = player:WaitForChild("PlayerGui"):WaitForChild("gameGui")
    local sideButtons = gui:WaitForChild("sideButtons")
    local rebirthButton = sideButtons:WaitForChild("rebirthButton")

    -- Buscar o crear el bloqueador
    local blocker = sideButtons:FindFirstChild("RebirthBlocker")
    if not blocker then
        blocker = Instance.new("Frame")
        blocker.Name = "RebirthBlocker"
        blocker.BackgroundTransparency = 1
        blocker.BackgroundColor3 = Color3.new(0, 0, 0)
        blocker.BorderSizePixel = 0
        blocker.Active = true
        blocker.ZIndex = rebirthButton.ZIndex + 1
        blocker.Size = rebirthButton.Size
        blocker.Position = rebirthButton.Position
        blocker.Parent = sideButtons
    end

    -- Estado ON/OFF
    local enabled = not blocker.Visible
    blocker.Visible = enabled

    -- Notificación visual (Elerium)
    if enabled then
        Elerium:Notify({
            Title = "REBIRTH",
            Content = "🔒 Anti-Touch activado — el botón Rebirth está bloqueado.",
            Duration = 4
        })
    else
        Elerium:Notify({
            Title = "REBIRTH",
            Content = "✅ Anti-Touch desactivado — el botón Rebirth vuelve a funcionar.",
            Duration = 4
        })
    end
end)


local Killer = window:AddTab("Kills")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerWhitelist = {}
local targetPlayerNames = {}
local autoKill = false
local killTarget = false
local spying = false
local autoEquipPunch = false
local autoPunchNoAnim = false
local targetDropdownItems = {}
local availableTargets = {}

Killer:AddLabel("━━━━━━ Seccion para Abusar Jugadores ━━━━━━")

Killer:AddSwitch("NO Matar a mis Amigos", function(state)
    friendWhitelistActive = state

    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and LocalPlayer:IsFriendsWith(player.UserId) then
                playerWhitelist[player.Name] = true
            end
        end

        Players.PlayerAdded:Connect(function(player)
            if friendWhitelistActive and player ~= LocalPlayer and LocalPlayer:IsFriendsWith(player.UserId) then
                playerWhitelist[player.Name] = true
            end
        end)
    else
        for name in pairs(playerWhitelist) do
            local friend = Players:FindFirstChild(name)
            if friend and LocalPlayer:IsFriendsWith(friend.UserId) then
                playerWhitelist[name] = nil
            end
        end
    end
end)


Killer:AddSwitch("Auto kill a Todos", function(bool)
    autoKill = bool

    task.spawn(function()
        while autoKill do
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local rightHand = character:FindFirstChild("RightHand")
            local leftHand = character:FindFirstChild("LeftHand")

            local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
            if punch and not character:FindFirstChild("Punch") then
                punch.Parent = character
            end

            if rightHand and leftHand then
                for _, target in ipairs(Players:GetPlayers()) do
                    if target ~= LocalPlayer and not playerWhitelist[target.Name] then
                        local targetChar = target.Character
                        local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            pcall(function()
                                firetouchinterest(rightHand, rootPart, 1)
                                firetouchinterest(leftHand, rootPart, 1)
                                firetouchinterest(rightHand, rootPart, 0)
                                firetouchinterest(leftHand, rootPart, 0)
                            end)
                        end
                    end
                end
            end

            task.wait(0.05)
        end
    end)
end)

local targetDropdown = Killer:AddDropdown("Selecciona Jugador", function(name)
    if name and not table.find(targetPlayerNames, name) then
        table.insert(targetPlayerNames, name)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        targetDropdown:Add(player.Name)
        targetDropdownItems[player.Name] = true
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        targetDropdown:Add(player.Name)
        targetDropdownItems[player.Name] = true
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if targetDropdownItems[player.Name] then
        targetDropdownItems[player.Name] = nil
        targetDropdown:Clear()
        for name in pairs(targetDropdownItems) do
            targetDropdown:Add(name)
        end
    end

    for i = #targetPlayerNames, 1, -1 do
        if targetPlayerNames[i] == player.Name then
            table.remove(targetPlayerNames, i)
        end
    end
end)

Killer:AddSwitch("iniciar Kill a Jugador Seleccionado", function(state)
    killTarget = state

    task.spawn(function()
        while killTarget do
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

            local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
            if punch and not character:FindFirstChild("Punch") then
                punch.Parent = character
            end

            local rightHand = character:WaitForChild("RightHand", 5)
            local leftHand = character:WaitForChild("LeftHand", 5)

            if rightHand and leftHand then
                for _, name in ipairs(targetPlayerNames) do
                    local target = Players:FindFirstChild(name)
                    if target and target ~= LocalPlayer then
                        local rootPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            pcall(function()
                                firetouchinterest(rightHand, rootPart, 1)
                                firetouchinterest(leftHand, rootPart, 1)
                                firetouchinterest(rightHand, rootPart, 0)
                                firetouchinterest(leftHand, rootPart, 0)
                            end)
                        end
                    end
                end
            end

            task.wait(0.05)
        end
    end)
end)

local spyTargetDropdown = Killer:AddDropdown("Espectear Jugador Seleccionado", function(name)
    targetPlayerName = name
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        spyTargetDropdown:Add(player.Name)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        spyTargetDropdown:Add(player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player ~= LocalPlayer then
        spyTargetDropdown:Clear()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                spyTargetDropdown:Add(plr.Name)
            end
        end
    end
end)

Killer:AddSwitch("Espectear Jugador", function(bool)
    spying = bool
    if not spying then
        local cam = workspace.CurrentCamera
        cam.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer
        return
    end
    task.spawn(function()
        while spying do
            local target = Players:FindFirstChild(targetPlayerName)
            if target and target ~= LocalPlayer then
                local humanoid = target.Character and target.Character:FindFirstChild("Humanoid")
                if humanoid then
                    workspace.CurrentCamera.CameraSubject = humanoid
                end
            end
            task.wait(0.1)
        end
    end)
end)

Killer:AddSwitch("Auto Equip Punch", function(state)
	autoEquipPunch = state
	task.spawn(function()
		while autoEquipPunch do
			local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
			if punch then
				punch.Parent = LocalPlayer.Character
			end
			task.wait(0.1)
		end
	end)
end)


Killer:AddSwitch("Auto Punch", function(state)
	_G.fastHitActive = state
	if state then
		task.spawn(function()
			while _G.fastHitActive do
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
				local punch = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
				if punch then
					punch:Activate()
				end
				task.wait(0.1)
			end
		end)
	else
		local punch = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
		if punch then
			punch.Parent = LocalPlayer.Backpack
		end
	end
end)

-- Dropdown dinámico de jugadores
local followDropdown = Killer:AddDropdown("Seguir Jugador (TP)", function(selected)
    if selected and selected ~= "" then
        local target = Players:FindFirstChild(selected)
        if target then
            followTarget = target.Name
            following = true
            print("Started following:", target.Name)

            -- TP inmediato al seleccionarlo
            followPlayer(target)
        end
    end
end)

-- Inicializar lista de jugadores
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        followDropdown:Add(player.Name)
    end
end

-- Mantener lista actualizada
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        followDropdown:Add(player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    followDropdown:Clear()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            followDropdown:Add(plr.Name)
        end
    end
    if followTarget == player.Name then
        followTarget = nil
        following = false
    end
end)

-- Botón para dejar de seguir
Killer:AddButton("Dejar de Seguir", function()
    following = false
    followTarget = nil
    print("Stopped following")
end)

-- Loop de seguimiento automático
task.spawn(function()
    while true do
        task.wait(0.2) -- cada 0.2s para actualizar TP
        if following and followTarget then
            local target = Players:FindFirstChild(followTarget)
            if target then
                followPlayer(target)
            else
                following = false
                followTarget = nil
            end
        end
    end
end)

local godDamageActive = false

Killer:AddSwitch("Auto Pisoton", function(state)
    godDamageActive = state
    if state then
        task.spawn(function()
            while godDamageActive do
                local player = game.Players.LocalPlayer
                local groundSlam = player.Backpack:FindFirstChild("Ground Slam") or (player.Character and player.Character:FindFirstChild("Ground Slam"))

                if groundSlam then
                    -- Equipar
                    if groundSlam.Parent == player.Backpack then
                        groundSlam.Parent = player.Character
                    end

                    -- Quitar delay
                    if groundSlam:FindFirstChild("attackTime") then
                        groundSlam.attackTime.Value = 0
                    end

                    -- Lanzar evento
                    player.muscleEvent:FireServer("slam")

                    -- Activar herramienta
                    groundSlam:Activate()
                end

                task.wait(0.1) -- delay pequeño
            end
        end)
    end
end)

-- Botón para dejar de seguir
Killer:AddButton("Dejar de Seguir", function()
    following = false
    followTarget = nil
    print("Stopped following")
end)

-- Loop de seguimiento automático
task.spawn(function()
    while true do
        task.wait(0.2) -- cada 0.2s para actualizar TP
        if following and followTarget then
            local target = Players:FindFirstChild(followTarget)
            if target then
                followPlayer(target)
            else
                following = false
                followTarget = nil
            end
        end
    end
end)

Killer:AddLabel("━━━━━━ Aqui puedes Activar Matar Muerto ━━━━━━")

-- 📜 Lista de RAWs a ejecutar
local urls = {
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack2",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack3",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack4",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack5",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack6"
}

-- ⚡ Botón que ejecuta todos los scripts remotos
Killer:AddButton("Pegar Muerto", function()
    for _, url in ipairs(urls) do
        spawn(function()
            local success, response = pcall(function()
                return game:HttpGet(url)
            end)
            if success and response then
                local loadSuccess, err = pcall(function()
                    loadstring(response)()
                end)
                if not loadSuccess then
                    warn("[Pegar Muerto] Error ejecutando raw:", url, err)
                end
            else
                warn("[Pegar Muerto] No se pudo cargar:", url)
            end
        end)
    end
end)

local farm = window:AddTab("Farm")

farm:AddLabel("Farm")

local credits = window:AddTab("Credits")

credits:AddLabel("Deobfuscated By Alejandro")










