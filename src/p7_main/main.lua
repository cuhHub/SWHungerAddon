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
    showUI = property.checkbox("UI - Show UI", true),
    startingHunger = property.slider("Hunger - Starting hunger level", 10.0, 100.0, 1.0, 80.0),
    hungerDecreaseTimer = property.slider("Hunger - Time between periods of losing hunger (seconds)", 60.0, 400.0, 1.0, 155.0),
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

-- // Register Consumables
hungerLibrary.consumables.registerConsumable(
    "Anchovie",
    82,
    18,
    3.9
)

hungerLibrary.consumables.registerConsumable(
    "Anglerfish",
    83,
    17,
    2.2
)

hungerLibrary.consumables.registerConsumable(
    "Cod",
    91,
    20,
    5
)

hungerLibrary.consumables.registerConsumable(
    "Mackerel",
    100,
    13,
    1.5
)

hungerLibrary.consumables.registerConsumable(
    "Salmon",
    109,
    17,
    3.4
)

hungerLibrary.consumables.registerConsumable(
    "Sardine",
    110,
    14,
    2.7
)

hungerLibrary.consumables.registerConsumable(
    "Trout",
    121,
    12,
    4.5
)

hungerLibrary.consumables.registerConsumable(
    "Viperfish",
    123,
    14,
    2.8
)

hungerLibrary.consumables.registerConsumable(
    "Snapper",
    117,
    -6,
    5.5
)

hungerLibrary.consumables.registerConsumable(
    "Piranha",
    114,
    -10,
    7.2
)

hungerLibrary.consumables.registerConsumable(
    "Tuna",
    124,
    16,
    5.7
)

hungerLibrary.consumables.registerConsumable(
    "First-Aid Kit",
    11,
    11,
    6
)

-- // Library Initialization
hungerLibrary.initialize()
cooldownLibrary.initialize()