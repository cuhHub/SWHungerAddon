--------------------------------------------------------
-- [Event Listeners] Player - On Join - Info Message
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
-- Show information when a player joins
---@param player af_services_player_player
AuroraFramework.services.playerService.events.onJoin:connect(function(player)
    AuroraFramework.services.timerService.delay.create(1, function() -- wait a little because messages don't show if they are sent right when a player joins
        -- Format DLCs
        DLCsFormatted = {}
        missingDLCsCount = 0

        for _, dlc in pairs(addonConfiguration.information.requiredDLCs) do
            if not dlc.enabled then
                missingDLCsCount = missingDLCsCount + 1
            end

            table.insert(
                DLCsFormatted,
                ("[%s | %s]"):format(dlc.name, dlc.enabled and "Enabled" or "Disabled")
            )
        end

        DLCsBulletList = helpersLibrary.string.formatTableToBulletList(DLCsFormatted)

        if #DLCsFormatted <= 0 then
            DLCsBulletList = "No DLCs required."
        end

        -- Send credit message
        helpersLibrary.chat.send(
            table.concat({
                ("This server has the \"%s\" enabled."):format(addonConfiguration.information.addonName),
                addonConfiguration.information.description.long,
                "---",
                ("Required DLCs:\n%s"):format(DLCsBulletList),
                missingDLCsCount > 0 and ("[!!] If you are the host, please create a new save with the required DLCs enabled. Missing %s DLC(s).\n---"):format(missingDLCsCount) or "---",
                addonConfiguration.credit.discordServerInvite,
                ("Created by @%s (Discord)."):format(addonConfiguration.credit.discordUsername)
            }, "\n"),

            player
        )
    end)
end)