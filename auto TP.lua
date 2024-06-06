


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local teleporting = false

-- Function to get a random player other than the local player
local function GetRandomPlayer()
    local availablePlayers = {}
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(availablePlayers, player)
        end
    end
    
    if #availablePlayers > 0 then
        return availablePlayers[math.random(1, #availablePlayers)]
    else
        return nil
    end
end

-- Function to teleport to a random player
local function TeleportToRandomPlayer()
    local randomPlayer = GetRandomPlayer()
    if randomPlayer and randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(2, 0, 2))) -- Teleport a bit offset to avoid collision
    end
end

-- Function to handle key press to toggle teleporting
local function ToggleTeleporting(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.M and not gameProcessed then
        teleporting = not teleporting
        if teleporting then
            print("Teleporting enabled")
        else
            print("Teleporting disabled")
        end
    end
end

-- Connect the input event
UserInputService.InputBegan:Connect(ToggleTeleporting)

-
while true do
    if teleporting then
        TeleportToRandomPlayer()
    end
    wait(3) 
end
