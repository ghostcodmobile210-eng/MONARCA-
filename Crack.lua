-- ts file was generated at discord.gg/25ms


local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()
game:GetService("ReplicatedStorage")
local vu2 = game:GetService("Players").LocalPlayer
os.time()
local _ = vu2.leaderstats.Rebirths.Value
local _ = vu2.DisplayName
local v3 = v1:AddWindow("Tukule Script", {
    main_color = Color3.fromRGB(0, 0, 139),
    min_size = Vector2.new(700, 900),
    can_resize = true
})
local v4 = v3:AddTab("Main")
local v5 = v3:AddTab("Farm")
v4:Show()
local v6 = v4:AddFolder("Auto Brawls")
local vu7 = game:GetService("Players")
local vu8 = {}
v6:AddSwitch("Auto Win Brawls", function(p9)
    getgenv().autoWinBrawl = p9
    local function vu16()
        if getgenv().autoWinBrawl then
            local v10 = game.Players.LocalPlayer.Character
            if not v10 then
                return false
            end
            if v10:FindFirstChild("Punch") then
                return true
            end
            local v11 = game.Players.LocalPlayer.Backpack
            if not v11 then
                return false
            end
            local v12, v13, v14 = pairs(v11:GetChildren())
            while true do
                local v15
                v14, v15 = v12(v13, v14)
                if v14 == nil then
                    break
                end
                if v15.ClassName == "Tool" and v15.Name == "Punch" then
                    v15.Parent = v10
                    return true
                end
            end
            return false
        end
    end
    local function vu21(p17)
        if not (p17 and p17.Parent) then
            return false
        end
        if p17 == vu7.LocalPlayer then
            return false
        end
        if vu8[p17.UserId] then
            return false
        end
        local v18 = p17.Character
        if not (v18 and v18.Parent) then
            return false
        end
        local v19 = v18:FindFirstChild("Humanoid")
        if not v19 then
            return false
        end
        if not v19.Health or v19.Health <= 0 then
            return false
        end
        if v19:GetState() == Enum.HumanoidStateType.Dead then
            return false
        end
        local v20 = v18:FindFirstChild("HumanoidRootPart")
        return v20 and v20.Parent and true or false
    end
    local function vu27()
        local v22 = game.Players.LocalPlayer
        if not v22 then
            return false
        end
        local v23 = v22.Character
        if not (v23 and v23.Parent) then
            return false
        end
        local v24 = v23:FindFirstChild("Humanoid")
        if not v24 or v24.Health <= 0 then
            return false
        end
        local v25 = v23:FindFirstChild("LeftHand")
        local v26 = v23:FindFirstChild("RightHand")
        return v25 ~= nil or v26 ~= nil
    end
    local function vu31(pu28, pu29)
        if not (pu28 and pu28.Parent) then
            return false
        end
        if not (pu29 and pu29.Parent) then
            return false
        end
        local v30, _ = pcall(function()
            firetouchinterest(pu28, pu29, 0)
            task.wait(0.01)
            firetouchinterest(pu28, pu29, 1)
        end)
        return v30
    end
    task.spawn(function()
        while getgenv().autoWinBrawl and (task.wait(0.5) and getgenv().autoWinBrawl) do
            if game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible then
                game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible = false
            end
        end
    end)
    task.spawn(function()
        while getgenv().autoWinBrawl and (task.wait(0.5) and getgenv().autoWinBrawl) do
            vu16()
        end
    end)
    task.spawn(function()
        while getgenv().autoWinBrawl and (task.wait(0.1) and getgenv().autoWinBrawl) do
            if vu27() and game.ReplicatedStorage.brawlInProgress.Value then
                local vu32 = game.Players.LocalPlayer
                pcall(function()
                    vu32.muscleEvent:FireServer("punch", "rightHand")
                end)
                pcall(function()
                    vu32.muscleEvent:FireServer("punch", "leftHand")
                end)
            end
        end
    end)
    task.spawn(function()
        while getgenv().autoWinBrawl and (task.wait(0.05) and getgenv().autoWinBrawl) do
            if vu27() and game.ReplicatedStorage.brawlInProgress.Value then
                local v33 = game.Players.LocalPlayer.Character
                local vu34 = v33:FindFirstChild("LeftHand")
                local vu35 = v33:FindFirstChild("RightHand")
                local v36 = vu7
                local v37, v38, v39 = pairs(v36:GetPlayers())
                while true do
                    local vu40
                    v39, vu40 = v37(v38, v39)
                    if v39 == nil or not getgenv().autoWinBrawl then
                        break
                    end
                    pcall(function()
                        if vu21(vu40) then
                            local v41 = vu40.Character.HumanoidRootPart
                            if vu34 then
                                vu31(v41, vu34)
                            end
                            if vu35 then
                                vu31(v41, vu35)
                            end
                        end
                    end)
                    task.wait(0.01)
                end
            end
        end
    end)
    task.spawn(function()
        local v42 = 0
        local v43 = 0
        while getgenv().autoWinBrawl and (task.wait(1) and getgenv().autoWinBrawl) do
            local v44 = # vu7:GetPlayers()
            if v44 == v42 then
                v43 = v43 + 1
                if v43 > 5 then
                    pcall(function()
                        local v45 = game.Players.LocalPlayer.Character
                        if v45 and v45:FindFirstChild("Punch") then
                            v45.Punch.Parent = game.Players.LocalPlayer.Backpack
                            task.wait(0.1)
                            vu16()
                        else
                            vu16()
                        end
                    end)
                    v43 = 0
                end
            else
                v42 = v44
                v43 = 0
            end
        end
    end)
end)
v6:AddSwitch("Auto Brawls", function(p46)
    getgenv().autoJoinBrawl = p46
    task.spawn(function()
        while getgenv().autoJoinBrawl and (task.wait(0.5) and getgenv().autoJoinBrawl) do
            if game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible then
                game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                game.Players.LocalPlayer.PlayerGui.gameGui.brawlJoinLabel.Visible = false
            end
        end
    end)
end)
local v47 = v4:AddFolder("Jungle Gym")
local vu48 = game:GetService("VirtualInputManager")
local vu49 = game:GetService("Players").LocalPlayer
local function vu50()
    vu48:SendKeyEvent(true, "E", false, game)
    task.wait(0.1)
    vu48:SendKeyEvent(false, "E", false, game)
end
local function vu51()
    while getgenv().working do
        vu49.muscleEvent:FireServer("rep")
        task.wait()
    end
end
local function vu54(_, p52)
    local v53 = vu49.Character
    if v53 and v53:FindFirstChild("HumanoidRootPart") then
        v53.HumanoidRootPart.CFrame = p52
        task.wait(0.1)
        vu50()
        task.spawn(vu51)
    end
end
v47:AddSwitch("Jungle Bench Press", function(p55)
    if getgenv().working and not p55 then
        getgenv().working = false
    else
        getgenv().working = p55
        if p55 then
            vu54("Bench Press", CFrame.new(- 8173, 64, 1898))
        end
    end
end)
v47:AddSwitch("Jungle Squat", function(p56)
    if getgenv().working and not p56 then
        getgenv().working = false
    else
        getgenv().working = p56
        if p56 then
            vu54("Squat", CFrame.new(- 8352, 34, 2878))
        end
    end
end)
v47:AddSwitch("Jungle Pull Ups", function(p57)
    if getgenv().working and not p57 then
        getgenv().working = false
    else
        getgenv().working = p57
        if p57 then
            vu54("Pull Up", CFrame.new(- 8666, 34, 2070))
        end
    end
end)
v47:AddSwitch("Jungle Boulder", function(p58)
    if getgenv().working and not p58 then
        getgenv().working = false
    else
        getgenv().working = p58
        if p58 then
            vu54("Boulder", CFrame.new(- 8621, 34, 2684))
        end
    end
end)
local v59 = v4:AddFolder("Enter Gym")
local vu60 = {
    ["Bench Press"] = {
        ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
        ["Legend Gym"] = CFrame.new(4111.91748, 1020.46674, - 3799.97217),
        ["Muscle King Gym"] = CFrame.new(- 8590.06152, 46.0167427, - 6043.34717)
    },
    Squat = {
        ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
        ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
        ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477)
    },
    Deadlift = {
        ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
        ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
        ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477)
    },
    ["Pull Up"] = {
        ["Eternal Gym"] = CFrame.new(- 7176.19141, 45.394104, - 1106.31421),
        ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, - 4124.2334),
        ["Muscle King Gym"] = CFrame.new(- 8940.12402, 13.1642084, - 5699.13477)
    }
}
local v61, v62, v63 = ipairs({
    "Bench Press",
    "Squat",
    "Deadlift",
    "Pull Up"
})
local vu64 = vu54
local v65 = {
    ["Bench Press"] = "Bench Press",
    Squat = "Squat",
    Deadlift = "Dead Lift",
    ["Pull Up"] = "Pull Up"
}
local vu66 = {
    "Eternal Gym",
    "Legend Gym",
    "Muscle King Gym"
}
local vu67 = {}
while true do
    local vu68
    v63, vu68 = v61(v62, v63)
    if v63 == nil then
        break
    end
    local _ = vu68 .. "GymDropdown"
    local v69 = v65[vu68]
    local v71 = v59:AddDropdown(v69 .. " - Gym", function(p70)
        _G["selected" .. string.gsub(vu68, " ", "") .. "Gym"] = p70
    end)
    local v72, v73, v74 = ipairs(vu66)
    while true do
        local v75
        v74, v75 = v72(v73, v74)
        if v74 == nil then
            break
        end
        v71:Add(v75)
    end
    local _ = vu68 .. "GymToggle"
    vu67[vu68] = v59:AddSwitch(v69, function(p76)
        getgenv().workingGym = p76
        getgenv().currentWorkoutType = vu68
        if p76 then
            local v77 = _G["selected" .. string.gsub(vu68, " ", "") .. "Gym"] or vu66[1]
            if vu60[vu68] and vu60[vu68][v77] then
                local v78, v79, v80 = pairs(vu67)
                while true do
                    local v81
                    v80, v81 = v78(v79, v80)
                    if v80 == nil then
                        break
                    end
                    if v80 ~= vu68 and v81 then
                        v81:Set(false)
                    end
                end
                vu64(vu68, vu60[vu68][v77])
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Error",
                    Text = "Position not found for " .. vu68 .. " in " .. v77,
                    Duration = 5
                })
            end
        end
    end)
end
local v82 = v4:AddFolder("OP Things/Farms")
v82:AddSwitch("Anti Knockback", function(p83)
    if p83 then
        local v84 = game.Players.LocalPlayer.Name
        local v85 = game.Workspace:FindFirstChild(v84):FindFirstChild("HumanoidRootPart")
        local v86 = Instance.new("BodyVelocity")
        v86.MaxForce = Vector3.new(100000, 0, 100000)
        v86.Velocity = Vector3.new(0, 0, 0)
        v86.P = 1250
        v86.Parent = v85
    else
        local v87 = game.Players.LocalPlayer.Name
        local v88 = game.Workspace:FindFirstChild(v87):FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity")
        if v88 and v88.MaxForce == Vector3.new(100000, 0, 100000) then
            v88:Destroy()
        end
    end
end)
v82:AddButton("Anti AFK", function()
    local v89 = getconnections or get_signal_cons
    if v89 then
        local v90, v91, v92 = pairs(v89(game.Players.LocalPlayer.Idled))
        while true do
            local v93
            v92, v93 = v90(v91, v92)
            if v92 == nil then
                break
            end
            if v93.Disable then
                v93:Disable()
            elseif v93.Disconnect then
                v93:Disconnect()
            end
        end
    else
        local vu94 = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu94:CaptureController()
            vu94:ClickButton2(Vector2.new())
        end)
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Anti AFK",
        Text = "Anti AFK has been enabled!",
        Duration = 5
    })
    spawn(function()
        while wait(30) do
            local v95 = game:GetService("VirtualUser")
            v95:CaptureController()
            v95:ClickButton2(Vector2.new())
        end
    end)
end)
local v96 = v5:AddFolder("Auto Rock")
function gettool()
    local v97, v98, v99 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v100
        v99, v100 = v97(v98, v99)
        if v99 == nil then
            break
        end
        if v100.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v100)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
v96:AddSwitch("Tiny Rock", function(p101)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = p101
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
                local v102, v103, v104 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v105
                    v104, v105 = v102(v103, v104)
                    if v104 == nil then
                        break
                    end
                    if v105.Name == "neededDurability" and v105.Value == 0 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v105.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v105.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v105.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v105.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Starter Rock", function(p106)
    selectrock = "Starter Island Rock"
    getgenv().autoFarm = p106
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 100 then
                local v107, v108, v109 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v110
                    v109, v110 = v107(v108, v109)
                    if v109 == nil then
                        break
                    end
                    if v110.Name == "neededDurability" and v110.Value == 100 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v110.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v110.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v110.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v110.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Legend Beach Rock", function(p111)
    selectrock = "Legend Beach Rock"
    getgenv().autoFarm = p111
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 5000 then
                local v112, v113, v114 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v115
                    v114, v115 = v112(v113, v114)
                    if v114 == nil then
                        break
                    end
                    if v115.Name == "neededDurability" and v115.Value == 5000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v115.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v115.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v115.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v115.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Frozen Rock", function(p116)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = p116
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
                local v117, v118, v119 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v120
                    v119, v120 = v117(v118, v119)
                    if v119 == nil then
                        break
                    end
                    if v120.Name == "neededDurability" and v120.Value == 150000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v120.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v120.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v120.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v120.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Mythical Rock", function(p121)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = p121
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
                local v122, v123, v124 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v125
                    v124, v125 = v122(v123, v124)
                    if v124 == nil then
                        break
                    end
                    if v125.Name == "neededDurability" and v125.Value == 400000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v125.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v125.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v125.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v125.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Eternal Rock", function(p126)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = p126
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
                local v127, v128, v129 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v130
                    v129, v130 = v127(v128, v129)
                    if v129 == nil then
                        break
                    end
                    if v130.Name == "neededDurability" and v130.Value == 750000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v130.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v130.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v130.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v130.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Legend Rock", function(p131)
    selectrock = "Legend Gym Rock"
    getgenv().autoFarm = p131
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
                local v132, v133, v134 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v135
                    v134, v135 = v132(v133, v134)
                    if v134 == nil then
                        break
                    end
                    if v135.Name == "neededDurability" and v135.Value == 1000000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v135.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v135.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v135.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v135.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Muscle King Rock", function(p136)
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = p136
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
                local v137, v138, v139 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v140
                    v139, v140 = v137(v138, v139)
                    if v139 == nil then
                        break
                    end
                    if v140.Name == "neededDurability" and v140.Value == 5000000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v140.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v140.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v140.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v140.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
v96:AddSwitch("Jungle Rock", function(p141)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = p141
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then
                break
            end
            if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
                local v142, v143, v144 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
                while true do
                    local v145
                    v144, v145 = v142(v143, v144)
                    if v144 == nil then
                        break
                    end
                    if v145.Name == "neededDurability" and v145.Value == 10000000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                        firetouchinterest(v145.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v145.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v145.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v145.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)
local v146 = v5:AddFolder("Rebirths")
v146:AddTextBox("Rebirth Target", function(p147)
    local v148 = tonumber(p147)
    if v148 and 0 < v148 then
        targetRebirthValue = v148
        updateStats()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Objetivo Actualizado",
            Text = "Nuevo objetivo: " .. tostring(targetRebirthValue) .. " renacimientos",
            Duration = 0
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Entrada Inv\195\161lida",
            Text = "Por favor ingresa un n\195\186mero v\195\161lido mayor que 0",
            Duration = 0
        })
    end
end)
local vu149 = nil
local vu151 = v146:AddSwitch("Auto Rebirth Target", function(p150)
    _G.targetRebirthActive = p150
    if p150 then
        if _G.infiniteRebirthActive and vu149 then
            vu149:Set(false)
            _G.infiniteRebirthActive = false
        end
        spawn(function()
            while _G.targetRebirthActive and wait(0.1) do
                if game.Players.LocalPlayer.leaderstats.Rebirths.Value >= targetRebirthValue then
                    targetSwitch:Set(false)
                    _G.targetRebirthActive = false
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "\194\161Objetivo Alcanzado!",
                        Text = "Has alcanzado " .. tostring(targetRebirthValue) .. " renacimientos",
                        Duration = 5
                    })
                    break
                end
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
        end)
    end
end, "Renacimiento autom\195\161tico hasta alcanzar el objetivo")
vu149 = v146:AddSwitch("Auto Rebirth (Infinite)", function(p152)
    _G.infiniteRebirthActive = p152
    if p152 then
        if _G.targetRebirthActive and vu151 then
            vu151:Set(false)
            _G.targetRebirthActive = false
        end
        spawn(function()
            while _G.infiniteRebirthActive and wait(0.1) do
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
        end)
    end
end, "Renacimiento continuo sin parar")
v146:AddSwitch("Auto Size 1", function(p153)
    _G.autoSizeActive = p153
    if p153 then
        spawn(function()
            while _G.autoSizeActive and wait() do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1)
            end
        end)
    end
end, "Establece el tama\195\177o del personaje a 1 continuamente")
v146:AddSwitch("Auto Teleport To King", function(p154)
    _G.teleportActive = p154
    if p154 then
        spawn(function()
            while _G.teleportActive and wait() do
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(- 8646, 17, - 5738))
                end
            end
        end)
    end
end, "Auto Teleport to King ")
local v155 = v5:AddFolder("Auto Equip Tools")
v155:AddButton("Gamepass AutoLift", function()
    local v156 = game:GetService("ReplicatedStorage").gamepassIds
    local v157 = game:GetService("Players").LocalPlayer
    local v158, v159, v160 = pairs(v156:GetChildren())
    while true do
        local v161
        v160, v161 = v158(v159, v160)
        if v160 == nil then
            break
        end
        local v162 = Instance.new("IntValue")
        v162.Name = v161.Name
        v162.Value = v161.Value
        v162.Parent = v157.ownedGamepasses
    end
end, "Desbloquea el gamepass de AutoLift gratis")
v155:AddSwitch("Auto Weight", function(p163)
    _G.AutoWeight = p163
    if p163 then
        local v164 = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
        if v164 then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v164)
        end
    else
        local v165 = game.Players.LocalPlayer.Character:FindFirstChild("Weight")
        if v165 then
            v165.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    task.spawn(function()
        while _G.AutoWeight and _G.AutoWeight do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.1)
        end
    end)
end, "Levanta pesas autom\195\161ticamente")
v155:AddSwitch("Auto Pushups", function(p166)
    _G.AutoPushups = p166
    if p166 then
        local v167 = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
        if v167 then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v167)
        end
    else
        local v168 = game.Players.LocalPlayer.Character:FindFirstChild("Pushups")
        if v168 then
            v168.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    task.spawn(function()
        while _G.AutoPushups and _G.AutoPushups do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.1)
        end
    end)
end, "Haz flexiones autom\195\161ticamente")
v155:AddSwitch("Auto Handstands", function(p169)
    _G.AutoHandstands = p169
    if p169 then
        local v170 = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands")
        if v170 then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v170)
        end
    else
        local v171 = game.Players.LocalPlayer.Character:FindFirstChild("Handstands")
        if v171 then
            v171.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    task.spawn(function()
        while _G.AutoHandstands and _G.AutoHandstands do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.1)
        end
    end)
end, "Haz paradas de manos autom\195\161ticamente")
v155:AddSwitch("Auto Situps", function(p172)
    _G.AutoSitups = p172
    if p172 then
        local v173 = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
        if v173 then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v173)
        end
    else
        local v174 = game.Players.LocalPlayer.Character:FindFirstChild("Situps")
        if v174 then
            v174.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    task.spawn(function()
        while _G.AutoSitups and _G.AutoSitups do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.1)
        end
    end)
end, "Haz abdominales autom\195\161ticamente")
v155:AddSwitch("Auto Punch", function(p175)
    _G.fastHitActive = p175
    if p175 then
        task.spawn(function()
            while _G.fastHitActive and _G.fastHitActive do
                local v176 = game.Players.LocalPlayer
                local v177 = v176.Backpack:FindFirstChild("Punch")
                if v177 then
                    v177.Parent = v176.Character
                    if v177:FindFirstChild("attackTime") then
                        v177.attackTime.Value = 0
                    end
                end
                task.wait(0.1)
            end
        end)
        task.spawn(function()
            while _G.fastHitActive and _G.fastHitActive do
                local v178 = game.Players.LocalPlayer
                v178.muscleEvent:FireServer("punch", "rightHand")
                v178.muscleEvent:FireServer("punch", "leftHand")
                local v179 = v178.Character
                local v180 = v179 and v179:FindFirstChild("Punch")
                if v180 then
                    v180:Activate()
                end
                task.wait(0)
            end
        end)
    else
        local v181 = game.Players.LocalPlayer.Character:FindFirstChild("Punch")
        if v181 then
            v181.Parent = game.Players.LocalPlayer.Backpack
        end
    end
end, "Golpea autom\195\161ticamente")
v155:AddSwitch("Fast Tools", function(p182)
    _G.FastTools = p182
    local v183 = game.Players.LocalPlayer
    local v184 = v183:WaitForChild("Backpack")
    local v185, v186, v187 = ipairs({
        {
            "Punch",
            "attackTime",
            p182 and 0 or 0.35
        },
        {
            "Ground Slam",
            "attackTime",
            p182 and 0 or 6
        },
        {
            "Stomp",
            "attackTime",
            p182 and 0 or 7
        },
        {
            "Handstands",
            "repTime",
            p182 and 0 or 1
        },
        {
            "Pushups",
            "repTime",
            p182 and 0 or 1
        },
        {
            "Weight",
            "repTime",
            p182 and 0 or 1
        },
        {
            "Situps",
            "repTime",
            p182 and 0 or 1
        }
    })
    while true do
        local v188
        v187, v188 = v185(v186, v187)
        if v187 == nil then
            break
        end
        local v189 = v184:FindFirstChild(v188[1])
        if v189 and v189:FindFirstChild(v188[2]) then
            v189[v188[2] ].Value = v188[3]
        end
        local v190 = v183.Character
        if v190 then
            v190 = v183.Character:FindFirstChild(v188[1])
        end
        if v190 and v190:FindFirstChild(v188[2]) then
            v190[v188[2] ].Value = v188[3]
        end
    end
end, "Acelera todas las herramientas")
local vu191 = os.time()
local vu192 = 0
local vu193 = 0
local vu194 = 0
local vu195 = 0
local vu196 = 0
local vu197 = false
local v198 = v5:AddFolder("Stats")
v198:AddLabel("Strength")
local vu199 = v198:AddLabel("Actual: Waiting...")
local vu200 = v198:AddLabel("Gained: 0")
v198:AddLabel("Durability")
local vu201 = v198:AddLabel("Actual: Waiting...")
local vu202 = v198:AddLabel("Gained: 0")
v198:AddLabel("Rebirths")
local vu203 = v198:AddLabel("Actual: Waiting...")
local vu204 = v198:AddLabel("Gained: 0")
v198:AddLabel("Kills")
local vu205 = v198:AddLabel("Actual: Waiting...")
local vu206 = v198:AddLabel("Gained: 0")
v198:AddLabel("Brawls")
local vu207 = v198:AddLabel("Actual: Waiting...")
local vu208 = v198:AddLabel("Gained: 0")
v198:AddLabel("Time Of Session")
local vu209 = v198:AddLabel("Time: 00:00:00")
local function vu211(p210)
    if p210 >= 1000000000000000 then
        return string.format("%.2fQ", p210 / 1000000000000000)
    elseif p210 >= 1000000000000 then
        return string.format("%.2fT", p210 / 1000000000000)
    elseif p210 >= 1000000000 then
        return string.format("%.2fB", p210 / 1000000000)
    elseif p210 >= 1000000 then
        return string.format("%.2fM", p210 / 1000000)
    elseif p210 >= 1000 then
        return string.format("%.2fK", p210 / 1000)
    else
        return tostring(math.floor(p210))
    end
end
local function vu215(p212)
    local v213 = tostring(math.floor(p212))
    repeat
        local v214
        v213, v214 = string.gsub(v213, "^(-?%d+)(%d%d%d)", "%1,%2")
    until v214 == 0
    return v213
end
local function vu221(p216)
    local v217 = math.floor(p216 / 86400)
    local v218 = math.floor(p216 % 86400 / 3600)
    local v219 = math.floor(p216 % 3600 / 60)
    local v220 = p216 % 60
    if v217 > 0 then
        return string.format("%dd %02dh %02dm %02ds", v217, v218, v219, v220)
    else
        return string.format("%02d:%02d:%02d", v218, v219, v220)
    end
end
local function vu223()
    if not vu197 then
        local v222 = game.Players.LocalPlayer
        vu192 = v222.leaderstats.Strength.Value
        vu193 = v222.Durability.Value
        vu194 = v222.leaderstats.Kills.Value
        vu195 = v222.leaderstats.Rebirths.Value
        vu196 = v222.leaderstats.Brawls.Value
        vu191 = os.time()
        vu197 = true
    end
end
local function vu236()
    local v224 = game.Players.LocalPlayer
    if not vu197 then
        vu223()
    end
    local v225 = v224.leaderstats.Strength.Value
    local v226 = v224.Durability.Value
    local v227 = v224.leaderstats.Kills.Value
    local v228 = v224.leaderstats.Rebirths.Value
    local v229 = v224.leaderstats.Brawls.Value
    local v230 = v225 - vu192
    local v231 = v226 - vu193
    local v232 = v227 - vu194
    local v233 = v228 - vu195
    local v234 = v229 - vu196
    vu199.Text = string.format("Actual: %s", vu211(v225))
    vu201.Text = string.format("Actual: %s", vu211(v226))
    vu203.Text = string.format("Actual: %s", vu211(v228))
    vu205.Text = string.format("Actual: %s", vu211(v227))
    vu207.Text = string.format("Actual: %s", vu211(v229))
    vu200.Text = string.format("Gained: %s", vu211(v230))
    vu202.Text = string.format("Gained: %s", vu211(v231))
    vu204.Text = string.format("Gained: %s", vu211(v233))
    vu206.Text = string.format("Gained: %s", vu211(v232))
    vu208.Text = string.format("Gained: %s", vu211(v234))
    local v235 = vu221(os.time() - vu191)
    vu209.Text = string.format("Time: %s", v235)
end
vu236()
spawn(function()
    while wait(2) do
        vu236()
    end
end)
v198:AddButton("Reset Stats", function()
    local v237 = game.Players.LocalPlayer
    vu192 = v237.leaderstats.Strength.Value
    vu193 = v237.Durability.Value
    vu194 = v237.leaderstats.Kills.Value
    vu195 = v237.leaderstats.Rebirths.Value
    vu196 = v237.leaderstats.Brawls.Value
    vu191 = os.time()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Seguimiento de Estad\195\173sticas",
        Text = "\194\161El seguimiento de progreso de la sesi\195\179n ha sido reiniciado!",
        Duration = 0
    })
end)
v198:AddButton("Copy Stas To Clipboard", function()
    local v238 = game.Players.LocalPlayer
    local v239 = (((("Estad\195\173sticas de Muscle Legends:\n\n" .. "Strength: " .. vu215(v238.leaderstats.Strength.Value) .. "\n") .. "Durability: " .. vu215(v238.Durability.Value) .. "\n") .. "Rebirths: " .. vu215(v238.leaderstats.Rebirths.Value) .. "\n") .. "Kills: " .. vu215(v238.leaderstats.Kills.Value) .. "\n") .. "Brawls: " .. vu215(v238.leaderstats.Brawls.Value) .. "\n\n"
    if vu197 then
        local v240 = os.time() - vu191
        local v241 = v238.leaderstats.Strength.Value - vu192
        local v242 = v238.Durability.Value - vu193
        local v243 = v238.leaderstats.Kills.Value - vu194
        local v244 = v238.leaderstats.Rebirths.Value - vu195
        local v245 = v238.leaderstats.Brawls.Value - vu196
        v239 = ((((((v239 .. "--- Estad\195\173sticas de Sesi\195\179n ---\n") .. "Time Of Session: " .. vu221(v240) .. "\n") .. "Strength Gained: " .. vu215(v241) .. "\n") .. "Durability Gained: " .. vu215(v242) .. "\n") .. "Rebirths Gained: " .. vu215(v244) .. "\n") .. "Kills Gained: " .. vu215(v243) .. "\n") .. "Brawls Gained: " .. vu215(v245) .. "\n"
    end
    setclipboard(v239)
end)
local v246 = v3:AddTab("Pets")
local vu247 = game:GetService("ReplicatedStorage")
v246:AddLabel("Pets")
local vu248 = "Neon Guardian"
local v250 = v246:AddDropdown("Seleccionar Mascota", function(p249)
    vu248 = p249
    print("Mascota seleccionada: " .. p249)
end)
v250:Add("Neon Guardian")
v250:Add("Blue Birdie")
v250:Add("Blue Bunny")
v250:Add("Blue Firecaster")
v250:Add("Blue Pheonix")
v250:Add("Crimson Falcon")
v250:Add("Cybernetic Showdown Dragon")
v250:Add("Dark Golem")
v250:Add("Dark Legends Manticore")
v250:Add("Dark Vampy")
v250:Add("Darkstar Hunter")
v250:Add("Eternal Strike Leviathan")
v250:Add("Frostwave Legends Penguin")
v250:Add("Gold Warrior")
v250:Add("Golden Pheonix")
v250:Add("Golden Viking")
v250:Add("Green Butterfly")
v250:Add("Green Firecaster")
v250:Add("Infernal Dragon")
v250:Add("Lightning Strike Phantom")
v250:Add("Magic Butterfly")
v250:Add("Muscle Sensei")
v250:Add("Orange Hedgehog")
v250:Add("Orange Pegasus")
v250:Add("Phantom Genesis Dragon")
v250:Add("Purple Dragon")
v250:Add("Purple Falcon")
v250:Add("Red Dragon")
v250:Add("Red Firecaster")
v250:Add("Red Kitty")
v250:Add("Silver Dog")
v250:Add("Ultimate Supernova Pegasus")
v250:Add("Ultra Birdie")
v250:Add("White Pegasus")
v250:Add("White Pheonix")
v250:Add("Yellow Butterfly")
v246:AddSwitch("Auto Open Pet", function(p251)
    _G.AutoHatchPet = p251
    if p251 then
        spawn(function()
            while _G.AutoHatchPet and vu248 ~= "" do
                local v252 = vu247.cPetShopFolder:FindFirstChild(vu248)
                if v252 then
                    vu247.cPetShopRemote:InvokeServer(v252)
                end
                task.wait(1)
            end
        end)
    end
end)
v246:AddLabel("AURAS")
local vu253 = "Blue Aura"
local v255 = v246:AddDropdown("Select Aura", function(p254)
    vu253 = p254
    print("Aura seleccionada: " .. p254)
end)
v255:Add("Astral Electro")
v255:Add("Azure Tundra")
v255:Add("Blue Aura")
v255:Add("Dark Electro")
v255:Add("Dark Lightning")
v255:Add("Dark Storm")
v255:Add("Electro")
v255:Add("Enchanted Mirage")
v255:Add("Entropic Blast")
v255:Add("Eternal Megastrike")
v255:Add("Grand Supernova")
v255:Add("Green Aura")
v255:Add("Inferno")
v255:Add("Lightning")
v255:Add("Muscle King")
v255:Add("Power Lightning")
v255:Add("Purple Aura")
v255:Add("Purple Nova")
v255:Add("Red Aura")
v255:Add("Supernova")
v255:Add("Ultra Inferno")
v255:Add("Ultra Mirage")
v255:Add("Unstable Mirage")
v255:Add("Yellow Aura")
v246:AddSwitch("Auto Open Auras", function(p256)
    _G.AutoHatchAura = p256
    if p256 then
        spawn(function()
            while _G.AutoHatchAura and vu253 ~= "" do
                local v257 = vu247.cPetShopFolder:FindFirstChild(vu253)
                if v257 then
                    vu247.cPetShopRemote:InvokeServer(v257)
                end
                task.wait(1)
            end
        end)
    end
end)
local v258 = v3:AddTab("Misc")
local v259 = v258:AddFolder("Misc 1")
v259:AddButton("Remove Portals", function()
    local v260, v261, v262 = pairs(game:GetDescendants())
    while true do
        local v263
        v262, v263 = v260(v261, v262)
        if v262 == nil then
            break
        end
        if v263.Name == "RobloxForwardPortals" then
            v263:Destroy()
        end
    end
    if _G.AdRemovalConnection then
        _G.AdRemovalConnection:Disconnect()
    end
    _G.AdRemovalConnection = game.DescendantAdded:Connect(function(p264)
        if p264.Name == "RobloxForwardPortals" then
            p264:Destroy()
        end
    end)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Anuncios Eliminados",
        Text = "Los anuncios de Roblox han sido eliminados",
        Duration = 0
    })
end)
local vu265 = {}
local vu266 = 2048
local vu267 = Vector3.new(- 2, - 9.5, - 2)
local vu268 = math.ceil(50000 / vu266)
local function vu276()
    for v269 = 0, vu268 - 1 do
        local v270 = v269
        for v271 = 0, vu268 - 1 do
            local v272 = Instance.new("Part")
            v272.Size = Vector3.new(vu266, 1, vu266)
            v272.Position = vu267 + Vector3.new(v270 * vu266, 0, v271 * vu266)
            v272.Anchored = true
            v272.Transparency = 1
            v272.CanCollide = true
            v272.Name = "Part_Side_" .. v270 .. "_" .. v271
            v272.Parent = workspace
            table.insert(vu265, v272)
            local v273 = Instance.new("Part")
            v273.Size = Vector3.new(vu266, 1, vu266)
            v273.Position = vu267 + Vector3.new(- v270 * vu266, 0, v271 * vu266)
            v273.Anchored = true
            v273.Transparency = 1
            v273.CanCollide = true
            v273.Name = "Part_LeftRight_" .. v270 .. "_" .. v271
            v273.Parent = workspace
            table.insert(vu265, v273)
            local v274 = Instance.new("Part")
            v274.Size = Vector3.new(vu266, 1, vu266)
            v274.Position = vu267 + Vector3.new(- v270 * vu266, 0, - v271 * vu266)
            v274.Anchored = true
            v274.Transparency = 1
            v274.CanCollide = true
            v274.Name = "Part_UpLeft_" .. v270 .. "_" .. v271
            v274.Parent = workspace
            table.insert(vu265, v274)
            local v275 = Instance.new("Part")
            v275.Size = Vector3.new(vu266, 1, vu266)
            v275.Position = vu267 + Vector3.new(v270 * vu266, 0, - v271 * vu266)
            v275.Anchored = true
            v275.Transparency = 1
            v275.CanCollide = true
            v275.Name = "Part_UpRight_" .. v270 .. "_" .. v271
            v275.Parent = workspace
            table.insert(vu265, v275)
        end
    end
end
local function vu281()
    local v277, v278, v279 = ipairs(vu265)
    while true do
        local v280
        v279, v280 = v277(v278, v279)
        if v279 == nil then
            break
        end
        if v280 and v280.Parent then
            v280.CanCollide = false
        end
    end
end
v259:AddSwitch("Walk on Water", function(p282)
    if p282 then
        vu276()
    else
        vu281()
    end
end)
v259:AddSwitch("Auto Spin Wheel", function(p283)
    _G.AutoSpinWheel = p283
    if p283 then
        spawn(function()
            while _G.AutoSpinWheel and wait(1) do
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
            end
        end)
    end
end)
v259:AddSwitch("Auto Claim Gifts", function(p284)
    _G.AutoClaimGifts = p284
    if p284 then
        spawn(function()
            while _G.AutoClaimGifts and wait(1) do
                for v285 = 1, 8 do
                    game:GetService("ReplicatedStorage").rEvents.freeGiftClaimRemote:InvokeServer("claimGift", v285)
                end
            end
        end)
    end
end)
local v286 = v258:AddFolder("Misc 2")
v286:AddSwitch("Auto Punch", function(p287)
    _G.FastPunch = p287
    if p287 then
        spawn(function()
            while _G.FastPunch do
                local v288 = game.Players.LocalPlayer
                local v289 = v288.Character
                if v289 and not v289:FindFirstChild("Punch") then
                    local v290 = v288.Backpack:FindFirstChild("Punch")
                    if v290 then
                        if v290:FindFirstChild("attackTime") then
                            v290.attackTime.Value = 0
                        end
                        v289.Humanoid:EquipTool(v290)
                    end
                elseif v289 and v289:FindFirstChild("Punch") then
                    local v291 = v289:FindFirstChild("Punch")
                    if v291:FindFirstChild("attackTime") then
                        v291.attackTime.Value = 0
                    end
                end
                wait(0.1)
            end
        end)
        spawn(function()
            while _G.FastPunch do
                local v292 = game.Players.LocalPlayer
                v292.muscleEvent:FireServer("punch", "rightHand")
                v292.muscleEvent:FireServer("punch", "leftHand")
                local v293 = v292.Character
                local v294 = v293 and v293:FindFirstChild("Punch")
                if v294 then
                    v294:Activate()
                end
                wait(0)
            end
        end)
    else
        local v295 = game.Players.LocalPlayer.Character:FindFirstChild("Punch")
        if v295 then
            if v295:FindFirstChild("attackTime") then
                v295.attackTime.Value = 0.35
            end
            v295.Parent = game.Players.LocalPlayer.Backpack
        end
        local v296 = game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
        if v296 and v296:FindFirstChild("attackTime") then
            v296.attackTime.Value = 0.35
        end
    end
end)
v286:AddSwitch("Auto Situps", function(p297)
    _G.FastSitups = p297
    if p297 then
        spawn(function()
            while _G.FastSitups do
                local v298 = game.Players.LocalPlayer
                local v299 = v298.Character
                if v299 and not v299:FindFirstChild("Situps") then
                    local v300 = v298.Backpack:FindFirstChild("Situps")
                    if v300 then
                        if v300:FindFirstChild("repTime") then
                            v300.repTime.Value = 0
                        end
                        v299.Humanoid:EquipTool(v300)
                    end
                elseif v299 and v299:FindFirstChild("Situps") then
                    local v301 = v299:FindFirstChild("Situps")
                    if v301:FindFirstChild("repTime") then
                        v301.repTime.Value = 0
                    end
                end
                wait(0.1)
            end
        end)
        spawn(function()
            while _G.FastSitups do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        local v302 = game.Players.LocalPlayer.Character:FindFirstChild("Situps")
        if v302 then
            if v302:FindFirstChild("repTime") then
                v302.repTime.Value = 1
            end
            v302.Parent = game.Players.LocalPlayer.Backpack
        end
        local v303 = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
        if v303 and v303:FindFirstChild("repTime") then
            v303.repTime.Value = 1
        end
    end
end)
v286:AddSwitch("Auto Weight", function(p304)
    _G.FastWeight = p304
    if p304 then
        spawn(function()
            while _G.FastWeight do
                local v305 = game.Players.LocalPlayer
                local v306 = v305.Character
                if v306 and not v306:FindFirstChild("Weight") then
                    local v307 = v305.Backpack:FindFirstChild("Weight")
                    if v307 then
                        if v307:FindFirstChild("repTime") then
                            v307.repTime.Value = 0
                        end
                        v306.Humanoid:EquipTool(v307)
                    end
                elseif v306 and v306:FindFirstChild("Weight") then
                    local v308 = v306:FindFirstChild("Weight")
                    if v308:FindFirstChild("repTime") then
                        v308.repTime.Value = 0
                    end
                end
                wait(0.1)
            end
        end)
        spawn(function()
            while _G.FastWeight do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        local v309 = game.Players.LocalPlayer.Character:FindFirstChild("Weight")
        if v309 then
            if v309:FindFirstChild("repTime") then
                v309.repTime.Value = 1
            end
            v309.Parent = game.Players.LocalPlayer.Backpack
        end
        local v310 = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
        if v310 and v310:FindFirstChild("repTime") then
            v310.repTime.Value = 1
        end
    end
end)
v286:AddSwitch("Auto Pushups", function(p311)
    _G.FastPushups = p311
    if p311 then
        spawn(function()
            while _G.FastPushups do
                local v312 = game.Players.LocalPlayer
                local v313 = v312.Character
                if v313 and not v313:FindFirstChild("Pushups") then
                    local v314 = v312.Backpack:FindFirstChild("Pushups")
                    if v314 then
                        if v314:FindFirstChild("repTime") then
                            v314.repTime.Value = 0
                        end
                        v313.Humanoid:EquipTool(v314)
                    end
                elseif v313 and v313:FindFirstChild("Pushups") then
                    local v315 = v313:FindFirstChild("Pushups")
                    if v315:FindFirstChild("repTime") then
                        v315.repTime.Value = 0
                    end
                end
                wait(0.1)
            end
        end)
        spawn(function()
            while _G.FastPushups do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        local v316 = game.Players.LocalPlayer.Character:FindFirstChild("Pushups")
        if v316 then
            if v316:FindFirstChild("repTime") then
                v316.repTime.Value = 1
            end
            v316.Parent = game.Players.LocalPlayer.Backpack
        end
        local v317 = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
        if v317 and v317:FindFirstChild("repTime") then
            v317.repTime.Value = 1
        end
    end
end)
v286:AddSwitch("Auto Handstands", function(p318)
    _G.FastHandstands = p318
    if p318 then
        spawn(function()
            while _G.FastHandstands do
                local v319 = game.Players.LocalPlayer
                local v320 = v319.Character
                if v320 and not v320:FindFirstChild("Handstands") then
                    local v321 = v319.Backpack:FindFirstChild("Handstands")
                    if v321 then
                        if v321:FindFirstChild("repTime") then
                            v321.repTime.Value = 0
                        end
                        v320.Humanoid:EquipTool(v321)
                    end
                elseif v320 and v320:FindFirstChild("Handstands") then
                    local v322 = v320:FindFirstChild("Handstands")
                    if v322:FindFirstChild("repTime") then
                        v322.repTime.Value = 0
                    end
                end
                wait(0.1)
            end
        end)
        spawn(function()
            while _G.FastHandstands do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        local v323 = game.Players.LocalPlayer.Character:FindFirstChild("Handstands")
        if v323 then
            if v323:FindFirstChild("repTime") then
                v323.repTime.Value = 1
            end
            v323.Parent = game.Players.LocalPlayer.Backpack
        end
        local v324 = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands")
        if v324 and v324:FindFirstChild("repTime") then
            v324.repTime.Value = 1
        end
    end
end)
local v325 = v258:AddFolder("Misc 3")
v325:AddSwitch("No-Clip", function(p326)
    _G.NoClip = p326
    if p326 then
        local vu327 = nil
        vu327 = game:GetService("RunService").Stepped:Connect(function()
            if _G.NoClip then
                local v328, v329, v330 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
                while true do
                    local v331
                    v330, v331 = v328(v329, v330)
                    if v330 == nil then
                        break
                    end
                    if v331:IsA("BasePart") and v331.CanCollide then
                        v331.CanCollide = false
                    end
                end
            else
                vu327:Disconnect()
            end
        end)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "No-Clip Activado",
            Text = "Ahora puedes atravesar objetos",
            Duration = 0
        })
    end
end)
v325:AddSwitch("Jumpy Infinite", function(p332)
    _G.InfiniteJump = p332
    if p332 then
        local vu333 = nil
        vu333 = game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            else
                vu333:Disconnect()
            end
        end)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Salto Infinito Activado",
            Text = "Ahora puedes saltar sin l\195\173mites",
            Duration = 0
        })
    end
end)
local v336 = v325:AddDropdown("Change Time", function(p334)
    local v335 = game:GetService("Lighting")
    if p334 == "Noche" then
        v335.ClockTime = 0
    elseif p334 == "D\195\173a" then
        v335.ClockTime = 12
    elseif p334 == "Mediod\195\173a" then
        v335.ClockTime = 6
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hora Cambiada",
        Text = "La hora del d\195\173a ha sido cambiada a: " .. p334,
        Duration = 0
    })
end)
v336:Add("Night")
v336:Add("Day")
v336:Add("Midnight")
local v337 = v258:AddFolder("Premium Farm")
local function vu347()
    local v338 = vu2.petsFolder
    local v339, v340, v341 = pairs(v338:GetChildren())
    while true do
        local v342
        v341, v342 = v339(v340, v341)
        if v341 == nil then
            break
        end
        if v342:IsA("Folder") then
            local v343, v344, v345 = pairs(v342:GetChildren())
            while true do
                local v346
                v345, v346 = v343(v344, v345)
                if v345 == nil then
                    break
                end
                vu247.rEvents.equipPetEvent:FireServer("unequipPet", v346)
            end
        end
    end
    task.wait(0.1)
end
local function vu353(p348)
    vu347()
    task.wait(0.01)
    local v349, v350, v351 = pairs(vu2.petsFolder.Unique:GetChildren())
    while true do
        local v352
        v351, v352 = v349(v350, v351)
        if v351 == nil then
            break
        end
        if v352.Name == p348 then
            vu247.rEvents.equipPetEvent:FireServer("equipPet", v352)
        end
    end
end
local function vu360(p354)
    local v355 = workspace.machinesFolder:FindFirstChild(p354)
    if not v355 then
        local v356, v357, v358 = pairs(workspace:GetChildren())
        while true do
            local v359
            v358, v359 = v356(v357, v358)
            if v358 == nil then
                break
            end
            if v359:IsA("Folder") and v359.Name:find("machines") then
                v355 = v359:FindFirstChild(p354)
                if v355 then
                    break
                end
            end
        end
    end
    return v355
end
local function vu362()
    local v361 = game:GetService("VirtualInputManager")
    v361:SendKeyEvent(true, "E", false, game)
    task.wait(0.1)
    v361:SendKeyEvent(false, "E", false, game)
end
v337:AddLabel("OP Rebirth Farm ")
v337:AddTextBox("Target Rebirth (Doesn\'t work, I Won\'t make it work)", function(p363)
    targetRebirth = tonumber(p363) or math.huge
end)
local vu364 = nil
local function vu366(pu365)
    if vu364 then
        vu364:Disconnect()
    end
    vu364 = game:GetService("RunService").Heartbeat:Connect(function()
        if vu2.Character and vu2.Character:FindFirstChild("HumanoidRootPart") then
            vu2.Character.HumanoidRootPart.CFrame = pu365
        end
    end)
end
local function vu367()
    if vu364 then
        vu364:Disconnect()
        vu364 = nil
    end
end
v337:AddSwitch("Lock Position", function(p368)
    if p368 then
        if vu2.Character and vu2.Character:FindFirstChild("HumanoidRootPart") then
            vu366(vu2.Character.HumanoidRootPart.CFrame)
        end
    else
        vu367()
    end
end)
v337:AddSwitch("Rebirth Farm", function(p369)
    isRunning = p369
    task.spawn(function()
        while isRunning do
            local v370 = 10000 + 5000 * vu2.leaderstats.Rebirths.Value
            if vu2.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                local v371 = vu2.ultimatesFolder["Golden Rebirth"].Value
                v370 = math.floor(v370 * (1 - v371 * 0.1))
            end
            vu347()
            task.wait(0.1)
            vu353("Swift Samurai")
            while isRunning and vu2.leaderstats.Strength.Value < v370 do
                for _ = 1, 10 do
                    vu2.muscleEvent:FireServer("rep")
                end
                task.wait()
            end
            vu347()
            task.wait(0.1)
            vu353("Tribal Overlord")
            local v372 = vu360("Jungle Bar Lift")
            if v372 and v372:FindFirstChild("interactSeat") then
                vu2.Character.HumanoidRootPart.CFrame = v372.interactSeat.CFrame * CFrame.new(0, 3, 0)
                repeat
                    task.wait(0.1)
                    vu362()
                until vu2.Character.Humanoid.Sit
            end
            local v373 = vu2.leaderstats.Rebirths.Value
            repeat
                vu247.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                task.wait(0.1)
            until v373 < vu2.leaderstats.Rebirths.Value
            if not isRunning then
                break
            end
            task.wait()
        end
    end)
end)
v337:AddSwitch("Hide Frames", function(p374)
    local v375 = game:GetService("ReplicatedStorage")
    local v376, v377, v378 = pairs(v375:GetChildren())
    while true do
        local v379
        v378, v379 = v376(v377, v378)
        if v378 == nil then
            break
        end
        if v379.Name:match("Frame$") then
            v379.Visible = not p374
        end
    end
end)
v337:AddSwitch("Fast Strength", function(p380)
    local vu381 = p380
    if p380 then
        vu353("Swift Samurai")
        for _ = 1, 14 do
            task.spawn(function()
                while vu381 do
                    vu2.muscleEvent:FireServer("rep")
                    task.wait()
                end
            end)
        end
    else
        vu347()
    end
end)
local v382 = v3:AddTab("Killer")
_G.whitelistedPlayers = _G.whitelistedPlayers or {}
_G.targetPlayer = _G.targetPlayer or ""
local function vu383()
    if not game.Players.LocalPlayer.Character then
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character
    end
    return game.Players.LocalPlayer.Character
end
local function vu388()
    local v384, v385, v386 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v387
        v386, v387 = v384(v385, v386)
        if v386 == nil then
            break
        end
        if v387.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v387)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
local function vu391(p389)
    local v390 = vu383()
    if v390 and p389.Character and (p389.Character:FindFirstChild("HumanoidRootPart") and v390:FindFirstChild("LeftHand")) then
        firetouchinterest(p389.Character.HumanoidRootPart, v390.LeftHand, 0)
        firetouchinterest(p389.Character.HumanoidRootPart, v390.LeftHand, 1)
        vu388()
    end
end
local function vu407(p392)
    if p392 and p392 ~= "" then
        local v393 = p392:lower()
        local v394, v395, v396 = pairs(game.Players:GetPlayers())
        local v397 = 0
        local v398 = nil
        while true do
            local v399
            v396, v399 = v394(v395, v396)
            if v396 == nil then
                break
            end
            if v399 ~= game.Players.LocalPlayer then
                local v400 = v399.Name:lower()
                local v401 = v399.DisplayName:lower()
                local v402 = v400:find(v393, 1, true) ~= nil
                local v403 = v401:find(v393, 1, true) ~= nil
                local v404 = 0
                local v405
                if v402 then
                    v405 = # v393 / # v400 * 100
                    if v400:sub(1, # v393) == v393 then
                        v405 = v405 + 50
                    end
                else
                    v405 = 0
                end
                if v403 then
                    v404 = # v393 / # v401 * 100
                    if v401:sub(1, # v393) == v393 then
                        v404 = v404 + 50
                    end
                end
                local v406 = math.max(v405, v404)
                if v397 < v406 then
                    v398 = v399
                    v397 = v406
                end
            end
        end
        if v397 > 20 then
            return v398
        else
            return nil
        end
    else
        return nil
    end
end
local vu408 = v382:AddLabel("Whitelisted Players: None")
local vu409 = v382:AddLabel("Target Player: None")
local function vu415()
    if # _G.whitelistedPlayers ~= 0 then
        local v410, v411, v412 = ipairs(_G.whitelistedPlayers)
        local v413 = "Players on the White List: "
        while true do
            local v414
            v412, v414 = v410(v411, v412)
            if v412 == nil then
                break
            end
            if v412 > 1 then
                v413 = v413 .. ", "
            end
            v413 = v413 .. v414
        end
        vu408.Text = v413
    else
        vu408.Text = "Whitelisted Players: None"
    end
end
local function vu416()
    if _G.targetPlayer ~= "" then
        vu409.Text = "Jugador Objetivo: " .. _G.targetPlayer
    else
        vu409.Text = "Jugador Objetivo: Ninguno"
    end
end
v382:AddSwitch("Add Friends to Whitelist Automatically", function(p417)
    _G.autoWhitelistFriends = p417
    if p417 then
        local v418, v419, v420 = pairs(game.Players:GetPlayers())
        while true do
            local v421
            v420, v421 = v418(v419, v420)
            if v420 == nil then
                break
            end
            if v421:IsFriendsWith(game.Players.LocalPlayer.UserId) then
                local v422 = v421.Name .. " (" .. v421.DisplayName .. ")"
                if not table.find(_G.whitelistedPlayers, v422) then
                    table.insert(_G.whitelistedPlayers, v422)
                end
            end
        end
        vu415()
    end
end)
game.Players.PlayerAdded:Connect(function(p423)
    if _G.autoWhitelistFriends and p423:IsFriendsWith(game.Players.LocalPlayer.UserId) then
        local v424 = p423.Name .. " (" .. p423.DisplayName .. ")"
        if not table.find(_G.whitelistedPlayers, v424) then
            table.insert(_G.whitelistedPlayers, v424)
            vu415()
        end
    end
end)
v382:AddTextBox("Add Player to Whitelist (Name/Nickname)", function(p425)
    local v426 = p425 and (p425 ~= "" and vu407(p425))
    if v426 then
        local v427 = v426.Name .. " (" .. v426.DisplayName .. ")"
        local v428, v429, v430 = ipairs(_G.whitelistedPlayers)
        local v431 = false
        while true do
            local v432
            v430, v432 = v428(v429, v430)
            if v430 == nil then
                break
            end
            if v432:find(v426.Name, 1, true) then
                v431 = true
                break
            end
        end
        if not v431 then
            table.insert(_G.whitelistedPlayers, v427)
            vu415()
        end
    end
end)
v382:AddTextBox("Remove Player from Whitelist (Name/Nickname)", function(p433)
    if p433 and p433 ~= "" then
        local v434 = p433:lower()
        local v435, v436, v437 = ipairs(_G.whitelistedPlayers)
        while true do
            local v438
            v437, v438 = v435(v436, v437)
            if v437 == nil then
                break
            end
            if v438:lower():find(v434, 1, true) then
                table.remove(_G.whitelistedPlayers, v437)
                vu415()
                return
            end
        end
        local v439 = vu407(p433)
        if v439 then
            local v440, v441, v442 = ipairs(_G.whitelistedPlayers)
            while true do
                local v443
                v442, v443 = v440(v441, v442)
                if v442 == nil then
                    break
                end
                if v443:find(v439.Name, 1, true) then
                    table.remove(_G.whitelistedPlayers, v442)
                    vu415()
                    break
                end
            end
        end
    end
end)
v382:AddButton("Clear WhiteList", function()
    _G.whitelistedPlayers = {}
    vu415()
end)
v382:AddSwitch("Automatically Remove Everyone (Except Whitelist)", function(p444)
    _G.autoKillAll = p444
    if p444 then
        spawn(function()
            while _G.autoKillAll do
                local vu445 = false
                local function v446()
                    vu445 = true
                end
                local v447 = game:GetService("Players"):GetPlayers()
                if # v447 > 1 then
                    local v448, v449, v450 = ipairs(v447)
                    while true do
                        local v451
                        v450, v451 = v448(v449, v450)
                        if v450 == nil or (v451 == game.Players.LocalPlayer or not _G.autoKillAll) then
                            break
                        end
                        local v452, v453, v454 = ipairs(_G.whitelistedPlayers)
                        local v455 = false
                        while true do
                            local v456
                            v454, v456 = v452(v453, v454)
                            if v454 == nil then
                                break
                            end
                            if v456:find(v451.Name, 1, true) then
                                v446()
                                v455 = true
                            end
                        end
                        if not v455 then
                            vu391(v451)
                            task.wait(0.05)
                        end
                    end
                    task.wait(0.5)
                else
                    task.wait(1)
                end
                if vu445 then
                    break
                end
            end
        end)
    end
end)
v382:AddTextBox("Select Target Player (Name/Nickname)", function(p457)
    local v458 = p457 and (p457 ~= "" and vu407(p457))
    if v458 then
        _G.targetPlayer = v458.Name .. " (" .. v458.DisplayName .. ")"
        vu416()
    end
end)
v382:AddButton("Remove Target", function()
    _G.targetPlayer = ""
    vu416()
end)
v382:AddSwitch("Delete Target Automatically", function(p459)
    _G.autoKillTarget = p459
    if p459 and _G.targetPlayer ~= "" then
        spawn(function()
            while _G.autoKillTarget and _G.targetPlayer ~= "" do
                local v460 = _G.targetPlayer:match("^([^%(]+)")
                if v460 then
                    local v461 = v460:gsub("%s+$", "")
                    local v462 = game.Players:FindFirstChild(v461)
                    if v462 then
                        vu391(v462)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)
v382:AddButton("Remove Everyone (Except Whitelist)", function()
    local v463, v464, v465 = ipairs(game:GetService("Players"):GetPlayers())
    while true do
        local v466
        v465, v466 = v463(v464, v465)
        if v465 == nil then
            return
        end
        if v466 ~= game.Players.LocalPlayer then
            local v467, v468, v469 = ipairs(_G.whitelistedPlayers)
            local v470 = false
            while true do
                local v471
                v469, v471 = v467(v468, v469)
                if v469 == nil then
                    break
                end
                if v471:find(v466.Name, 1, true) then
                    v470 = true
                    break
                end
            end
            if not v470 then
                vu391(v466)
            end
        end
    end
end)
v382:AddButton("Delete Target", function()
    local v472 = _G.targetPlayer ~= "" and _G.targetPlayer:match("^([^%(]+)")
    if v472 then
        local v473 = v472:gsub("%s+$", "")
        local v474 = game.Players:FindFirstChild(v473)
        if v474 then
            vu391(v474)
        end
    end
end)
local v475 = v3:AddTab("Teleport")
v475:AddButton("Spawn", function()
    local v476 = game.Players.LocalPlayer;
    (v476.Character or v476.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2, 8, 115)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teleport",
        Text = "Teleported To Spawn",
        Duration = 0
    })
end)
v475:AddButton("Secret Area", function()
    local v477 = game.Players.LocalPlayer;
    (v477.Character or v477.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(1947, 2, 6191)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Secret",
        Text = "Teleported to Secret Area",
        Duration = 0
    })
end)
v475:AddButton("Tiny Island", function()
    local v478 = game.Players.LocalPlayer;
    (v478.Character or v478.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(- 34, 7, 1903)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Tiny",
        Text = "Teleported To Tiny",
        Duration = 0
    })
end)
v475:AddButton("Frozen", function()
    local v479 = game.Players.LocalPlayer;
    (v479.Character or v479.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(- 2600.00244, 3.67686558, - 403.884369, 0.0873617008, 1.0482899e-9, 0.99617666, 3.07204253e-8, 1, - 3.7464023e-9, - 0.99617666, 3.09302628e-8, 0.0873617008)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Frozen",
        Text = "Teleported To Frozen  ",
        Duration = 0
    })
end)
v475:AddButton("Mythical", function()
    local v480 = game.Players.LocalPlayer;
    (v480.Character or v480.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2255, 7, 1071)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Mythical",
        Text = "Teleported To Mythical",
        Duration = 0
    })
end)
v475:AddButton("Inferno", function()
    local v481 = game.Players.LocalPlayer;
    (v481.Character or v481.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(- 6768, 7, - 1287)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Inferno",
        Text = "Teleported To Infierno",
        Duration = 0
    })
end)
v475:AddButton("Legend", function()
    local v482 = game.Players.LocalPlayer;
    (v482.Character or v482.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4604, 991, - 3887)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Legends",
        Text = "Teleported To Legends",
        Duration = 0
    })
end)
v475:AddButton("Muscle King Gym", function()
    local v483 = game.Players.LocalPlayer;
    (v483.Character or v483.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(- 8646, 17, - 5738)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "King",
        Text = "Teleported To King",
        Duration = 0
    })
end)
v475:AddButton("Jungle", function()
    local v484 = game.Players.LocalPlayer;
    (v484.Character or v484.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(- 8659, 6, 2384)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Jungel",
        Text = "Teleported To Jungel",
        Duration = 0
    })
end)
v475:AddButton("Brawl Lava", function()
    local v485 = game.Players.LocalPlayer;
    (v485.Character or v485.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4471, 119, - 8836)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Lava Brawl",
        Text = "Teleported To Brawl Lava",
        Duration = 0
    })
end)
v475:AddButton("Brawl Desert", function()
    local v486 = game.Players.LocalPlayer;
    (v486.Character or v486.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(960, 17, - 7398)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Dessert Brawl",
        Text = "Teleported To Brawl Desert",
        Duration = 0
    })
end)
v475:AddButton("Brawl Regular", function()
    local v487 = game.Players.LocalPlayer;
    (v487.Character or v487.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(- 1849, 20, - 6335)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Beach Brawl",
        Text = "Teleported To Brawl Beach",
        Duration = 0
    })
end)