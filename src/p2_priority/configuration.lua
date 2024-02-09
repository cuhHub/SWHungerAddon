--------------------------------------------------------
-- [Priority] Configuration
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/SWHungerAddon

    ----------------------------
]]

-------------------------------
-- // Setup
-------------------------------
addonConfiguration = {
    credit = {
        discordUsername = "cuh6_",
        discordServerInvite = "https://dsc.gg/cuhhubsw"
    },

    information = {
        addonName = "Hunger Addon",

        description = {
            short = "An addon that adds a hunger system to Stormworks.",
            long = "An addon that adds a hunger system to Stormworks. Use '?eat' with a consumable in your inventory to replenish hunger. Use '?consumables' to see all consumable items."
        },

        requiredDLCs = {
            -- {
            --     name = "Space",
            --     enabled = AuroraFramework.attributes.SpaceEnabled
            -- },

            -- {
            --     name = "Industrial Frontier",
            --     enabled = AuroraFramework.attributes.AridEnabled
            -- },

            -- {
            --     name = "Weapons",
            --     enabled = AuroraFramework.attributes.WeaponsEnabled
            -- }
        }
    },

    dev = {
        debugEnabled = false,
        isDedicatedServer = false
    }
}