repeat wait() until game:IsLoaded()
local uis = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local hum = plr.Character:WaitForChild("Humanoid")
local stamina = Instance.new("NumberValue", plr.Character)
local max = 10
stamina.Value = max
local running = false

hum.Running:Connect(function(speed)
  if speed >= 0.1 and uis:IsKeyPressed(Enum.KeyCode.LeftShift) then
    running = true
  else
    running = false
  end
end)

while wait() do
  if running then
    if stanima.Value >= 0 then
      stamina.Value -= 0.05
    else
      stamina.Value = 0
    end
  else
    if stanima.Value <= max then
      stamina.Value += 0.05
    else
      stamina.Value = max
    end
  end
end