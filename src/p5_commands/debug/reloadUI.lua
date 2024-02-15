--------------------------------------------------------
-- [Commands] Debug - Reload UI
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

    for _, uiContainer in pairs(AuroraFramework.services.UIService.UI) do
        for _, ui in pairs(uiContainer) do
            ui:refresh()
        end
    end
end, "reloadui", {"ru"})