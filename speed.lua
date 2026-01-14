-- LH RECORDS | SPEED HACK v1.0
-- Created by Azer

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Создаем интерфейс
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 180, 0, 110)
main.Position = UDim2.new(0.1, 0, 0.5, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 15)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Text = "LH SPEED"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextSize = 14

-- Поле ввода скорости
local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0.8, 0, 0.3, 0)
input.Position = UDim2.new(0.1, 0, 0.35, 0)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
input.Text = "100"
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Font = Enum.Font.Gotham
local inputCorner = Instance.new("UICorner", input)

-- Кнопка активации
local btn = Instance.new("TextButton", main)
btn.Size = UDim2.new(0.8, 0, 0.25, 0)
btn.Position = UDim2.new(0.1, 0, 0.7, 0)
btn.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
btn.Text = "SET SPEED"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
local btnCorner = Instance.new("UICorner", btn)

-- Логика
local speedEnabled = false

btn.MouseButton1Click:Connect(function()
    local newSpeed = tonumber(input.Text)
    if newSpeed then
        hum.WalkSpeed = newSpeed
        btn.Text = "SPEED: " .. newSpeed
        
        -- Цикл, чтобы скорость не сбрасывалась игрой
        speedEnabled = true
        task.spawn(function()
            while speedEnabled do
                if hum and hum.Parent then
                    hum.WalkSpeed = newSpeed
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Уведомление в консоль (для солидности)
print("LH RECORDS SPEED HACK LOADED")
