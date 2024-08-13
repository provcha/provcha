local AdminGunController = {}
AdminGunController.__index = AdminGunController

function AdminGunController.new(model)
    local self = setmetatable({}, AdminGunController)
    self.fireRate = 999999
    self:init()
    return self
end