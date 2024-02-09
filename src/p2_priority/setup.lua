--------------------------------------------------------
-- [Priority] Setup
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
-- Create logger
mainLogger = AuroraFramework.services.debuggerService.createLogger("Main", false)
mainLogger:setSuppressed(not addonConfiguration.dev.debugEnabled)

-- Dedicated server support
AuroraFramework.services.playerService.setDedicatedServer(addonConfiguration.dev.isDedicatedServer)