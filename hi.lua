repeat wait() until game:IsLoaded()
local uis = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local hum = plr.Character:WaitForChild("Humanoid")
local stamina = Instance.new("NumberValue", plr.Character)
local running = false

hum.Running:Connect(function(speed)
  if speed >= 0.1 then
    running = true
  else
    running = false
  end
end)

