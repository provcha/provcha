local AdminGunController = {}
AdminGunController.__index = AdminGunController
local uis = game:GetService("UserInputService")

function AdminGunController.new(model)
    local self = setmetatable({}, AdminGunController)
    self.plr = game.Players.LocalPlayer
    self.model = model
    self.fireRate = 999999
    self.getHit = require(game.ReplicatedStorage.getHit)
    self.shooting1 = false
    self.shooting2 = false
    self.perssed1 = false
    self.pressed2 = false
    self:init()
    return self
end

function AdminGunController:shoot1()
    local hit, pos, _ = self.getHit.getHit()
    local shoot
end

function AdminGunController:shoot2()
    local hit, pos, _ = self.getHit.getHit()
    local explosion
end

function AdminGunController:startShoot1()
    if self.shooting then
       return
    end

    task.spawn(function()
      self.shooting = true
      while uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and self.model.Parent == workspace do
        self:shoot1()
        task.wait(60 / self.fireRate)
      end
      self.shooting = false
    end)
end

function AdminGunController:startShoot2()

end

function AdminGunController:init()
   if not uis.TouchEnbled then
      uis.InputBegan:Connect(function(inp)
         if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            self:startShoot1()
         end
         if inp.UserInputType == Enum.UserInputType.MouseButton2 then
            self:startShoot2()
         end
      end)
   else
      self.mobGui = script.mobGui:Clone()
      self.mobGui.Parent = self.plr.PlayerGui
      self.mobGui.Fire1Button.MouseButton1Down:Connect(function()
        self:start
      end)
   end
end