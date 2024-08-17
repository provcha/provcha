local AdminGunController = {}
AdminGunController.__index = AdminGunController

function AdminGunController.new(model)
    local self = setmetatable({}, AdminGunController)
    self.fireRate = 999999
    self.getHit = require(game.ReplicatedStorage.getHit)
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

  local fireMode = self.blaster:GetAttribute(Constants.FIRE_MODE_ATTRIBUTE)
  local rateOfFire = self.blaster:GetAttribute(Constants.RATE_OF_FIRE_ATTRIBUTE)

  if fireMode == Constants.FIRE_MODE.SEMI then
    self.shooting = true
    self:shoot()
    task.delay(60 / rateOfFire, function()
      self.shooting = false

      if self.ammo == 0 then
        self:reload()
      end
    end)
  elseif fireMode == Constants.FIRE_MODE.AUTO then
    task.spawn(function()u
      self.shooting = true
      while self.activated and self:canShoot() do
        self:shoot()
        task.wait(60 / rateOfFire)
      end
      self.shooting = false

      if self.ammo == 0 then
        self:reload()
      end
    end)
  end
end

function AdminGunController:startShoot2()

end

function AdminGunController:init()

end