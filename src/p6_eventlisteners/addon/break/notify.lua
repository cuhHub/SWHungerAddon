--------------------------------------------------------
-- [Event Listeners] Addon - Break - Notify
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
-- Notify everyone when the addon breaks
AuroraFramework.services.debuggerService.events.onAddonStop:connect(function()
    helpersLibrary.chat.send(
        "Sorry, the addon has broken. Please run '?reload_scripts' to temporarily fix the issue.\nPlease notify the developer (@%s) in the Discord server below.\n[%s]",
        nil,
        addonConfiguration.credit.discordUsername,
        addonConfiguration.credit.discordServerInvite
    )
end)