--------------------------------------------------------
-- [Libraries] Helpers - Chat
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
helpersLibrary.chat = {
    ---@param message string
    ---@param targetPlayer af_services_player_player|nil
    ---@param ... any
    send = function(message, targetPlayer, ...)
        return AuroraFramework.services.chatService.sendMessage(
            ("[%s]"):format(addonConfiguration.information.addonName),
            ... and message:format(...) or message,
            targetPlayer
        )
    end
}