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
        if commandToDisplay.properties.description == "" then -- probably a hidden/debug command
            goto continue
        end

        -- format shorthands
        local formattedShorthands = {}

        for _, shorthand in pairs(commandToDisplay.properties.shorthands) do
            table.insert(formattedShorthands, "?"..shorthand)
        end

        -- format permissions
        local permissionsRequired = {}

        if command.properties.requiresAdmin then
            table.insert(permissionsRequired, "Admin")
        end

        if command.properties.requiresAuth then
            table.insert(permissionsRequired, "Auth")
        end

        if not permissionsRequired[1] then
            table.insert(permissionsRequired, "None")
        end

        -- add formatted command to table
        local commandFormatted = table.concat({
            ("?%s | %s"):format(commandToDisplay.properties.name, commandToDisplay.properties.description),
            "Shorthands: "..table.concat(formattedShorthands, ", "),
            "Permissions Required: "..table.concat(permissionsRequired, ", ")
        }, "\n\\____")

        table.insert(commandsFormatted, commandFormatted)

        ::continue::
    end

    -- send help message
    helpersLibrary.chat.send(
        table.concat({
            "Addon Information -----",
            addonConfiguration.information.description.long,
            "",
            "Commands -----",
            table.concat(commandsFormatted, "\n\n")
        }, "\n"),

        player
    )
end, "help", {"h"}, false, "Shows all commands, as well as addon information.")