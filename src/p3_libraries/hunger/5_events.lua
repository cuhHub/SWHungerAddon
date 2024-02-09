--------------------------------------------------------
-- [Libraries] Hunger - Events
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
hungerLibrary.events = {
    consuming = AuroraFramework.libraries.events.create(""), -- player (player that is consuming whatever), boolean: (false = started consuming, true = finished consuming), consumable: (the consumable the player is eating)
    damage = AuroraFramework.libraries.events.create(""), -- player (player that is taking damage from having hunger below dying threshold), damageTaken (player the damage took)
    hungerLoss = AuroraFramework.libraries.events.create("") -- player (player that is losing hunger), amountLost (amount of hunger the player lost)
}