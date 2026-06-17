local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "UniversalUtility"
gui.ResetOnSpawn = false
pcall(function()
    gui.Parent = game:GetService("CoreGui")
end)

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(300, 180)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.Text = "Universal Utility"
title.Parent = frame

local coords = Instance.new("TextLabel")
coords.Size = UDim2.new(1,-10,0,30)
coords.Position = UDim2.new(0,5,0,40)
coords.Parent = frame

local rejoin = Instance.new("TextButton")
rejoin.Size = UDim2.new(1,-10,0,35)
rejoin.Position = UDim2.new(0,5,0,80)
rejoin.Text = "Rejoin Server"
rejoin.Parent = frame

game:GetService("RunService").RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local p = hrp.Position
        coords.Text = string.format(
            "X: %.1f Y: %.1f Z: %.1f",
            p.X, p.Y, p.Z
        )
    end
end)

rejoin.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(
        game.PlaceId,
        LocalPlayer
    )
end)
