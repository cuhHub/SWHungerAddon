--------------------------------------------------------
-- [Libraries] Hunger - Main
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
g_savedata.hungerLibrary = {
    ---@type table<string, number> steam_id : hunger value 0-100
    playerHunger = {}
}

hungerLibrary = {
    ---------- // Initialization
    initialize = function()
        -- give player hunger data on join
        ---@param player af_services_player_player
        AuroraFramework.services.playerService.events.onJoin:connect(function(player)
            hungerLibrary.giveDataIfDoesntExist(player)
        end)

        -- set hunger to starting hunger when player respawns
        ---@param player af_services_player_player
        AuroraFramework.services.playerService.events.onRespawn:connect(function(player)
            hungerLibrary.setHunger(player, hungerLibrary.configuration.startingHunger)
        end)

        -- when a player has hunger under dying threshold, damage them
        AuroraFramework.services.timerService.loop.create(hungerLibrary.configuration.timeBetweenDyingDamage, function()
            for _, player in pairs(AuroraFramework.services.playerService.getAllPlayers()) do
                if not hungerLibrary.utils.isDying(player) then
                    goto continue
                end

                local damageToDeal = hungerLibrary.configuration.dyingDamageAmount

                player:damage(damageToDeal)
                hungerLibrary.events.damage:fire(player, damageToDeal)

                ::continue::
            end
        end)

        -- decrease hunger over time
        AuroraFramework.services.timerService.loop.create(hungerLibrary.configuration.hungerDecreaseTimer, function()
            for _, player in pairs(AuroraFramework.services.playerService.getAllPlayers()) do
                local amountToLose = hungerLibrary.configuration.hungerDecreaseAmount

                hungerLibrary.subtractHunger(
                    player,
                    amountToLose
                )

                hungerLibrary.events.hungerLoss:fire(player, amountToLose)
            end
        end)
    end,

    ---------- // Miscellaneous
    giveDataIfDoesntExist = function(player)
        if not hungerLibrary.getHunger(player) then
            hungerLibrary.setHunger(player, hungerLibrary.configuration.startingHunger)
        end
    end,

    ---------- // Getting/Setting
    ---@param player af_services_player_player
    ---@param amount number
    setHunger = function(player, amount)
        g_savedata.hungerLibrary.playerHunger[player.properties.steam_id] = hungerLibrary.utils.clamp(0, hungerLibrary.configuration.maxHunger, amount)
    end,

    ---@param player af_services_player_player
    getHunger = function(player)
        return g_savedata.hungerLibrary.playerHunger[player.properties.steam_id]
    end,

    ---@param player af_services_player_player
    ---@param amount number
    addHunger = function(player, amount)
        hungerLibrary.setHunger(
            player,
            hungerLibrary.getHunger(player) + amount
        )
    end,

    ---@param player af_services_player_player
    ---@param amount number
    subtractHunger = function(player, amount)
        hungerLibrary.setHunger(
            player,
            hungerLibrary.getHunger(player) - amount
        )
    end,

    ---@param player af_services_player_player
    ---@param slot SWSlotNumberEnum
    consume = function(player, slot)
        -- get the consumable from the inventory slot
        local consumable = hungerLibrary.consumables.getConsumableHeldByPlayer(player, slot)

        if not consumable then
            return
        end

        -- remove the consumable from the player's inventory
        player:removeItem(slot)

        -- start consuming
        hungerLibrary.events.consuming:fire(player, false, consumable)

        -- finish consuming
        AuroraFramework.services.timerService.delay.create(consumable.properties.timeToConsume, function()
            hungerLibrary.addHunger(player, consumable.properties.hungerGain)
            hungerLibrary.events.consuming:fire(player, true, consumable)
        end)
    end
}