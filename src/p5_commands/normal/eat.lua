--------------------------------------------------------
-- [Commands] Normal - Eat
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
    -- check if player is full
    if hungerLibrary.getHunger(player) >= hungerLibrary.configuration.maxHunger then
        return command:failureNotification(
            "You're too full to eat!",
            player
        )
    end

    -- check if this command has a cooldown
    if cooldownLibrary.playerHasCooldown(player, "eat") then
        return command:failureNotification(
            "Slow your roll! You're in the middle of consuming something.",
            player
        )
    end

    -- get consumables held by the player
    local consumablesInInventory = hungerLibrary.consumables.getAllConsumablesHeldByPlayer(player)

    if AuroraFramework.libraries.miscellaneous.getTableLength(consumablesInInventory) <= 0 then
        return command:failureNotification(
            "You aren't holding any consumable items. Use '?consumables' to find out what items are consumable.",
            player
        )
    end

    -- consume the first consumable
    local firstConsumableSlot, firstConsumable = next(consumablesInInventory)
    hungerLibrary.consume(player, firstConsumableSlot)

    -- add cooldown
    cooldownLibrary.createCooldownForPlayer(player, "eat", firstConsumable.properties.timeToConsume)
end, "eat", {"consume", "co", "e", "replenish", "re"}, false, "Eats the first consumable item in your inventory.")