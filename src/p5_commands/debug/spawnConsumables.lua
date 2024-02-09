--------------------------------------------------------
-- [Commands] Debug - Spawn Consumables
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
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    for _, consumable in pairs(hungerLibrary.consumables.getAllConsumables()) do
        server.spawnEquipment(player:getPosition(), consumable.properties.equipmentType, 100, 100)
    end
end, "spawnconsumables", {"sc"})