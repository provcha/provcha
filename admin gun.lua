local AdminGunController = {}
AdminGunController.__index = AdminGunController

function AdminGunController.new(model)
    local self = setmetatable({}, AdminGunController)
    self.fireRate = 999999
    self:init()
    return self
end

function AdminGunController:shoot1()
    local hit, pos, _
end

function AdminGunController:shoot2()

end

function AdminGunController:startShoot1()

end

function AdminGunController:startShoot2()

end

function AdminGunController:init()

end