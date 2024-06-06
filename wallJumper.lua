local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local isEnabled = false

local function isObstacle(part)
    -- Function to check if a part is an obstacle (a wall)
    -- You can adjust this function based on your game's specific obstacles
    return part:IsA("Model") and part:FindFirstChild("Wall") ~= nil
end

local function isFloor(part)
    -- Function to check if a part is the floor
    -- You can adjust this function based on your game's floor detection
    return part:IsA("Part") and part.Position.Y < character.HumanoidRootPart.Position.Y
end

local function checkCollision(direction)
    -- Function to check for collision in the specified direction
    local origin = character.HumanoidRootPart.Position
    local ray = Ray.new(origin, direction * 3) -- Adjust the length of the ray as needed
    local hit, position = game.Workspace:FindPartOnRay(ray, character, false, true)
    return hit, position
end

local function movePlayer()
    -- Function to move the player
    if isEnabled then
        local direction = humanoid.MoveDirection
        local hit, position = checkCollision(direction)
        
        if hit and isObstacle(hit) then
            -- If the player is facing a wall, move them away from the wall
            character:SetPrimaryPartCFrame(CFrame.new(position + direction * 3))
        elseif hit and isFloor(hit) then
            -- If the player is facing the floor, don't allow them to fall through
            character:SetPrimaryPartCFrame(CFrame.new(position + Vector3.new(0, 3, 0)))
        end
    end
end

local function toggleScript()
    isEnabled = not isEnabled
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.J then
        toggleScript()
    end
end)

game:GetService("RunService").Stepped:Connect(movePlayer)