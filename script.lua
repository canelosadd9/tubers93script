print("[DEBUG] Script loaded")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI Reporter
print("[DEBUG] Creating GUI")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DebugGUI"

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0,200,0,50)
btn.Position = UDim2.new(0.5,-100,0.5,-25)
btn.Text = "Debug Button"
btn.Parent = gui

btn.MouseButton1Click:Connect(function()
    print("[DEBUG] Button clicked!")
end)
