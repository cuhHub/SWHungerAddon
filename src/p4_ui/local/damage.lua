--------------------------------------------------------
-- [UI] Local - Damage
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/SWHungerAddon
 
    ----------------------------
]]

-------------------------------
-- // Variables
-------------------------------
local damageUIShowTime = 1 -- seconds

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
        AuroraFramework.services.UIService.name("DamageUI", player),
        "!!",
        0,
        0,
        player
    )

    UI.properties.visible = false
    UI:refresh()
end)

---@param player af_services_player_player
---@param damageDealt number
hungerLibrary.events.damage:connect(function(player, damageDealt)
    -- get UI
    local UI = AuroraFramework.services.UIService.getScreenUI(AuroraFramework.services.UIService.name("DamageUI", player))

    if not UI then -- likely that UI isnt enabled
        return
    end

    -- check if UI change is on cooldown
    if cooldownLibrary.playerHasCooldown(player, "DamageUI") then
        return
    end

    -- show, then hide UI
    UI.properties.text = ("[!!] -%s HP [!!]"):format(damageDealt)
    UI.properties.visible = true
    UI:refresh()

    AuroraFramework.services.timerService.delay.create(damageUIShowTime, function()
        UI.properties.visible = false
        UI:refresh()
    end)

    cooldownLibrary.createCooldownForPlayer(player, "DamageUI", damageUIShowTime)
end)