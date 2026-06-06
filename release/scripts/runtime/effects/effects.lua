local debug_print = require("scripts/runtime/debug/print.lua")

local effects = {}

function effects.pick_chaos_effect()
    if debug_print then
        debug_print.print_picked_effect("eff")
    end
end

return effects


-- local devMode = false
-- local REFIRE_INTERVAL

-- if devMode then
--     REFIRE_INTERVAL = 120
-- else
--     REFIRE_INTERVAL = settings.global["chaos-refire-interval"].value * 60
-- end


-- global.nextChaosTimerRefire = REFIRE_INTERVAL
-- global.activeChaosEffects = {}

-- local chaosEffects = {}

-- function addChaosEffect(effect)
--     if devMode then
--         addChaosEffectDev(effect)
--         return
--     end
--     if not effect.name then return end
--     if settings.global["chaos-effect-" .. effect.name].value == false then return end
--     local effectEntry = effect
--     effectEntry.effectFunction = effectEntry.effectFunction or function() game.print("Invalid effect function") end
--     effectEntry.resetFunction = effectEntry.resetFunction or nil
--     effectEntry.description = effectEntry.description or "Invalid description"
--     effectEntry.duration = effectEntry.duration and
--         mathlib.roundTo(settings.global["chaos-duration-multiplier"].value * effectEntry.duration, 1) or 1800
--     effectEntry.gain = effectEntry.gain or 0
--     effectEntry.id = #chaosEffects + 1

--     table.insert(chaosEffects, effectEntry)
-- end

-- function addChaosEffectDev(effect)
--     local effectEntry = effect
--     effectEntry.effectFunction = effectEntry.effectFunction or function() game.print("Invalid effect function") end
--     effectEntry.resetFunction = effectEntry.resetFunction or nil
--     effectEntry.description = effectEntry.description or "Invalid description"
--     effectEntry.duration = effectEntry.duration or 60
--     effectEntry.gain = effectEntry.gain or 0
--     effectEntry.id = #chaosEffects + 1

--     table.insert(chaosEffects, effectEntry)
-- end

-- if devMode then
--     require("release.scripts.runtime.debug.effects-debug")
-- else
--     require("effects")
-- end

-- function isChaosEffectAlreadyActive(id)
--     for _, activeChaosEffect in pairs(global.activeChaosEffects) do
--         if id == activeChaosEffect.id then
--             return true
--         end
--     end

--     return false
-- end

-- function addActiveChaosEffect(chaosEffect, endOnTick, effectFunctionTable)
--     local effect = {}
--     effect.id = chaosEffect.id
--     effect.duration = chaosEffect.duration
--     effect.effectFunctionTable = effectFunctionTable
--     effect.endOnTick = endOnTick

--     table.insert(global.activeChaosEffects, effect)
-- end

-- function formatPrintedEffectDescription(chaosEntry, effectFunctionTable)
--     local description = effectFunctionTable.description or chaosEntry.description
--     local gain = effectFunctionTable.gain or chaosEntry.gain

--     gain = (gain < -3 or gain > 3) and 0 or gain

--     local gainTable = {}
--     gainTable[3] = "[color=0, 255, 0]"
--     gainTable[2] = "[color=64, 255, 64]"
--     gainTable[1] = "[color=128, 225, 128]"
--     gainTable[0] = "[color=200, 200, 200]"
--     gainTable[-1] = "[color=225, 128, 128]"
--     gainTable[-2] = "[color=255, 64, 64]"
--     gainTable[-3] = "[color=255, 0, 0]"

--     return { "", gainTable[gain], description, "[/color]" }
-- end

-- function pickRandomChaosEffect()
--     if #chaosEffects < 1 then return end

--     for try = 1, 10 do
--         local randomIndex = mathlib.random(#chaosEffects)
--         local chaosEntry = chaosEffects[randomIndex]

--         if not isChaosEffectAlreadyActive(chaosEntry.id) then
--             local effectFunctionTable = chaosEntry.effectFunction() or
--                 { gain = chaosEntry.gain, description = chaosEntry.description }

--             for id, player in pairs(game.players) do
--                 if settings.get_player_settings(id)["chaos-messages-in-chat"].value then
--                     player.print(formatPrintedEffectDescription(chaosEntry, effectFunctionTable))
--                 end

--                 addEffectToPlayerGUI(player, chaosEntry, effectFunctionTable)
--             end

--             addActiveChaosEffect(chaosEntry, game.tick + chaosEntry.duration, effectFunctionTable)

--             break
--         end
--     end
-- end
