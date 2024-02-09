--------------------------------------------------------
-- [Commands] Normal - Hunger
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
    local hunger = hungerLibrary.getHunger(player)

    helpersLibrary.chat.send(
        "Your hunger is %s/%s.",
        player,
        math.floor(hunger),
        hungerLibrary.configuration.maxHunger
    )
end, "hungerlevel", {"hunger", "hu"}, false, "Shows your hunger level.")