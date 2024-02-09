--------------------------------------------------------
-- [Event Listeners] Addon - Hunger - On Consume
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
-- Send a message when a player consumes something
---@param player af_services_player_player
---@param hasFinished boolean
---@param consumable addon_libs_hunger_consumable
hungerLibrary.events.consuming:connect(function(player, hasFinished, consumable)
    if not hasFinished then
        AuroraFramework.services.notificationService.info(
            "Consuming",
            ("You have started eating '%s'."):format(consumable.properties.name),
            player
        )
    else
        if consumable.properties.hungerGain > 0 then
            AuroraFramework.services.notificationService.success(
                "Consuming",
                ("Yum! You have finished eating '%s'.\n%s Hunger."):format(consumable.properties.name, hungerLibrary.utils.formatGivenHunger(consumable.properties.hungerGain)),
                player
            )
        else
            AuroraFramework.services.notificationService.warning(
                "Consuming",
                ("Eh.. You have finished eating '%s', but it has made you more hungry.\n%s Hunger."):format(consumable.properties.name, hungerLibrary.utils.formatGivenHunger(consumable.properties.hungerGain)),
                player
            )
        end
    end
end)