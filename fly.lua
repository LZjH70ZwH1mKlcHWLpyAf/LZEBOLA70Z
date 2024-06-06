-- LocalScript for smooth flying toggle in Roblox

-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UIS = game:GetService("UserInputService")
local flying = false
local flySpeed = 100
local bodyGyro, bodyVelocity

-- Function to start flying
local function startFlying()
    if flying then return end
    flying = true
    
    -- Create BodyGyro to keep player upright
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
    bodyGyro.CFrame = character.PrimaryPart.CFrame
    bodyGyro.Parent = character.PrimaryPart
    
    -- Create BodyVelocity to move player around
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)
    bodyVelocity.Parent = character.PrimaryPart
    
    -- Disable gravity
    humanoid.PlatformStand = true
end

-- Function to stop flying
local function stopFlying()
    if not flying then return end
    flying = false
    
    -- Remove BodyGyro and BodyVelocity
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
    
    -- Enable gravity
    humanoid.PlatformStand = false
end

-- Toggle flying when pressing the 'F' key
UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        if flying then
            stopFlying()
        else
            startFlying()
        end
    end
end)

-- Update flying movement
game:GetService("RunService").RenderStepped:Connect(function()
    if flying then
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new()
        
        -- Get input from WASD keys
        if UIS:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + camera.CFrame.UpVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection = moveDirection - camera.CFrame.UpVector
        end
        
        -- Normalize and apply fly speed
        if moveDirection.magnitude > 0 then
            moveDirection = moveDirection.unit
        end
        bodyVelocity.Velocity = moveDirection * flySpeed
        bodyGyro.CFrame = CFrame.new(character.PrimaryPart.Position, character.PrimaryPart.Position + moveDirection)
    end
end)

-- Prevent character from being flung off the map
character.PrimaryPart.Anchored = false
character:WaitForChild("HumanoidRootPart").Anchored = false