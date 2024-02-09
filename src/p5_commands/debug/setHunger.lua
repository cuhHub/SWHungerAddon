--------------------------------------------------------
-- [Commands] Debug - Set Hunger
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

    hungerLibrary.setHunger(player, tonumber(args[1]) or hungerLibrary.configuration.startingHunger)
end, "sethunger", {"sh"})