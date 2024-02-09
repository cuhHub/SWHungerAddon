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
            long = "An addon that adds a hunger system to Stormworks. Use '?eat' with fish in your inventory to replenish hunger."
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
        debugEnabled = true,
        isDedicatedServer = false
    }
}