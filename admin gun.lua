local AdminGunController = {}
AdminGunController.__index = AdminGunController

function AdminGunController.new(model)
    local self = setmetatable({}, AdminGunController)
end