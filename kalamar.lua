local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Kalamar_Gama_Hack"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local function addGradient(object, colors, transparency)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new(colors)
    if transparency then
        gradient.Transparency = NumberSequence.new(transparency)
    end
    gradient.Parent = object
    return gradient
end

local function addCorner(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 12)
    corner.Parent = object
    return corner
end

local function addStroke(object, thickness, color)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = thickness or 2
    stroke.Color = color or Color3.fromRGB(100, 200, 255)
    stroke.Transparency = 0.3
    stroke.Parent = object
    return stroke
end

local function makeButton(text, sizeX, sizeY)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(0, sizeX, 0, sizeY)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Active = true
    btn.Selectable = false
    btn.BackgroundTransparency = 0
    btn.TextTransparency = 0
    
    addCorner(btn, 10)
    addStroke(btn, 2, Color3.fromRGB(70, 130, 200))
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 70), TextSize = 16}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 55), TextSize = 14}):Play()
    end)
    
    return btn
end

local function makeLabel(text, sizeX, sizeY)
    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(0, sizeX, 0, sizeY)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(150, 200, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Selectable = false
    label.TextTransparency = 0
    return label
end

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 360, 0, 50)
frame.Position = UDim2.new(0.5, -180, 0.5, -25)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.BackgroundTransparency = 0
frame.Parent = ScreenGui

addCorner(frame, 20)
addStroke(frame, 3, Color3.fromRGB(100, 150, 255))

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
titleBar.BorderSizePixel = 0
titleBar.BackgroundTransparency = 0
titleBar.Parent = frame
addCorner(titleBar, 20)

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Kalamar Gama Hack"
titleLabel.Size = UDim2.new(0.7, 0, 0.5, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Position = UDim2.new(0.05, 0, 0, 0)
titleLabel.TextTransparency = 1
titleLabel.Parent = titleBar

local subLabel = Instance.new("TextLabel")
subLabel.Text = "Made by ny2xrox"
subLabel.Size = UDim2.new(0.7, 0, 0.5, 0)
subLabel.BackgroundTransparency = 1
subLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
subLabel.Font = Enum.Font.Gotham
subLabel.TextSize = 14
subLabel.TextXAlignment = Enum.TextXAlignment.Left
subLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
subLabel.TextTransparency = 1
subLabel.Parent = titleBar

local toggleButton = Instance.new("TextButton")
toggleButton.Text = "➕"
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0.85, 0, 0.05, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.BorderSizePixel = 0
toggleButton.BackgroundTransparency = 0
toggleButton.TextTransparency = 0
toggleButton.Parent = titleBar
addCorner(toggleButton, 10)

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -50)
contentFrame.Position = UDim2.new(0, 0, 0, 50)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.Visible = false
contentFrame.Parent = frame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, 0)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Parent = contentFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)
UIListLayout.Parent = ScrollingFrame

local speedEnabled = false
local normalWalkSpeed = 16
local speedValue = 200 -- Hızı 200'e yükselttim

local infiniteJumpEnabled = false
local noclipEnabled = false
local noclipConn

local speedButton = makeButton("💨 Hız Aç/Kapa (200)", 340, 50)
speedButton.Parent = ScrollingFrame
speedButton.MouseButton1Click:Connect(function()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("Humanoid") then return end
    local humanoid = character.Humanoid
    speedEnabled = not speedEnabled
    if speedEnabled then
        humanoid.WalkSpeed = speedValue
        speedButton.Text = "💨 Hız Açık ✅ (200)"
        speedButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
    else
        humanoid.WalkSpeed = normalWalkSpeed
        speedButton.Text = "💨 Hız Kapalı ❌"
        speedButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
    end
end)

local infiniteJumpButton = makeButton("🚀 Infinite Jump", 340, 50)
infiniteJumpButton.Parent = ScrollingFrame
infiniteJumpButton.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    infiniteJumpButton.Text = infiniteJumpEnabled and "🚀 Infinite Jump Açık ✅" or "🚀 Infinite Jump Kapalı ❌"
    infiniteJumpButton.BackgroundColor3 = infiniteJumpEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
    
    if infiniteJumpEnabled then
        UserInputService.JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    end
end)

local noclipButton = makeButton("👻 Noclip", 340, 50)
noclipButton.Parent = ScrollingFrame
noclipButton.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipButton.BackgroundColor3 = noclipEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
    noclipButton.Text = noclipEnabled and "👻 Noclip Açık ✅" or "👻 Noclip Kapalı ❌"
    if noclipEnabled then 
        noclipConn = RunService.Heartbeat:Connect(function()
            local character = LocalPlayer.Character
            if not character then return end
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if noclipConn then
            noclipConn:Disconnect()
            noclipConn = nil
        end
        local character = LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
    TweenService:Create(frame, TweenInfo.new(0.1), {Position = newPosition}):Play()
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

toggleButton.MouseButton1Click:Connect(function()
    local isVisible = contentFrame.Visible
    contentFrame.Visible = not isVisible
    toggleButton.Text = isVisible and "➕" or "➖"
    
    local targetSize = isVisible and UDim2.new(0, 360, 0, 50) or UDim2.new(0, 360, 0, 400)
    local targetGradient = isVisible and {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 45))
    } or {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    }
    
    TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {Size = targetSize}):Play()
    local gradient = addGradient(titleBar, targetGradient)
    wait(0.5)
    gradient:Destroy()
    
    if not isVisible then
        TweenService:Create(titleLabel, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
        TweenService:Create(subLabel, TweenInfo.new(1, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    else
        TweenService:Create(titleLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
        TweenService:Create(subLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
    end
end)

-- Animasyonlu açılış ekranı
local splashScreen = Instance.new("ScreenGui")
splashScreen.Name = "SplashScreen"
splashScreen.Parent = LocalPlayer:WaitForChild("PlayerGui")

local splashFrame = Instance.new("Frame")
splashFrame.Size = UDim2.new(0, 0, 0, 0)
splashFrame.Position = UDim2.new(0.5, -250, 0.5, -125)
splashFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
splashFrame.BorderSizePixel = 0
splashFrame.Parent = splashScreen
addCorner(splashFrame, 25)
addStroke(splashFrame, 4, Color3.fromRGB(255, 215, 0))

local splashLabel = Instance.new("TextLabel")
splashLabel.Size = UDim2.new(1, 0, 1, 0)
splashLabel.BackgroundTransparency = 1
splashLabel.Text = "Kalamar Gama Hack\nLoading..."
splashLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
splashLabel.Font = Enum.Font.GothamBlack
splashLabel.TextSize = 28
splashLabel.TextXAlignment = Enum.TextXAlignment.Center
splashLabel.TextYAlignment = Enum.TextYAlignment.Center
splashLabel.TextTransparency = 1
splashLabel.Parent = splashFrame

local splashGradient = addGradient(splashFrame, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 191, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 20, 147))
})

TweenService:Create(splashFrame, TweenInfo.new(1.5, Enum.EasingStyle.Elastic), {Size = UDim2.new(0, 500, 0, 250)}):Play()
wait(0.5)
TweenService:Create(splashLabel, TweenInfo.new(1, Enum.EasingStyle.Bounce), {TextTransparency = 0}):Play()
wait(2.5)
TweenService:Create(splashFrame, TweenInfo.new(1, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0)}):Play()
wait(1)
splashScreen:Destroy()

UserInputService.InputBegan:Connect(function(key, gameProcessed)
    if gameProcessed then return end
    
    if key.KeyCode == Enum.KeyCode.F1 then
        speedButton.MouseButton1Click()
    elseif key.KeyCode == Enum.KeyCode.F2 then
        infiniteJumpButton.MouseButton1Click()
    elseif key.KeyCode == Enum.KeyCode.F3 then
        noclipButton.MouseButton1Click()
    elseif key.KeyCode == Enum.KeyCode.Delete then
        ScreenGui:Destroy()
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1)
    if speedEnabled then
        character:WaitForChild("Humanoid").WalkSpeed = speedValue
    end
end)

wait(1)
print("🎯 Kalamar Gama Hack Loaded Successfully! 🎯")