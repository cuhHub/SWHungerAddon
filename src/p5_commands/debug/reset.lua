--------------------------------------------------------
-- [Commands] Debug - Reset
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

    for _, playerToRemove in pairs(AuroraFramework.services.playerService.getAllPlayers()) do
        AuroraFramework.services.playerService.internal.removePlayerData(playerToRemove.properties.peer_id)
    end
end, "resetplayers", {"rp"})