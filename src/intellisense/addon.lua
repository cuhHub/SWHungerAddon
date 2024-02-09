--------------------------------------------------------
-- [Intellisense] Addon
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/SWHungerAddon

    ----------------------------
]]

-------------------------------
-- // Lua LSP Diagnostics
-------------------------------
---@diagnostic disable

-------------------------------
-- // Main
-------------------------------
---@class addon_libs_hunger_consumable: af_libs_class_class
_ = {
    __name__ = "HungerLibrary-Consumable",

    properties = {
        name = "",
        equipmentType = 0, ---@type SWEquipmentTypeEnum
        hungerGain = 0,
        timeToConsume = 0
    }
}

---@class addon_libs_cooldown_cooldown
_ = {
    key = "",
    endTime = 0
}