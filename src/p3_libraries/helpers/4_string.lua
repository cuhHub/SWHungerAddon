--------------------------------------------------------
-- [Libraries] Helpers - String
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
helpersLibrary.string = {
    ---@param tbl table<integer, string>
    formatTableToBulletList = function(tbl)
        return "- "..table.concat(tbl, "\n- ")
    end
}