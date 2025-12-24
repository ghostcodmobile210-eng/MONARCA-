-- ts file was generated at discord.gg/25ms


task.spawn(function()
    hookfunction(print, function(p1)
        if string.find(p1:lower(), "http") then
            while true do
            end
        else
            return
        end
    end)
    hookfunction(warn, function(p2)
        if string.find(p2:lower(), "http") then
            while true do
            end
        else
            return
        end
    end)
    hookfunction(error, function(p3)
        if string.find(p3:lower(), "http") then
            while true do
            end
        else
            return
        end
    end)
    hookfunction(writefile, function(_, p4)
        if string.find(p4:lower(), "http") or (string.find(p4:lower(), "//") or string.find(p4:lower(), "https://discord.com/api/webhooks/")) then
            while true do
            end
        else
            return
        end
    end)
    hookfunction(appendfile, function(_, p5)
        if string.find(p5:lower(), "http") or (string.find(p5:lower(), "//") or string.find(p5:lower(), "https://discord.com/api/webhooks/")) then
            while true do
            end
        else
            return
        end
    end)
    game.DescendantAdded:Connect(function(p6)
        if p6 and (p6:IsA("TextLabel") or (p6:IsA("TextButton") or p6:IsA("Message"))) then
            if string.find(p6.Text:lower(), "http") then
                while true do
                end
            end
            p6:Destroy()
        end
    end)
    getgenv().rconsoletitle = nil
    getgenv().rconsoleprint = nil
    getgenv().rconsolewarn = nil
    getgenv().rconsoleinfo = nil
    getgenv().rconsolerr = nil
    getgenv().clonefunction = function()
        while true do
        end
    end
    game.CoreGui.ChildAdded:Connect(function(p7)
        if p7.Name:lower() == "devconsolemaster" then
            while true do
            end
        else
            p7:Destroy()
            return
        end
    end)
    local vu8 = nil
    vu8 = hookmetamethod(game, "__namecall", newcclosure(function(p9, ...)
        local v10 = getnamecallmethod():lower()
        if v10 == "rconsoleprint" or (v10 == "rconsoleinfo" or (v10 == "rconsolewarn" or v10 == "rconsolerr")) then
            while true do
            end
        else
            return vu8(p9, ...)
        end
    end))
end)
local v11 = Vector3.new(20, 5, 20)
local v12 = 3
local v13 = 3
local v14 = 0
for v15 = - v12, v12 do
    local v16 = v15
    for v17 = - v13, v13 do
        local v18 = Instance.new("Part")
        v18.Parent = game.Workspace
        v18.Anchored = true
        v18.Position = Vector3.new(v16 * (v11.X + v14), 2500, v17 * (v11.Z + v14))
        v18.Size = v11
        v18.Transparency = 0
    end
end
local v19 = loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/library/refs/heads/main/Uilibrary", true))():AddWindow("Doca V1 Crack Version", {
    main_color = Color3.fromRGB(95, 85, 65),
    min_size = Vector2.new(300, 440),
    can_resize = false
})
local v20 = v19:AddTab("Main")
local v21 = v20:AddFolder(" Misc")
v21:AddButton("Auto Weight (Equip any tool)", function()
    _G.autogen = true
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Weight"))
    repeat
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "rep"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "groundSlam"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "stomp"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "rightHand"
        }))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "leftHand"
        }))
        game:GetService("RunService").RenderStepped:Wait()
    until not _G.autogen
    _G.autogen = false
end)
v21:AddButton("Claim All Chest V2", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").mythicalChest.circleInner, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").mythicalChest.circleInner, 1)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").magmaChest.circleInner, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").magmaChest.circleInner, 1)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").groupRewardsCircle.circleInner, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").groupRewardsCircle.circleInner, 1)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").goldenChest.circleInner, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").goldenChest.circleInner, 1)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").enchantedChest.circleInner, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").enchantedChest.circleInner, 1)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").legendsChest.circleInner, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").legendsChest.circleInner, 1)
end)
v21:AddLabel("---Script Hub---")
v21:AddButton("Permanent ShiftLock", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie", true))()
end)
v21:AddLabel("---Time---")
v21:AddButton("Night", function()
    game.Lighting.ClockTime = 5
end)
v21:AddButton("Morning", function()
    game.Lighting.ClockTime = 7
end)
v21:AddButton("Day", function()
    game.Lighting.ClockTime = 8
end)
v20:AddLabel("----Farming----")
local v22 = v20:AddFolder(" Auto Brawl")
v22:AddSwitch("Auto Join Brawl (For Farming)", function(p23)
    if p23 then
        _G.autobrawl = true
        game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer(unpack({
            "joinBrawl"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        if not _G.autobrawl then
        end
    end
    _G.autobrawl = false
	
end)
v22:AddSwitch("Auto Join Brawl (God Mode)", function(p24)
    godModeToggle = p24
    if godModeToggle then
        spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("brawlEvent"):FireServer(unpack({
                    "joinBrawl"
                }))
                wait()
            end
        end)
    end
end)
v22:AddSwitch("Invisible Join Brawl", function(p25)
    if p25 then
        _G.runAutoJoinBrawl = true
        _G.runBlockTeleport = true
        local v26 = coroutine.create(function()
            while _G.runAutoJoinBrawl do
                game.ReplicatedStorage.rEvents.brawlEvent:FireServer("joinBrawl")
                wait(0.1)
            end
        end)
        local v34 = coroutine.create(function()
            local vu27 = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            local vu28 = vu27.Position
            game:GetService("RunService").Stepped:Connect(function()
                if _G.runBlockTeleport then
                    local v29 = vu27.Position
                    local v30, v31, v32 = pairs(workspace:GetDescendants())
                    while true do
                        local v33
                        v32, v33 = v30(v31, v32)
                        if v32 == nil then
                            break
                        end
                        if v33:IsA("BasePart") and (v33.Name == "teleportPart" and (v29 - v33.Position).magnitude < 10) then
                            vu27.CFrame = CFrame.new(vu28)
                            return
                        end
                    end
                    vu28 = v29
                end
            end)
        end)
        coroutine.resume(v26)
        coroutine.resume(v34)
    else
        _G.runAutoJoinBrawl = false
        _G.runBlockTeleport = false
    end
end)
local v35 = v20:AddFolder(" Auto Gym")
v35:AddLabel("King Gym")
v35:AddSwitch("Auto Muscle King Lift", function(p36)
    if p36 then
        _G.automlking = true
        while true do
            local v37 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Muscle King Lift").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v37))
            local v38 = game.Players.LocalPlayer.Character
            local v39 = Vector3.new(- 8773, 17, - 5669)
            if v38 then
                v38.HumanoidRootPart.CFrame = CFrame.new(v39)
            end
            wait()
            local v40 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Muscle King Lift").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v40))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.automlking then
            end
        end
    else
        _G.automlking = false
        return
    end
end)
v35:AddSwitch("Auto Muscle King Bench", function(p41)
    if p41 then
        _G.automlking = true
        while true do
            local v42 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Muscle King Bench").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v42))
            local v43 = game.Players.LocalPlayer.Character
            local v44 = Vector3.new(- 8593.6884765625, 22.231548309326172, - 6061.2900390625)
            if v43 then
                v43.HumanoidRootPart.CFrame = CFrame.new(v44)
            end
            wait()
            local v45 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Muscle King Bench").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v45))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.automlking then
            end
        end
    else
        _G.automlking = false
        return
    end
end)
v35:AddSwitch("Auto Muscle King Squat", function(p46)
    if p46 then
        _G.automlking = true
        while true do
            local v47 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Muscle King Squat").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v47))
            local v48 = game.Players.LocalPlayer.Character
            local v49 = Vector3.new(- 8752, 24, - 6051)
            if v48 then
                v48.HumanoidRootPart.CFrame = CFrame.new(v49)
            end
            wait()
            local v50 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Muscle King Squat").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v50))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.automlking then
            end
        end
    else
        _G.automlking = false
        return
    end
end)
v35:AddSwitch("Auto Muscle King Boulder", function(p51)
    if p51 then
        _G.automlking = true
        while true do
            local v52 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("King Boulder").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v52))
            local v53 = game.Players.LocalPlayer.Character
            local v54 = Vector3.new(- 8944, 24, - 5684)
            if v53 then
                v53.HumanoidRootPart.CFrame = CFrame.new(v54)
            end
            wait()
            local v55 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("King Boulder").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v55))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.automlking then
            end
        end
    else
        _G.automlking = false
        return
    end
end)
v35:AddLabel("Legends Gym")
v35:AddSwitch("Auto Legends Press", function(p56)
    if p56 then
        _G.autolegends = true
        while true do
            local v57 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Legends Press").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v57))
            local v58 = game.Players.LocalPlayer.Character
            local v59 = Vector3.new(4097.8427734375, 996.5140380859375, - 3787.60791015625)
            if v58 then
                v58.HumanoidRootPart.CFrame = CFrame.new(v59)
            end
            wait()
            local v60 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Legends Press").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v60))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.autolegends then
            end
        end
    else
        _G.autolegends = false
        return
    end
end)
v35:AddSwitch("Auto Legends Throw", function(p61)
    if p61 then
        _G.autolegends = true
        local v62 = {
            "useMachine",
            workspace.machinesFolder:FindFirstChild("Legends Throw").interactSeat
        }
        game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v62))
        local v63 = game.Players.LocalPlayer.Character
        local v64 = Vector3.new(4196.248046875, 991.5355224609375, - 3905.087158203125)
        if v63 then
            v63.HumanoidRootPart.CFrame = CFrame.new(v64)
        end
        wait()
        local v65 = {
            "rep",
            workspace.machinesFolder:FindFirstChild("Legends Throw").interactSeat
        }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v65))
        game:GetService("RunService").RenderStepped:Wait()
        if not _G.autolegends then
        end
    end
    _G.autolegends = false
	
end)
v35:AddSwitch("Auto Legends Pullup", function(p66)
    if p66 then
        _G.autolegends = true
        while true do
            local v67 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Legends Pullup").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v67))
            local v68 = game.Players.LocalPlayer.Character
            local v69 = Vector3.new(4308, 998, - 4121)
            if v68 then
                v68.HumanoidRootPart.CFrame = CFrame.new(v69)
            end
            wait()
            local v70 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Legends Pullup").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v70))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.autolegends then
            end
        end
    else
        _G.autolegends = false
        return
    end
end)
v35:AddSwitch("Auto Legends Squat", function(p71)
    if p71 then
        _G.autolegends = true
        while true do
            local v72 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Legends Squat").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v72))
            local v73 = game.Players.LocalPlayer.Character
            local v74 = Vector3.new(4446, 998, - 4069)
            if v73 then
                v73.HumanoidRootPart.CFrame = CFrame.new(v74)
            end
            wait()
            local v75 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Legends Squat").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v75))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.autolegends then
            end
        end
    else
        _G.autolegends = false
        return
    end
end)
v35:AddSwitch("Auto Legends Lift", function(p76)
    if p76 then
        _G.autolegends = true
        while true do
            local v77 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Legends Lift").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v77))
            local v78 = game.Players.LocalPlayer.Character
            local v79 = Vector3.new(4527.3583984375, 991.4735717773438, - 4001.750732421875)
            if v78 then
                v78.HumanoidRootPart.CFrame = CFrame.new(v79)
            end
            wait()
            local v80 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Legends Lift").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v80))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.autolegends then
            end
        end
    else
        _G.autolegends = false
        return
    end
end)
local v81 = v20:AddFolder("Op stuff (for farm)")
local vu82 = game:GetService("Players")
game:GetService("RunService")
local vu83 = vu82.LocalPlayer
local vu84 = nil
local vu85 = {}
local function vu91()
    local v86 = vu83.Character
    if v86 then
        local vu87 = v86:WaitForChild("Humanoid")
        local vu88 = v86:WaitForChild("HumanoidRootPart")
        vu84 = Instance.new("BodyVelocity")
        vu84.Velocity = Vector3.new(0, 0, 0)
        vu84.MaxForce = Vector3.new(100000, 0, 100000)
        vu84.Parent = vu88
        local v89 = vu88
        table.insert(vu85, vu88.GetPropertyChangedSignal(v89, "Velocity"):Connect(function()
            if _G.antiKnockback then
                vu88.Velocity = Vector3.new(0, vu88.Velocity.Y, 0)
            end
        end))
        local v90 = vu87
        table.insert(vu85, vu87.GetPropertyChangedSignal(v90, "PlatformStand"):Connect(function()
            if _G.antiKnockback and vu87.PlatformStand then
                vu87.PlatformStand = false
            end
        end))
    end
end
local function vu96()
    if vu84 then
        vu84:Destroy()
        vu84 = nil
    end
    local v92, v93, v94 = ipairs(vu85)
    while true do
        local v95
        v94, v95 = v92(v93, v94)
        if v94 == nil then
            break
        end
        v95:Disconnect()
    end
    vu85 = {}
end
local function v97(_)
    if _G.antiKnockback then
        vu91()
    end
end
if vu83.Character then
    v97(vu83.Character)
end
vu83.CharacterAdded:Connect(v97)
v81:AddSwitch("Anti Knockback", function(p98)
    _G.antiKnockback = p98
    if p98 then
        vu91()
    else
        vu96()
    end
end)
_G.antiKnockback = _G.antiKnockback or false
local vu99 = nil
local vu100 = nil
function gettool()
    local v101, v102, v103 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v104
        v103, v104 = v101(v102, v103)
        if v103 == nil then
            break
        end
        if v104.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v104)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
v81:AddSwitch("Auto Glitch (5M)", function(p105)
    getgenv().farmrock = p105
    while getgenv().farmrock do
        wait()
        if getgenv().farmrock and game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
            local v106, v107, v108 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
            while true do
                local v109
                v108, v109 = v106(v107, v108)
                if v108 == nil then
                    break
                end
                if v109.Name == "neededDurability" and v109.Value == 5000000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                    firetouchinterest(v109.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v109.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v109.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v109.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
    if not getgenv().farmrock and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end
end)
function gettool()
    local v110, v111, v112 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v113
        v112, v113 = v110(v111, v112)
        if v112 == nil then
            break
        end
        if v113.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v113)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
v81:AddSwitch("Auto Glitch (1M)", function(p114)
    getgenv().farmrock = p114
    while getgenv().farmrock do
        wait()
        if getgenv().farmrock and game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
            local v115, v116, v117 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
            while true do
                local v118
                v117, v118 = v115(v116, v117)
                if v117 == nil then
                    break
                end
                if v118.Name == "neededDurability" and v118.Value == 1000000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                    firetouchinterest(v118.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v118.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v118.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v118.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
    if not getgenv().farmrock and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end
end)
v81:AddSwitch("Auto Pushups with Rock (5M) and Auto Punch", function(p119)
    if p119 then
        _G.Pushups = true
        repeat
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups"))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "rep"
            }))
            game:GetService("RunService").RenderStepped:Wait()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "rightHand"
            }))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "leftHand"
            }))
            game:GetService("RunService").RenderStepped:Wait()
            firetouchinterest(game.workspace.machinesFolder["Muscle King Mountain"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
            wait(0.0001)
            firetouchinterest(game.workspace.machinesFolder["Muscle King Mountain"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        until not _G.Pushups
    else
        _G.Pushups = false
    end
end)
v81:AddButton("Remove Ad Portal", function()
    game.Workspace.GameTeleportPortals:Destroy()
    game.Workspace.RobloxAdBoards:Destroy()
    game.Workspace.RobloxForwardPortals:Destroy()
end)
v81:AddButton("Walk on Water", function()
    local v120 = Vector3.new(2048, 0, 2048)
    local v121 = 20
    local v122 = 20
    local v123 = 0
    for v124 = - v121, v121 do
        local v125 = v124
        for v126 = - v122, v122 do
            local v127 = Instance.new("Part")
            v127.Parent = game.Workspace
            v127.Anchored = true
            v127.Position = Vector3.new(v125 * (v120.X + v123), - 9, v126 * (v120.Z + v123))
            v127.Size = v120
            v127.Transparency = 0
        end
    end
end)
local v128 = v19:AddTab("Killing")
local vu129 = false
v128:AddSwitch("Auto Equip Punch", function(p130)
    vu129 = p130
    if vu129 then
        coroutine.wrap(function()
            while vu129 do
                local v131 = game.Players.LocalPlayer
                local v132 = v131.Backpack:FindFirstChild("Punch") or v131.Character:FindFirstChild("Punch")
                if v132 and v132.Parent == v131.Backpack then
                    v132.Parent = v131.Character
                end
                task.wait()
            end
        end)()
    end
end)
v128:AddSwitch("Auto Punch {With Movement}", function(p133)
    if p133 then
        local v134 = game.Players.LocalPlayer
        local v135 = v134.Name
        local v136 = v134.Backpack:FindFirstChild("Punch") or game.Workspace:FindFirstChild(v135):FindFirstChild("Punch")
        _G.punchanim = true
        while _G.punchanim do
            if v136 then
                if v136.Parent ~= game.Workspace:FindFirstChild(v135) then
                    v136.Parent = game.Workspace:FindFirstChild(v135)
                end
                v136:Activate()
                wait()
            else
                warn("Punch tool not found")
                _G.punchanim = false
            end
        end
    else
        _G.punchanim = false
    end
end)
v128:AddSwitch("Auto Punch", function(p137)
    if p137 then
        _G.autopunch = true
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "rightHand"
        }))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "leftHand"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        if not _G.autopunch then
        end
    end
    _G.autopunch = false
	
end)
v128:AddSwitch("Fast Punch", function(p138)
    if p138 then
        local v139 = game.Players.LocalPlayer
        local v140 = v139.Backpack:FindFirstChild("Punch")
        local v141 = game.Workspace:FindFirstChild(v139.Name)
        local v142
        if v141 then
            v142 = v141:FindFirstChild("Punch")
        else
            v142 = nil
        end
        if v140 and v140:FindFirstChild("attackTime") then
            v140.attackTime.Value = 0
        elseif v142 and v142:FindFirstChild("attackTime") then
            v142.attackTime.Value = 0
        end
    else
        local v143 = game.Players.LocalPlayer
        local v144 = v143.Backpack:FindFirstChild("Punch")
        local v145 = game.Workspace:FindFirstChild(v143.Name)
        local v146
        if v145 then
            v146 = v145:FindFirstChild("Punch")
        else
            v146 = nil
        end
        if v144 and v144:FindFirstChild("attackTime") then
            v144.attackTime.Value = 0.35
        elseif v146 and v146:FindFirstChild("attackTime") then
            v146.attackTime.Value = 0.35
        end
    end
end)
v128:AddSwitch("Safe Zone TP", function(p147)
    if p147 then
        _G.SafeZone = true
        local v148 = game.Players.LocalPlayer.Character
        local v149 = Vector3.new(- 3, 2510, 0)
        if v148 then
            v148.HumanoidRootPart.CFrame = CFrame.new(v149)
        end
        wait(0.001)
        if not _G.SafeZone then
        end
    end
    _G.SafeZone = false
	
end)
local function vu156(p150, p151)
    local v152, v153, v154 = ipairs(p151)
    while true do
        local v155
        v154, v155 = v152(v153, v154)
        if v154 == nil then
            break
        end
        if p150.Name == v155 then
            return true
        end
    end
    return false
end
local vu157 = {}
v128:AddTextBox("Whitelist Player", function(p158)
    table.insert(vu157, p158)
end)
v128:AddTextBox("UnWhitelist Player", function(p159)
    if vu82:FindFirstChild(p159) then
        vu157 = {}
    end
end)
v128:AddButton("Clear Whitelist", function()
    vu157 = {}
end)
local function vu164(p160)
    local v161 = p160.Character
    if v161 and not vu156(p160, vu157) then
        local vu162 = v161:FindFirstChild("Head")
        local vu163 = game.Players.LocalPlayer
        if vu163 then
            vu163 = vu163.Character:FindFirstChild("LeftHand")
        end
        if vu162 and vu163 then
            pcall(function()
                firetouchinterest(vu162, vu163, 0)
                wait(0.01)
                firetouchinterest(vu162, vu163, 1)
            end)
        end
    end
end
v128:AddSwitch("Auto Kill", function(p165)
    if p165 then
        _G.autokill = true
        repeat
            local vu166 = game:GetService("Players")
            local vu167 = false
            local function vu173()
                while vu167 and _G.autokill do
                    local v168 = vu166
                    local v169, v170, v171 = ipairs(v168:GetPlayers())
                    while true do
                        local v172
                        v171, v172 = v169(v170, v171)
                        if v171 == nil then
                            break
                        end
                        if v172 ~= vu166.LocalPlayer then
                            vu164(v172)
                        end
                    end
                    wait(0.1)
                end
            end;
            (function()
                vu167 = true
                vu173()
            end)()
        until not _G.autokill
    else
        _G.autokill = false
    end
end)
local vu174 = {}
local _ = game:GetService("RunService")
local vu175 = game:GetService("Players")
local _ = false
local _ = nil
local _ = nil
local function vu180(p176)
    if p176 and p176.Character then
        local v177 = p176.Character:FindFirstChild("Head")
        local v178 = vu175.LocalPlayer.Character
        if v178 then
            v178 = vu175.LocalPlayer.Character:FindFirstChild("LeftHand")
        end
        local v179 = vu175.LocalPlayer.Character
        if v179 then
            v179 = vu175.LocalPlayer.Character:FindFirstChild("RightHand")
        end
        if v177 and (v178 and v179) then
            firetouchinterest(v177, v178, 0)
            firetouchinterest(v177, v179, 1)
            firetouchinterest(v177, v178, 0)
            firetouchinterest(v177, v179, 1)
        end
    end
end
local function _()
    local v181, v182, v183 = ipairs(vu174)
    while true do
        local v184
        v183, v184 = v181(v182, v183)
        if v183 == nil then
            break
        end
        vu180(v184)
    end
end
local vu185 = {}
local vu186 = game:GetService("RunService")
local vu187 = game:GetService("Players")
local vu188 = false
local vu189 = nil
local vu190 = nil
local vu191 = false
local function vu193(p192)
    if vu190 then
        vu190:Add(p192.Name)
    end
end
local function vu195(p194)
    if vu190 then
        vu190:Remove(p194.Name)
    end
end
local function vu199(p196)
    if p196 and p196.Character then
        local vu197 = p196.Character
        local vu198 = vu187.LocalPlayer.Character
        if vu197 and vu198 then
            pcall(function()
                vu197.Head.Anchored = true
                vu197.Head.CanCollide = false
                pcall(function()
                    if vu197.Head.Neck.Name == "Neck" and vu197.Head.nameGui then
                        vu197.Head.nameGui:Clone().Parent = vu197.UpperTorso
                        vu197.Head.Neck:Destroy()
                        vu197.Head.nameGui:Destroy()
                        vu197.Head.Transparency = 1
                        vu197.Head.Face:Destroy()
                    end
                end)
                pcall(function()
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                        "punch",
                        "leftHand"
                    }))
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                        "punch",
                        "rightHand"
                    }))
                    wait()
                    vu197.Head.Position = Vector3.new(vu198.LeftHand.Position.X, vu198.LeftHand.Position.Y, vu198.LeftHand.Position.Z)
                end)
            end)
        end
    end
end
local function vu204()
    if vu191 then
        local v200, v201, v202 = ipairs(vu185)
        while true do
            local v203
            v202, v203 = v200(v201, v202)
            if v202 == nil then
                break
            end
            vu199(v203)
        end
    end
end
local function vu205()
    vu188 = true
    vu191 = true
    vu189 = vu186.Stepped:Connect(vu204)
end
local function vu206()
    vu188 = false
    vu191 = false
    if vu189 then
        vu189:Disconnect()
    end
    vu185 = {}
    if vu190 then
        vu190:ClearSelection()
    end
end
v128:AddSwitch("Auto Kill Players", function(p207)
    if p207 then
        vu205()
    else
        vu206()
    end
end)
vu187.PlayerAdded:Connect(function(p208)
    vu193(p208)
    vu190:ClearOptions()
    local v209 = vu187
    local v210, v211, v212 = ipairs(v209:GetPlayers())
    while true do
        local v213
        v212, v213 = v210(v211, v212)
        if v212 == nil then
            break
        end
        vu190:AddOption(v213.Name)
    end
end)
vu187.PlayerRemoving:Connect(function(p214)
    vu195(p214)
end)
vu190 = v128:AddDropdown("Players", function(p215)
    local v216 = vu187:FindFirstChild(p215)
    if v216 then
        table.insert(vu185, v216)
    end
end)
local v217 = vu187
local v218, v219, v220 = ipairs(vu187.GetPlayers(v217))
local vu221 = vu185
local vu222 = vu187
local v223 = vu193
while true do
    local v224
    v220, v224 = v218(v219, v220)
    if v220 == nil then
        break
    end
    v223(v224)
end
v128:AddTextBox("Kill Player", function(p225)
    local v226 = vu222:FindFirstChild(p225)
    if v226 then
        table.insert(vu221, v226)
    end
end)
v128:AddLabel("---------------")
local function vu235(p227)
    local v228, v229, v230 = ipairs(game.Players:GetPlayers())
    local v231 = nil
    while true do
        local v232
        v230, v232 = v228(v229, v230)
        if v230 == nil then
            v232 = v231
            break
        end
        if v232.Name:lower():match(p227:lower()) then
            break
        end
    end
    if v232 then
        local function v234(p233)
            game.Workspace.CurrentCamera.CameraSubject = p233
        end
        v234(v232.Character or v232.CharacterAdded:Wait())
        if vu99 then
            vu99:Disconnect()
            vu99 = nil
        end
        vu99 = v232.CharacterAdded:Connect(v234)
        vu100 = v232
    else
        warn("Player not found:", p227)
    end
end
v128:AddTextBox("View Player", function(p236)
    vu235(p236)
end)
v128:AddButton("Unview Player", function()
    if vu99 then
        vu99:Disconnect()
        vu99 = nil
    end
    local v237 = game.Players.LocalPlayer
    game.Workspace.CurrentCamera.CameraSubject = v237.Character or v237.CharacterAdded:Wait()
    vu100 = nil
end)
local vu238 = v19:AddTab("Stats")
local vu239 = {}
local vu240 = nil
local vu241 = nil
local function vu243(p242)
    if p242 >= 1e18 then
        return string.format("%.1fQi", p242 / 1e18)
    elseif p242 >= 1000000000000000 then
        return string.format("%.1fQa", p242 / 1000000000000000)
    elseif p242 >= 1000000000000 then
        return string.format("%.1fT", p242 / 1000000000000)
    elseif p242 >= 1000000000 then
        return string.format("%.1fB", p242 / 1000000000)
    elseif p242 >= 1000000 then
        return string.format("%.1fM", p242 / 1000000)
    elseif p242 >= 1000 then
        return string.format("%.1fK", p242 / 1000)
    else
        return tostring(p242)
    end
end
local function vu248(pu244)
    local v245 = pu244.Name
    local vu246 = pu244:FindFirstChild("leaderstats")
    local vu247 = {
        KillsLabel = vu238:AddLabel("Kills: " .. vu243(vu246.Kills.Value or 0)),
        StrengthLabel = vu238:AddLabel("Strength: " .. vu243(vu246.Strength.Value or 0)),
        DurabilityLabel = vu238:AddLabel("Durability: " .. vu243(pu244.Durability.Value or 0))
    }
    vu239[v245] = vu247
    vu246.Kills.Changed:Connect(function()
        vu247.KillsLabel.Text = "Kills: " .. vu243(vu246.Kills.Value or 0)
    end)
    vu246.Strength.Changed:Connect(function()
        vu247.StrengthLabel.Text = "Strength: " .. vu243(vu246.Strength.Value or 0)
    end)
    pu244.Durability.Changed:Connect(function()
        vu247.DurabilityLabel.Text = "Durability: " .. vu243(pu244.Durability.Value or 0)
    end)
end
local function vu255(p249)
    local v250 = vu239[p249]
    if v250 then
        local v251, v252, v253 = pairs(v250)
        while true do
            local v254
            v253, v254 = v251(v252, v253)
            if v253 == nil then
                break
            end
            v254:Remove()
        end
        vu239[p249] = nil
    end
end
local function vu267()
    if vu241 then
        vu241:Remove()
    end
    local v256, v257, v258 = ipairs(game.Players:GetPlayers())
    local v259 = {}
    while true do
        local v260
        v258, v260 = v256(v257, v258)
        if v258 == nil then
            break
        end
        table.insert(v259, v260.Name)
    end
    vu241 = vu238:AddDropdown("Select Player", function(p261)
        local v262 = game.Players:FindFirstChild(p261)
        if v262 then
            if vu240 then
                vu255(vu240)
            end
            vu248(v262)
            vu240 = p261
        end
    end)
    local v263, v264, v265 = ipairs(v259)
    while true do
        local v266
        v265, v266 = v263(v264, v265)
        if v265 == nil then
            break
        end
        vu241:Add(v266)
    end
end
vu267()
game.Players.PlayerAdded:Connect(function(_)
    vu267()
end)
game.Players.PlayerRemoving:Connect(function(p268)
    vu255(p268.Name)
    vu267()
end)
local v269 = vu238
vu238.AddButton(v269, "Show Kills Gui", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/KillsGui/main/KillGui"))()
end)
local v270 = vu238
vu238.AddLabel(v270, "--------------")
local vu271 = {}
local vu272 = game.Players.LocalPlayer
local vu273 = {}
local function vu279(p274)
    local v275, v276, v277 = ipairs({
        {
            1e21,
            "Sx"
        },
        {
            1e18,
            "Qi"
        },
        {
            1000000000000000,
            "Qa"
        },
        {
            1000000000000,
            "T"
        },
        {
            1000000000,
            "B"
        },
        {
            1000000,
            "M"
        },
        {
            1000,
            "K"
        }
    })
    while true do
        local v278
        v277, v278 = v275(v276, v277)
        if v277 == nil then
            break
        end
        if v278[1] <= p274 then
            return string.format("%.1f%s", p274 / v278[1], v278[2])
        end
    end
    return tostring(p274)
end
local function vu297(pu280)
    local vu281 = pu280.Name
    local v282 = pu280.leaderstats.Kills.Value or 0
    local v283 = pu280.Durability.Value or 0
    local v284 = pu280.leaderstats.Strength.Value or 0
    local v285 = pu280.muscleKingTime.Value or 0
    local v286 = 0
    local v287 = 0
    local v288 = 0
    local v289 = 0
    vu273.KillsLabel = vu238:AddLabel("Kills Gain: " .. vu279(v286))
    vu273.DurabilityLabel = vu238:AddLabel("Durability Gain: " .. vu279(v287))
    vu273.StrengthLabel = vu238:AddLabel("Strength Gain: " .. vu279(v288))
    vu273.KingTimeLabel = vu238:AddLabel("King Time Gain: " .. vu279(v289))
    vu271[vu281] = {
        labels = vu273,
        previousKills = v282,
        previousDurability = v283,
        previousStrength = v284,
        previousKingTime = v285,
        totalKillsGain = v286,
        totalDurabilityGain = v287,
        totalStrengthGain = v288,
        totalKingTimeGain = v289
    }
    pu280.leaderstats.Kills.Changed:Connect(function()
        local v290 = pu280.leaderstats.Kills.Value or 0
        local v291 = v290 - vu271[vu281].previousKills
        if v291 > 0 then
            vu271[vu281].totalKillsGain = vu271[vu281].totalKillsGain + v291
            vu271[vu281].previousKills = v290
        end
        vu273.KillsLabel.Text = "Kills Gain: " .. vu279(vu271[vu281].totalKillsGain)
    end)
    pu280.Durability.Changed:Connect(function()
        local v292 = pu280.Durability.Value or 0
        local v293 = v292 - vu271[vu281].previousDurability
        if v293 > 0 then
            vu271[vu281].totalDurabilityGain = vu271[vu281].totalDurabilityGain + v293
            vu271[vu281].previousDurability = v292
        end
        vu273.DurabilityLabel.Text = "Durability Gain: " .. vu279(vu271[vu281].totalDurabilityGain)
    end)
    pu280.leaderstats.Strength.Changed:Connect(function()
        local v294 = pu280.leaderstats.Strength.Value or 0
        local v295 = v294 - vu271[vu281].previousStrength
        if v295 > 0 then
            vu271[vu281].totalStrengthGain = vu271[vu281].totalStrengthGain + v295
            vu271[vu281].previousStrength = v294
        end
        vu273.StrengthLabel.Text = "Strength Gain: " .. vu279(vu271[vu281].totalStrengthGain)
    end)
    pu280.muscleKingTime.Changed:Connect(function()
        local _ = pu280.muscleKingTime.Value
        local v296 = currentKingTime - vu271[vu281].previousKingTime
        if v296 > 0 then
            vu271[vu281].totalKingTimeGain = vu271[vu281].totalKingTimeGain + v296
            vu271[vu281].previousKingTime = currentKingTime
        end
        vu273.KingTimeLabel.Text = "King Time Gain: " .. vu279(vu271[vu281].totalKingTimeGain)
    end)
end
local function vu298()
    if vu271[vu272.Name] then
        vu273.KillsLabel:Destroy()
        vu273.DurabilityLabel:Destroy()
        vu273.StrengthLabel:Destroy()
        vu273.KingTimeLabel:Destroy()
        vu271[vu272.Name] = nil
    end
end
vu297(vu272)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    vu298()
    vu297(vu272)
end)
game.Players.LocalPlayer.CharacterRemoving:Connect(function()
    vu298()
end)
local v299 = vu238
vu238.AddLabel(v299, "--------------")
local v300 = v19:AddTab("Farm++")
local v301 = v300:AddFolder(" Auto Gym++")
v301:AddLabel("Inferno Gym")
v301:AddSwitch("Auto Inferno Press", function(p302)
    if p302 then
        _G.autoinferno = true
        while true do
            local v303 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Eternal Press").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v303))
            local v304 = game.Players.LocalPlayer.Character
            local v305 = Vector3.new(- 7163, 7, - 1089)
            if v304 then
                v304.HumanoidRootPart.CFrame = CFrame.new(v305)
            end
            wait()
            local v306 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Eternal Press").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v306))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.autoinferno then
            end
        end
    else
        _G.autoinferno = false
        return
    end
end)
v301:AddLabel("Mythical Gym")
v301:AddSwitch("Auto Mythical Press", function(p307)
    if p307 then
        _G.automystic = true
        while true do
            local v308 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Mythical Press").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v308))
            local v309 = game.Players.LocalPlayer.Character
            local v310 = Vector3.new(2387, 7, 1242)
            if v309 then
                v309.HumanoidRootPart.CFrame = CFrame.new(v310)
            end
            wait()
            local v311 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Mythical Press").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v311))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.automystic then
            end
        end
    else
        _G.automystic = false
        return
    end
end)
v301:AddSwitch("Auto Mythical Throw", function(p312)
    if p312 then
        _G.automystic = true
        while true do
            local v313 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Mythical Throw").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v313))
            local v314 = game.Players.LocalPlayer.Character
            local v315 = Vector3.new(2667, 7, 1203)
            if v314 then
                v314.HumanoidRootPart.CFrame = CFrame.new(v315)
            end
            wait()
            local v316 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Mythical Throw").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v316))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.automystic then
            end
        end
    else
        _G.automystic = false
        return
    end
end)
v301:AddSwitch("Auto Mythical Pullup", function(p317)
    if p317 then
        _G.automystic = true
        local v318 = {
            "useMachine",
            workspace.machinesFolder:FindFirstChild("Mythical Pullup").interactSeat
        }
        game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v318))
        local v319 = game.Players.LocalPlayer.Character
        local v320 = Vector3.new(2487, 7, 849)
        if v319 then
            v319.HumanoidRootPart.CFrame = CFrame.new(v320)
        end
        wait()
        local v321 = {
            "rep",
            workspace.machinesFolder:FindFirstChild("Mythical Pullup").interactSeat
        }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v321))
        game:GetService("RunService").RenderStepped:Wait()
        if not _G.automystic then
        end
    end
    _G.automystic = false
	
end)
v301:AddLabel("Frost Gym")
v301:AddSwitch("Auto Frost Press", function(p322)
    if p322 then
        _G.autofrost = true
        local v323 = {
            "useMachine",
            workspace.machinesFolder:FindFirstChild("Frost Press").interactSeat
        }
        game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v323))
        local v324 = game.Players.LocalPlayer.Character
        local v325 = Vector3.new(- 3023, 7, - 325)
        if v324 then
            v324.HumanoidRootPart.CFrame = CFrame.new(v325)
        end
        wait()
        local v326 = {
            "rep",
            workspace.machinesFolder:FindFirstChild("Frost Press").interactSeat
        }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v326))
        game:GetService("RunService").RenderStepped:Wait()
        if not _G.autofrost then
        end
    end
    _G.autofrost = false
	
end)
v301:AddSwitch("Auto Frost Lift", function(p327)
    if p327 then
        _G.autofrost = true
        while true do
            local v328 = {
                "useMachine",
                workspace.machinesFolder:FindFirstChild("Frost Lift").interactSeat
            }
            game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v328))
            local v329 = game.Players.LocalPlayer.Character
            local v330 = Vector3.new(- 2918, 7, - 210)
            if v329 then
                v329.HumanoidRootPart.CFrame = CFrame.new(v330)
            end
            wait()
            local v331 = {
                "rep",
                workspace.machinesFolder:FindFirstChild("Frost Lift").interactSeat
            }
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v331))
            game:GetService("RunService").RenderStepped:Wait()
            if not _G.autofrost then
            end
        end
    else
        _G.autofrost = false
        return
    end
end)
v301:AddSwitch("Auto Frost Squat", function(p332)
    if p332 then
        _G.autofrost = true
        local v333 = {
            "useMachine",
            workspace.machinesFolder:FindFirstChild("Frost Squat").interactSeat
        }
        game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer(unpack(v333))
        local v334 = game.Players.LocalPlayer.Character
        local v335 = Vector3.new(- 2721, 7, - 591)
        if v334 then
            v334.HumanoidRootPart.CFrame = CFrame.new(v335)
        end
        wait()
        local v336 = {
            "rep",
            workspace.machinesFolder:FindFirstChild("Frost Squat").interactSeat
        }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(v336))
        game:GetService("RunService").RenderStepped:Wait()
        if not _G.autofrost then
        end
    end
    _G.autofrost = false
	
end)
local v337 = v300:AddFolder(" Auto Rock")
v337:AddSwitch("Auto Punch King Rock (5M)", function(p338)
    if p338 then
        _G.punchking = true
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "rightHand"
        }))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "leftHand"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        firetouchinterest(game.workspace.machinesFolder["Muscle King Mountain"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
        wait(0.0001)
        firetouchinterest(game.workspace.machinesFolder["Muscle King Mountain"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        if not _G.punchking then
        end
    end
    _G.punchking = false
	
end)
v337:AddSwitch("Auto Punch Legends Rock (1M)", function(p339)
    if p339 then
        _G.punchlegends = true
        repeat
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "rightHand"
            }))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "leftHand"
            }))
            game:GetService("RunService").RenderStepped:Wait()
            firetouchinterest(game.workspace.machinesFolder["Rock Of Legends"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
            wait(0.01)
            firetouchinterest(game.workspace.machinesFolder["Rock Of Legends"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        until not _G.punchlegends
    else
        _G.punchlegends = false
    end
end)
v337:AddSwitch("Auto Punch Inferno Rock (750K)", function(p340)
    if p340 then
        _G.punchinferno = true
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "rightHand"
        }))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "leftHand"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        firetouchinterest(game.workspace.machinesFolder["Inferno Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
        wait(0.01)
        firetouchinterest(game.workspace.machinesFolder["Inferno Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        if not _G.punchinferno then
        end
    end
    _G.punchinferno = false
	
end)
function gettool()
    local v341, v342, v343 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v344
        v343, v344 = v341(v342, v343)
        if v343 == nil then
            break
        end
        if v344.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v344)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
v337:AddSwitch("Auto Punch Mystic Rock (400K)", function(p345)
    getgenv().farmrock = p345
    while getgenv().farmrock do
        wait()
        if getgenv().farmrock and game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
            local v346, v347, v348 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
            while true do
                local v349
                v348, v349 = v346(v347, v348)
                if v348 == nil then
                    break
                end
                if v349.Name == "neededDurability" and v349.Value == 400000 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                    firetouchinterest(v349.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v349.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v349.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v349.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
    if not getgenv().farmrock and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end
end)
v337:AddSwitch("Auto Punch Frozen Rock (150K)", function(p350)
    if p350 then
        _G.punchmystic = true
        repeat
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "rightHand"
            }))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "leftHand"
            }))
            game:GetService("RunService").RenderStepped:Wait()
            firetouchinterest(game.workspace.machinesFolder["Frozen Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
            wait(0.01)
            firetouchinterest(game.workspace.machinesFolder["Frozen Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        until not _G.punchmystic
    else
        _G.punchmystic = false
    end
end)
v337:AddLabel("-- Other Rock --")
v337:AddSwitch("Auto Punch Golden Rock (5K)", function(p351)
    if p351 then
        _G.punchinferno = true
        repeat
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "rightHand"
            }))
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
                "punch",
                "leftHand"
            }))
            game:GetService("RunService").RenderStepped:Wait()
            firetouchinterest(game.workspace.machinesFolder["Punching Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
            wait(0.01)
            firetouchinterest(game.workspace.machinesFolder["Punching Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        until not _G.punchinferno
    else
        _G.punchinferno = false
    end
end)
function gettool()
    local v352, v353, v354 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v355
        v354, v355 = v352(v353, v354)
        if v354 == nil then
            break
        end
        if v355.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v355)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
v337:AddSwitch("Auto Punch Large Rock (100)", function(p356)
    getgenv().farmrock = p356
    while getgenv().farmrock do
        wait()
        if getgenv().farmrock and game:GetService("Players").LocalPlayer.Durability.Value >= 100 then
            local v357, v358, v359 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
            while true do
                local v360
                v359, v360 = v357(v358, v359)
                if v359 == nil then
                    break
                end
                if v360.Name == "neededDurability" and v360.Value == 100 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                    firetouchinterest(v360.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v360.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v360.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v360.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
    if not getgenv().farmrock and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end
end)
function gettool()
    local v361, v362, v363 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
    while true do
        local v364
        v363, v364 = v361(v362, v363)
        if v363 == nil then
            break
        end
        if v364.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v364)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
v337:AddSwitch("Auto Punch Punching Rock (10)", function(p365)
    getgenv().farmrock = p365
    while getgenv().farmrock do
        wait()
        if getgenv().farmrock and game:GetService("Players").LocalPlayer.Durability.Value >= 10 then
            local v366, v367, v368 = pairs(game:GetService("Workspace").machinesFolder:GetDescendants())
            while true do
                local v369
                v368, v369 = v366(v367, v368)
                if v368 == nil then
                    break
                end
                if v369.Name == "neededDurability" and v369.Value == 10 and (game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand")) then
                    firetouchinterest(v369.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v369.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v369.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v369.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
    if not getgenv().farmrock and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end
end)
v337:AddSwitch("Auto Punch Tiny Rock (0)", function(p370)
    if p370 then
        _G.punchinferno = true
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "rightHand"
        }))
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({
            "punch",
            "leftHand"
        }))
        game:GetService("RunService").RenderStepped:Wait()
        firetouchinterest(game.workspace.machinesFolder["Tiny Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
        wait(0.01)
        firetouchinterest(game.workspace.machinesFolder["Tiny Rock"].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
        if not _G.punchinferno then
        end
    end
    _G.punchinferno = false
	
end)
local v371 = v300:AddFolder(" Auto Rock V2")
v371:AddSwitch("Auto Rock (5M)", function(p372)
    if p372 then
        _G.SafeZone = true
        local v373 = game.Players.LocalPlayer.Character
        local v374 = Vector3.new(- 8976, 9, - 6130)
        if v373 then
            v373.HumanoidRootPart.CFrame = CFrame.new(v374)
        end
        wait(0.001)
        if not _G.SafeZone then
        end
    end
    _G.SafeZone = false
	
end)
v371:AddSwitch("Auto Rock (1M)", function(p375)
    if p375 then
        _G.SafeZone = true
        while true do
            local v376 = game.Players.LocalPlayer.Character
            local v377 = Vector3.new(4111.1640625, 991.6776123046875, - 4043.022216796875)
            if v376 then
                v376.HumanoidRootPart.CFrame = CFrame.new(v377)
            end
            wait(0.001)
            if not _G.SafeZone then
            end
        end
    else
        _G.SafeZone = false
        return
    end
end)
v371:AddSwitch("Auto Rock (750K)", function(p378)
    if p378 then
        _G.SafeZone = true
        local v379 = game.Players.LocalPlayer.Character
        local v380 = Vector3.new(- 7293.1806640625, 8.422783851623535, - 1232.740478515625)
        if v379 then
            v379.HumanoidRootPart.CFrame = CFrame.new(v380)
        end
        wait(0.001)
        if not _G.SafeZone then
        end
    end
    _G.SafeZone = false
	
end)
v371:AddSwitch("Auto Rock (400K)", function(p381)
    if p381 then
        _G.SafeZone = true
        while true do
            local v382 = game.Players.LocalPlayer.Character
            local v383 = Vector3.new(2152.554931640625, 10.173534393310547, 1272.4615478515625)
            if v382 then
                v382.HumanoidRootPart.CFrame = CFrame.new(v383)
            end
            wait(0.001)
            if not _G.SafeZone then
            end
        end
    else
        _G.SafeZone = false
        return
    end
end)
v371:AddSwitch("Auto Rock (150K)", function(p384)
    if p384 then
        _G.SafeZone = true
        while true do
            local v385 = game.Players.LocalPlayer.Character
            local v386 = Vector3.new(- 2528.792724609375, 7.32121467590332, - 207.19921875)
            if v385 then
                v385.HumanoidRootPart.CFrame = CFrame.new(v386)
            end
            wait(0.001)
            if not _G.SafeZone then
            end
        end
    else
        _G.SafeZone = false
        return
    end
end)
v371:AddLabel("----Use Auto Punch {With Movement}----")
local v387 = v300:AddFolder("Rebirth (Use with caution)")
local vu388 = 0
local vu389 = false
v387:AddTextBox("Target Rebirth", function(p390)
    local v391 = tonumber(p390)
    if v391 then
        vu388 = v391
    end
end)
v387:AddSwitch("Auto Rebirth on Target rebirths", function(p392)
    vu389 = p392
    if vu389 then
        FarmRebirths()
    end
end)
function FarmRebirths()
    local v393 = game.Players.LocalPlayer
    local v394 = v393:WaitForChild("leaderstats"):WaitForChild("Rebirths")
    while vu389 do
        wait(1)
        if vu388 <= v394.Value then
            vu389 = false
            return
        end
        if v393.Character and v393.Character:FindFirstChild("HumanoidRootPart") then
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer(unpack({
                "rebirthRequest"
            }))
        end
    end
end
v387:AddSwitch("Auto Rebirth", function(p395)
    if p395 then
        _G.autoreb = true
        game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer(unpack({
            "rebirthRequest"
        }))
        if not _G.autoreb then
        end
    end
    _G.autoreb = false
	
end)
local vu396 = 2
local vu397 = false
v387:AddSwitch("Auto Set Size 2", function(p398)
    vu397 = p398
    if p398 then
        _G.autoSetSizeEnabled = true
        repeat
            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", vu396)
        until not _G.autoSetSizeEnabled
    else
        _G.autoSetSizeEnabled = false
    end
end)
local function v399()
    while vu397 do
        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", vu396)
        wait(0.01)
    end
end
spawn(v399)
v387:AddSwitch("Auto Teleport King", function(p400)
    if p400 then
        _G.SafeZone = true
        while true do
            local v401 = game.Players.LocalPlayer.Character
            local v402 = Vector3.new(- 8636, 17, - 5759)
            if v401 then
                v401.HumanoidRootPart.CFrame = CFrame.new(v402)
            end
            wait(0.001)
            if not _G.SafeZone then
            end
        end
    else
        _G.SafeZone = false
        return
    end
end)
local vu403 = v300:AddFolder("Auto Equip Weight Tools")
local v404, v405, v406 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
local v407 = {}
while true do
    local v408
    v406, v408 = v404(v405, v406)
    if v406 == nil then
        break
    end
    if v408:IsA("Tool") then
        table.insert(v407, v408.Name)
    end
end
vu403:AddTextBox("Enter Tool Name", function(p409)
    SelectedWeapon = p409
end)
vu403:AddSwitch("Auto Equip Tools", function(p410)
    Equip = p410
    while wait() do
        if Equip then
            pcall(function()
                local v411, v412, v413 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                while true do
                    local v414
                    v413, v414 = v411(v412, v413)
                    if v413 == nil then
                        break
                    end
                    if v414.Name == SelectedWeapon then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v414)
                    end
                end
            end)
        end
    end
end)
local function v424(p415, pu416)
    vu403:AddSwitch(p415, function(pu417)
        local vu418 = game:GetService("Players").LocalPlayer
        local function vu421()
            local v419 = vu418:FindFirstChild("Backpack")
            local v420 = v419 and v419:FindFirstChild(pu416)
            if v420 and not vu418.Character:FindFirstChild(pu416) then
                vu418.Character.Humanoid:EquipTool(v420)
            end
        end
        local v422 = pu417
        if v422 then
            vu421()
            while v422 do
                vu418.muscleEvent:FireServer(unpack({
                    "rep"
                }))
                game:GetService("RunService").RenderStepped:Wait()
                vu421()
                v422 = pu417
            end
        end
        vu418.CharacterAdded:Connect(function(p423)
            if pu417 then
                p423:WaitForChild("Humanoid")
                vu421()
            end
        end)
    end):Set(false)
end
v424("Auto Weight", "Weight")
v424("Auto Pushup", "Pushups")
v424("Auto Handstands", "Handstands")
v424("Auto Situps", "Situps")
vu403:AddLabel("----Reset to be able to walk again----")
local v425 = v19:AddTab("Players")
v425:AddTextBox("Walkspeed", function(p426)
    setws = p426
end)
v425:AddSwitch("Set Walkspeed", function(p427)
    getgenv().ws = p427
    while getgenv().ws do
        wait()
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setws
        end
    end
end)
v425:AddTextBox("JumpPower", function(p428)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = p428
end)
v425:AddTextBox("HipHeight", function(p429)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = p429
end)
v425:AddTextBox("Max Zoom Distance", function(p430)
    game.StarterPlayer.CameraMaxZoomDistance = p430
end)
v425:AddLabel("--------")
v425:AddSwitch("Lock Client Position", function(p431)
    function freezePlayer()
        local vu432 = game.Players.LocalPlayer
        local vu433 = (vu432.Character or vu432.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
        local vu434 = vu433.Position
        local v435 = game:GetService("RunService")
        vu432:SetAttribute("Frozen", true)
        local vu436 = Instance.new("BodyPosition")
        vu436.Position = vu434
        vu436.MaxForce = Vector3.new(1000000, 1000000, 1000000)
        vu436.P = 10000
        vu436.D = 1000
        local vu437 = Instance.new("BodyGyro")
        vu437.CFrame = vu433.CFrame
        vu437.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
        vu437.P = 10000
        vu436.Parent = vu433
        vu437.Parent = vu433
        local vu438 = nil
        vu438 = v435.Stepped:Connect(function()
            if vu432:GetAttribute("Frozen") then
                vu433.Velocity = Vector3.new(0, 0, 0)
                vu433.RotVelocity = Vector3.new(0, 0, 0)
                vu433.CFrame = CFrame.new(vu434)
                vu436.Position = vu434
                vu437.CFrame = vu433.CFrame
            else
                vu438:Disconnect()
                vu436:Destroy()
                vu437:Destroy()
            end
        end)
    end
    function unfreezePlayer()
        game.Players.LocalPlayer:SetAttribute("Frozen", false)
    end
    if p431 then
        freezePlayer()
    else
        unfreezePlayer()
    end
end)
v425:AddButton("Remove Punch", function()
    game:GetService("Players").LocalPlayer.Backpack.Punch.RequiresHandle = true
end)
v425:AddButton("Recover Punch", function()
    game:GetService("Players").LocalPlayer.Backpack.Punch.RequiresHandle = false
end)
v425:AddSwitch("Infinite Jump", function(p439)
    getgenv().InfJ = p439
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)
local vu440 = false
local function vu445()
    Clip = false
    Noclip = game:GetService("RunService").Stepped:Connect(function()
        if Clip == false and game.Players.LocalPlayer.Character then
            local v441, v442, v443 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
            while true do
                local v444
                v443, v444 = v441(v442, v443)
                if v443 == nil then
                    break
                end
                if v444:IsA("BasePart") and v444.CanCollide then
                    v444.CanCollide = false
                end
            end
        end
        wait(0.21)
    end)
end
local function vu446()
    if Noclip then
        Noclip:Disconnect()
    end
    Clip = true
end
v425:AddSwitch("Noclip", function(p447)
    vu440 = p447
    if vu440 then
        vu445()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Player",
            Text = "Noclip enabled",
            Duration = 5
        })
    else
        vu446()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Player",
            Text = "Noclip disabled",
            Duration = 5
        })
    end
end)
v425:AddButton("Anti AFK", function()
    local vu448 = game:service("VirtualUser")
    game:service("Players").LocalPlayer.Idled:connect(function()
        vu448:CaptureController()
        vu448:ClickButton2(Vector2.new())
    end)
    warn("Anti-Afk has Loaded")
end)
v425:AddButton("Anti Lag", function()
    local v449 = game
    local v450 = v449.Workspace
    local v451 = v449.Lighting
    local v452 = v450.Terrain
    v452.WaterWaveSize = 0
    v452.WaterWaveSpeed = 0
    v452.WaterReflectance = 0
    v452.WaterTransparency = 0
    v451.GlobalShadows = false
    v451.FogEnd = 9000000000
    v451.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    local v453, v454, v455 = pairs(v449:GetDescendants())
    local v456 = true
    while true do
        local v457
        v455, v457 = v453(v454, v455)
        if v455 == nil then
            break
        end
        if v457:IsA("Part") or (v457:IsA("Union") or (v457:IsA("CornerWedgePart") or v457:IsA("TrussPart"))) then
            v457.Material = "Plastic"
            v457.Reflectance = 0
        elseif v457:IsA("Decal") or v457:IsA("Texture") and v456 then
            v457.Transparency = 1
        elseif v457:IsA("ParticleEmitter") or v457:IsA("Trail") then
            v457.Lifetime = NumberRange.new(0)
        elseif v457:IsA("Explosion") then
            v457.BlastPressure = 1
            v457.BlastRadius = 1
        elseif v457:IsA("Fire") or (v457:IsA("SpotLight") or v457:IsA("Smoke")) then
            v457.Enabled = false
        elseif v457:IsA("MeshPart") then
            v457.Material = "Plastic"
            v457.Reflectance = 0
            v457.TextureID = 1.0385902758728956e16
        end
    end
    local v458, v459, v460 = pairs(v451:GetChildren())
    while true do
        local v461
        v460, v461 = v458(v459, v460)
        if v460 == nil then
            break
        end
        if v461:IsA("BlurEffect") or (v461:IsA("SunRaysEffect") or (v461:IsA("ColorCorrectionEffect") or (v461:IsA("BloomEffect") or v461:IsA("DepthOfFieldEffect")))) then
            v461.Enabled = false
        end
    end
end)
v425:AddButton("ChatSpy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CAXAP26BKyCH/shiftLock/main/SpyChat"))()
end)