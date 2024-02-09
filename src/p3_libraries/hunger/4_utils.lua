--------------------------------------------------------
-- [Libraries] Hunger - Utils
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
hungerLibrary.utils = {
    ---@param player af_services_player_player
    isStarving = function(player)
        local hunger = hungerLibrary.getHunger(player)
        return hunger <= hungerLibrary.configuration.starvingThreshold
    end,

    ---@param player af_services_player_player
    isDying = function(player)
        local hunger = hungerLibrary.getHunger(player)
        return hunger <= hungerLibrary.configuration.dyingThreshold
    end,

    ---@param hungerLevel number
    hungerBar = function(hungerLevel)
        return ("-"):rep(
            hungerLibrary.utils.clamp(math.floor(hungerLevel / 10), 1, hungerLibrary.configuration.maxHunger / 10)
        )
    end,

    formatGivenHunger = function(hunger)
        return (hunger >= 0 and "+" or "-")..math.floor(math.abs(hunger))
    end,

    clamp = AuroraFramework.libraries.miscellaneous.clamp
}