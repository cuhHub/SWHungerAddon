--------------------------------------------------------
-- [Main] Stormworks Hunger Addon
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
g_savedata.userAddonConfig = {
    -- do not split "property.blabla" over multiple lines. stormworks parses the text literally so it will not work and crash your game
    showUI = property.checkbox("UI - Show hunger level", true),
    startingHunger = property.slider("Hunger - Starting hunger level", 10.0, 100.0, 1.0, 80.0),
    hungerDecreaseTimer = property.slider("Hunger - Time between periods of losing hunger (seconds)", 60.0, 400.0, 1.0, 130.0),
    hungerDecreaseAmount = property.slider("Hunger - The amount of hunger lost per hunger loss period", 1.0, 20.0, 1.0, 3.0),
}

-------------------------------
-- // Functions
-------------------------------
-- Attach debug code into all functions in the top layer of the provided table
---@param funcs table<integer, function>
---@param logger af_services_debugger_logger
attachDebugCodeMultiple = function(funcs, logger)
    for _, func in pairs(funcs) do
        if type(func) ~= "function" then
            goto continue
        end

        AuroraFramework.services.debuggerService.attach(func, logger)

        ::continue::
    end
end

-------------------------------
-- // Main
-------------------------------
---------- // Main
-- // Setup Configuration
hungerLibrary.configuration.startingHunger = g_savedata.userAddonConfig.startingHunger
hungerLibrary.configuration.hungerDecreaseTimer = g_savedata.userAddonConfig.hungerDecreaseTimer
hungerLibrary.configuration.hungerDecreaseAmount = g_savedata.userAddonConfig.hungerDecreaseAmount

-- // Setup Consumables
hungerLibrary.consumables.createConsumable(
    "Anchovie",
    82,
    25,
    3
)

hungerLibrary.consumables.createConsumable(
    "Anglerfish",
    83,
    20,
    2
)

hungerLibrary.consumables.createConsumable(
    "Cod",
    91,
    32,
    5
)

hungerLibrary.consumables.createConsumable(
    "Mackerel",
    100,
    17,
    1
)

hungerLibrary.consumables.createConsumable(
    "Salmon",
    109,
    38,
    3
)

hungerLibrary.consumables.createConsumable(
    "Sardine",
    110,
    26,
    2
)

hungerLibrary.consumables.createConsumable(
    "Trout",
    121,
    20,
    4
)

-- // Library Initialization
hungerLibrary.initialize()
cooldownLibrary.initialize()