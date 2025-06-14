-- Tubers93 World GUI Script
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- GUI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "Tubers93GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Tubers93 World Menu"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

-- Jumpscare Button
local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Size = UDim2.new(0.9, 0, 0, 40)
jumpBtn.Position = UDim2.new(0.05, 0, 0, 60)
jumpBtn.Text = "Trigger Jumpscare"
jumpBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
jumpBtn.TextColor3 = Color3.new(1, 1, 1)
jumpBtn.Font = Enum.Font.GothamBold
jumpBtn.TextSize = 18

-- Zombie Button
local zomBtn = jumpBtn:Clone()
zomBtn.Position = UDim2.new(0.05, 0, 0, 110)
zomBtn.Text = "Spawn Zombies"
zomBtn.Parent = frame

-- Jumpscare Image
local jsImage = Instance.new("ImageLabel", gui)
jsImage.Size = UDim2.new(1, 0, 1, 0)
jsImage.Image = "rbxassetid://123830453233607"
jsImage.BackgroundTransparency = 1
jsImage.Visible = false
jsImage.ZIndex = 999

-- Jumpscare Logic
jumpBtn.MouseButton1Click:Connect(function()
	jsImage.Visible = true
	local scream = Instance.new("Sound", player:WaitForChild("PlayerGui"))
	scream.SoundId = "rbxassetid://138186576" -- scary sound
	scream.Volume = 10
	scream:Play()
	wait(3)
	jsImage.Visible = false
	scream:Destroy()
end)

-- Welcome Message from Bot
local chatRemote = game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest")
if chatRemote then
	chatRemote:FireServer("👻 Welcome to Tubers93 World! Buckle up... 🎈", "All")
end

-- Zombie AI
local function spawnZombie(target)
	local z = Instance.new("Model", workspace)
	z.Name = "TubersZombie"

	local head = Instance.new("Part", z)
	head.Name = "Head"
	head.Size = Vector3.new(2, 1, 1)
	head.Position = target.Character.Head.Position + Vector3.new(math.random(-10,10), 5, math.random(-10,10))
	head.Anchored = false
	head.BrickColor = BrickColor.new("Bright green")

	local torso = Instance.new("Part", z)
	torso.Size = Vector3.new(2, 2, 1)
	torso.Position = head.Position - Vector3.new(0, 1.5, 0)

	local humanoid = Instance.new("Humanoid", z)

	humanoid:MoveTo(target.Character.HumanoidRootPart.Position)

	while z and z.Parent and target and target.Character do
		wait(1)
		pcall(function()
			humanoid:MoveTo(target.Character.HumanoidRootPart.Position)
		end)
	end
end

-- Zombie Button Action
zomBtn.MouseButton1Click:Connect(function()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			spawnZombie(p)
		end
	end
end)
