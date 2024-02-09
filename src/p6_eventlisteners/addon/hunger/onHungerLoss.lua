--------------------------------------------------------
-- [Event Listeners] Addon - Hunger - On Hunger Loss
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
-- Send a message when a player loses hunger
---@param player af_services_player_player
---@param amountToLose number
hungerLibrary.events.hungerLoss:connect(function(player, amountToLose)
    AuroraFramework.services.notificationService.warning(
        "Hunger",
        ("%s hunger. Uh oh!"):format(hungerLibrary.utils.formatGivenHunger(-amountToLose)),
        player
    )
end)