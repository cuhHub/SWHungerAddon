--------------------------------------------------------
-- [UI] Local - Eating
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
---@param player af_services_player_player
AuroraFramework.services.playerService.events.onJoin:connect(function(player)
    -- only show if allowed
    if not g_savedata.userAddonConfig.showUI then
        return
    end

    -- create UI
    local UI = AuroraFramework.services.UIService.createScreenUI(
        AuroraFramework.services.UIService.name("EatingUI", player),
        "Eating...",
        0,
        -0.1,
        player
    )

    UI.properties.visible = false
    UI:refresh()
end)

---@param player af_services_player_player
---@param hasFinished boolean
---@param consumable addon_libs_hunger_consumable
hungerLibrary.events.consuming:connect(function(player, hasFinished, consumable)
    local UI = AuroraFramework.services.UIService.getScreenUI(AuroraFramework.services.UIService.name("EatingUI", player))

    if not UI then
        return
    end

    UI.properties.visible = hasFinished
    UI:refresh()
end)