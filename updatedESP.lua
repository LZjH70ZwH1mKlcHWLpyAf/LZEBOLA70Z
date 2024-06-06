
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local outlineEnabled = false
local toggleKey = Enum.KeyCode.B -- Change this to the desired key for toggling

local function createOutline(player)
    if not outlineEnabled then return end
    local character = player.Character
    if character then
        local highlight = Instance.new("Highlight")
        highlight.Name = player.Name .. "_Highlight"
        highlight.Parent = character
        highlight.FillColor = Color3.new(1, 0, 0) -- Red color
        highlight.OutlineTransparency = 0 -- Fully visible outline
        highlight.FillTransparency = 1 -- Fully transparent fill
    end
end

local function removeOutline(player)
    local character = player.Character
    if character then
        local highlight = character:FindFirstChild(player.Name .. "_Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

local function updateOutlines()
    for _, player in ipairs(Players:GetPlayers()) do
        if outlineEnabled then
            createOutline(player)
        else
            removeOutline(player)
        end
    end
end

local function onCharacterAdded(character)
    local player = Players:GetPlayerFromCharacter(character)
    if player then
        createOutline(player)
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character then
        createOutline(player)
    end
end

local function onPlayerRemoving(player)
    removeOutline(player)
end

local function toggleOutlines()
    outlineEnabled = not outlineEnabled
    updateOutlines()
end

-- Connect events
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

-- Create outlines for players already in the game
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end


UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == toggleKey then
        toggleOutlines()
    end
end)