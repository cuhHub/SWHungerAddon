--------------------------------------------------------
-- [Libraries] Cooldown
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
g_savedata.cooldownLibrary = {
    ---@type table<string, addon_libs_cooldown_cooldown>
    activeCooldowns = {}
}

cooldownLibrary = {
    initialize = function()
        AuroraFramework.callbacks.onTick.main:connect(function()
            for index, cooldown in pairs(g_savedata.cooldownLibrary.activeCooldowns) do
                if server.getTimeMillisec() < cooldown.endTime then
                    goto continue
                end

                g_savedata.cooldownLibrary.activeCooldowns[index] = nil

                ::continue::
            end
        end)
    end,

    ---@param key string
    ---@param duration number
    createCooldown = function(key, duration)
        g_savedata.cooldownLibrary.activeCooldowns[key] = {
            key = key,
            endTime = server.getTimeMillisec() + (duration * 1000)
        }
    end,

    ---@param key string
    hasCooldown = function(key)
        return g_savedata.cooldownLibrary.activeCooldowns[key] ~= nil
    end,

    ---@param key string
    removeCooldown = function(key)
        g_savedata.cooldownLibrary.activeCooldowns[key] = nil
    end,

    ---@param player af_services_player_player
    ---@param key string
    ---@param duration number
    createCooldownForPlayer = function(player, key, duration)
        cooldownLibrary.createCooldown(
            player.properties.steam_id..key,
            duration
        )
    end,

    ---@param player af_services_player_player
    ---@param key string
    playerHasCooldown = function(player, key)
        return cooldownLibrary.hasCooldown(player.properties.steam_id..key)
    end,

    ---@param player af_services_player_player
    ---@param key string
    removePlayerCooldown = function(player, key)
        return cooldownLibrary.removeCooldown(player.properties.steam_id..key)
    end
}