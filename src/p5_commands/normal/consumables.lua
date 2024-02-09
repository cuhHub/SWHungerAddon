--------------------------------------------------------
-- [Commands] Normal - Consumables
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
    -- get all cunsumables
    local consumables = hungerLibrary.consumables.getAllConsumables()

    -- format them
    local formatted = {}

    for _, consumable in pairs(consumables) do
        table.insert(formatted, ("%s | +%s Hunger, %.1fs to consume"):format(consumable.properties.name, consumable.properties.hungerGain, consumable.properties.timeToConsume))
    end

    -- send them to the player
    command:successNotification(
        "All consumable items have been sent in chat.",
        player
    )

    helpersLibrary.chat.send(
        "Consumables:\n"..table.concat(formatted, "\n"),
        player
    )
end, "consumables", {"cons"}, false, "Lists all consumables you can eat.")