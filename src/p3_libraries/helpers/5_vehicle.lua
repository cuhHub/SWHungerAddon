--------------------------------------------------------
-- [Libraries] Helpers - Vehicle
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/SWHungerAddon

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
helpersLibrary.vehicle = {
    ---@param group af_services_group_group
    ---@param excludeOwner boolean|nil
    formatGroupName = function(group, excludeOwner)
        return ("Group #%s%s"):format(group.properties.group_id, not excludeOwner and (not group.properties.addonSpawned and " - Spawned by "..group.properties.owner.properties.name or " - Spawned by addon") or "")
    end,

    ---@param vehicle af_services_vehicle_vehicle
    ---@param excludeOwner boolean|nil
    formatVehicleName = function(vehicle, excludeOwner)
        return ("Vehicle #%s%s"):format(vehicle.properties.vehicle_id, not excludeOwner and (not vehicle.properties.addonSpawned and " - Spawned by "..vehicle.properties.owner.properties.name or " - Spawned by addon") or "")
    end
}