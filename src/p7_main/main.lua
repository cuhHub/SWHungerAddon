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
    12,
    4.5
)

hungerLibrary.consumables.registerConsumable(
    "Anglerfish",
    83,
    10,
    5.0
)

hungerLibrary.consumables.registerConsumable(
    "Arctic Char",
    84,
    15,
    6.0
)

hungerLibrary.consumables.registerConsumable(
    "Ballan Lizardfish",
    85,
    11,
    4.8
)

hungerLibrary.consumables.registerConsumable(
    "Ballan Wrasse",
    86,
    13,
    5.2
)

hungerLibrary.consumables.registerConsumable(
    "Barreleye Fish",
    87,
    9,
    6.5
)

hungerLibrary.consumables.registerConsumable(
    "Black Bream",
    88,
    14,
    5.5
)

hungerLibrary.consumables.registerConsumable(
    "Black Dragonfish",
    89,
    8,
    7.0
)

hungerLibrary.consumables.registerConsumable(
    "Clown Fish",
    90,
    7,
    4.2
)

hungerLibrary.consumables.registerConsumable(
    "Cod",
    91,
    16,
    5.8
)

hungerLibrary.consumables.registerConsumable(
    "Dolphinfish",
    92,
    12,
    5.0
)

hungerLibrary.consumables.registerConsumable(
    "Gulper Eel",
    93,
    6,
    7.8
)

hungerLibrary.consumables.registerConsumable(
    "Haddock",
    94,
    15,
    6.3
)

hungerLibrary.consumables.registerConsumable(
    "Hake",
    95,
    13,
    4.9
)

hungerLibrary.consumables.registerConsumable(
    "Herring",
    96,
    11,
    5.4
)

hungerLibrary.consumables.registerConsumable(
    "John Dory",
    97,
    10,
    6.2
)

hungerLibrary.consumables.registerConsumable(
    "Labrus",
    98,
    14,
    5.6
)

hungerLibrary.consumables.registerConsumable(
    "Lanternfish",
    99,
    8,
    6.7
)

hungerLibrary.consumables.registerConsumable(
    "Mackerel",
    100,
    12,
    5.3
)

hungerLibrary.consumables.registerConsumable(
    "Midshipman",
    101,
    7,
    4.7
)

hungerLibrary.consumables.registerConsumable(
    "Perch",
    102,
    13,
    5.1
)

hungerLibrary.consumables.registerConsumable(
    "Pike",
    103,
    16,
    5.9
)

hungerLibrary.consumables.registerConsumable(
    "Pinecone Fish",
    104,
    9,
    6.6
)

hungerLibrary.consumables.registerConsumable(
    "Pollack",
    105,
    14,
    5.2
)

hungerLibrary.consumables.registerConsumable(
    "Red Mullet",
    106,
    11,
    5.4
)

hungerLibrary.consumables.registerConsumable(
    "Rockfish",
    107,
    10,
    6.1
)

hungerLibrary.consumables.registerConsumable(
    "Sablefish",
    108,
    15,
    6.0
)

hungerLibrary.consumables.registerConsumable(
    "Salmon",
    109,
    16,
    5.8
)

hungerLibrary.consumables.registerConsumable(
    "Sardine",
    110,
    7,
    4.3
)

hungerLibrary.consumables.registerConsumable(
    "Scad",
    111,
    13,
    5.7
)

hungerLibrary.consumables.registerConsumable(
    "Sea Bream",
    112,
    12,
    5.0
)

hungerLibrary.consumables.registerConsumable(
    "Sea Halibut",
    113,
    14,
    6.2
)

hungerLibrary.consumables.registerConsumable(
    "Piranha",
    114,
    -10,
    7.2
)

hungerLibrary.consumables.registerConsumable(
    "Seabass",
    115,
    15,
    5.6
)

hungerLibrary.consumables.registerConsumable(
    "Slimehead",
    116,
    8,
    6.8
)

hungerLibrary.consumables.registerConsumable(
    "Snapper",
    117,
    12,
    5.4
)

hungerLibrary.consumables.registerConsumable(
    "Golden Snapper",
    118,
    16,
    5.9
)

hungerLibrary.consumables.registerConsumable(
    "Snook",
    119,
    13,
    5.5
)

hungerLibrary.consumables.registerConsumable(
    "Spadefish",
    120,
    10,
    6.3
)

hungerLibrary.consumables.registerConsumable(
    "Trout",
    121,
    15,
    5.7
)

hungerLibrary.consumables.registerConsumable(
    "Tubeshoulders Fish",
    122,
    7,
    4.6
)

hungerLibrary.consumables.registerConsumable(
    "Viperfish",
    123,
    -6,
    7.5
)

hungerLibrary.consumables.registerConsumable(
    "Yellowfin Tuna",
    124,
    18,
    6.0
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