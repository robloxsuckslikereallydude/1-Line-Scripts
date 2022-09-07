local TeleportService = game:GetService("TeleportService")
local ClientReplicator = game:GetService("NetworkClient").ClientReplicator
local CurrentServer = game["JobId"]

ClientReplicator.AncestryChanged:Connect(function()
    TeleportService:TeleportToPlaceInstance(game["PlaceId"], CurrentServer)
end)
