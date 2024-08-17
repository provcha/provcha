local AdminGunController = {}
AdminGunController.__index = AdminGunController
local uis = game:GetService("UserInputService")

function AdminGunController.new(model)
    local self = setmetatable({}, AdminGunController)
    self.fireRate = 999999
    self.getHit = require(game.ReplicatedStorage.getHit)
    self.shooting = false
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
      while uis:KeyIsPressed(Enum.UserInputType.MouseButton1) do
        self:shoot1()
        task.wait(60 / self.fireRate)
      end
      self.shooting = false
    end)
end

function AdminGunController:startShoot2()

end

function AdminGunController:init()

end