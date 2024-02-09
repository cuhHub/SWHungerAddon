--------------------------------------------------------
-- [Commands] Normal - Help
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
    -- format commands
    local commandsFormatted = {}

    for _, commandToDisplay in pairs(AuroraFramework.services.commandService.commands) do
        -- format shorthands
        local formattedShorthands = {}

        for _, shorthand in pairs(commandToDisplay.properties.shorthands) do
            table.insert(formattedShorthands, "?"..shorthand)
        end

        -- add formatted command to table
        local commandFormatted = table.concat({
            ("?%s | %s"):format(commandToDisplay.properties.name, commandToDisplay.properties.description),
            table.concat(formattedShorthands, ", "),
            (commandToDisplay.properties.requiresAdmin and "Requires Admin" or commandToDisplay.properties.requiresAuth and "Requires Auth") or "Requires No Permissions"
        }, "\n")

        table.insert(commandsFormatted, commandFormatted)
    end

    -- send help message
    helpersLibrary.chat.send(
        table.concat({
            "Addon Information -----",
            addonConfiguration.information.description.long,
            "",
            "Commands -----",
            table.concat(commandsFormatted, "\n")
        }, "\n---"),

        player
    )
end, "help", {"h"}, false, "Shows all commands, as well as addon information.")