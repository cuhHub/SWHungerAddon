--------------------------------------------------------
-- [UI] Local - Hunger
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
    AuroraFramework.services.UIService.createScreenUI(
        AuroraFramework.services.UIService.name("HungerUI", player),
        "Setting up...",
        -0.9,
        0.9,
        player
    )
end)

AuroraFramework.services.timerService.loop.create(0, function()
    for _, player in pairs(AuroraFramework.services.playerService.getAllPlayers()) do
        -- get hunger ui
        local UI = AuroraFramework.services.UIService.getScreenUI(AuroraFramework.services.UIService.name("HungerUI", player))

        if not UI then
            goto continue
        end

        -- get player hunger level
        local hunger = hungerLibrary.getHunger(player)

        -- get whether or not player is dying/starving
        local isStarving = hungerLibrary.utils.isStarving(player)
        local isDying = hungerLibrary.utils.isDying(player)

        -- update ui
        UI.properties.text = table.concat({
            hungerLibrary.utils.hungerBar(hunger),
            ("%s/%s"):format(math.floor(hunger), hungerLibrary.configuration.maxHunger),
            ("[%s]"):format((isDying and "Dying" or isStarving and "Starving") or "Healthy")
        }, "\n")

        UI:refresh()

        ::continue::
    end
end)