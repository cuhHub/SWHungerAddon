--------------------------------------------------------
-- [Libraries] Hunger - Consumables
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
hungerLibrary.consumables = {
    ---@type table<SWEquipmentTypeEnum, addon_libs_hunger_consumable>
    consumableList = {},

    ---@param name string
    ---@param equipmentType SWEquipmentTypeEnum
    ---@param hungerGain number
    ---@param timeToConsume number
    registerConsumable = function(name, equipmentType, hungerGain, timeToConsume)
        ---@type addon_libs_hunger_consumable
        local consumable = AuroraFramework.libraries.class.create(
            "HungerLibrary-Consumable",
            nil,

            {
                name = name,
                equipmentType = equipmentType,
                hungerGain = hungerGain,
                timeToConsume = timeToConsume
            },

            nil,

            hungerLibrary.consumables.consumableList,
            equipmentType
        )

        return consumable
    end,

    ---@param equipmentType SWEquipmentTypeEnum
    removeConsumable = function(equipmentType)
        hungerLibrary.consumables.consumableList[equipmentType] = nil
    end,

    ---@param equipmentType SWEquipmentTypeEnum
    getConsumableFromEquipmentType = function(equipmentType)
        return hungerLibrary.consumables.consumableList[equipmentType]
    end,

    getAllConsumables = function()
        return hungerLibrary.consumables.consumableList
    end,

    ---@param player af_services_player_player
    ---@param consumable addon_libs_hunger_consumable
    isPlayerHoldingConsumable = function(player, consumable)
        for slot = 1, 10 do
            if player:getItem(slot) == consumable.properties.equipmentType then
                return true
            end
        end

        return false
    end,

    ---@param player af_services_player_player
    ---@param slot SWSlotNumberEnum
    getConsumableHeldByPlayer = function(player, slot)
        local item = player:getItem(slot)
        return hungerLibrary.consumables.getConsumableFromEquipmentType(item)
    end,

    ---@param player af_services_player_player
    getAllConsumablesHeldByPlayer = function(player)
        ---@type table<integer, addon_libs_hunger_consumable>
        local list = {}

        for slot = 1, 10 do
            local consumable = hungerLibrary.consumables.getConsumableHeldByPlayer(player, slot)

            if not consumable then
                goto continue
            end

            list[slot] = consumable

            ::continue::
        end

        return list
    end
}