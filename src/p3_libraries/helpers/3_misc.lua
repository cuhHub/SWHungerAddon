--------------------------------------------------------
-- [Libraries] Helpers - Misc
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
g_savedata.helpersLibrary = {
    id = 0
}

helpersLibrary.misc = {
    incrementalID = function()
        g_savedata.helpersLibrary.id = g_savedata.helpersLibrary.id + 1
        return g_savedata.helpersLibrary.id
    end,

    ---@param player af_services_player_player
    ---@param duration number
    ---@param callback fun(player: af_services_player_player, loop: af_services_timer_loop)
    loopUntilPlayerLeaves = function(player, duration, callback)
        return AuroraFramework.services.timerService.loop.create(duration, function(loop)
            if not AuroraFramework.services.playerService.getPlayerByPeerID(player.properties.peer_id) then
                loop:remove()
                return
            end

            callback(player, loop)
        end)
    end
}