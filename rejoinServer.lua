local function RejoinServer()
    if game:GetService("RunService"):IsStudio() then
        warn("Cannot rejoin server. This script should be run in-game, not in Roblox Studio idiot.")
    else
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
end

RejoinServer()