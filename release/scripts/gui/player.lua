local gui_settings = require("scripts.gui.settings")
local globals = require("scripts.globals.globals")
local mathlib = require("scripts.lib.math")
local debug_print = require("scripts.debug.print")

local gui = {}

local chaos_main_frame = "chaos_mainframe"
local chaos_timer_progress_bar = "chaos_timer"
local chaos_effects_frame = "chaos_effectsframe"



function gui.create_player_gui(event)
    if not game then
        return
    end

    local player = game.get_player(event.player_index)

    if not player then
        return
    end

    local screen_element = player.gui.screen
    local main_frame = screen_element.add { type = "flow", name = chaos_main_frame, direction = "vertical" }
    local style = main_frame.style
    style.padding = { 0, 0, 0, 0 }
    style.width = 320
    style.vertical_spacing = 0
    style.height = 376

    local progressbar = main_frame.add { type = "progressbar", name = chaos_timer_progress_bar }
    local style = progressbar.style
    style.bar_width = 8
    style.horizontally_stretchable = true
    style.margin = { 0, 0, 8, 0 }
end

function gui.add_effect(effect_name, id)
    if not game then
        return
    end

    for _, player in pairs(game.players) do
        if player then
            local screen_element = player.gui.screen

            if screen_element[chaos_main_frame] then
                local main_frame = screen_element[chaos_main_frame]
                local chaoseffect_frame = main_frame.add { type = "flow", name = "chaoseffect_" .. id, direction = "vertical" }

                chaoseffect_frame.add { type = "progressbar", name = "chaoseffect_" .. id .. "_progressbar", value = 1 }
                chaoseffect_frame.add { type = "label", name = "chaoseffect_" .. id .. "_label", caption = { "chaos-description." .. effect_name } }
            end
        end
    end
end

function gui.update_player_gui(event)
    if not game then
        return
    end

    for _, player in pairs(game.players) do
        if player then
            local screen_element = player.gui.screen

            if screen_element[chaos_main_frame] then
                local main_frame = screen_element[chaos_main_frame]

                if main_frame[chaos_timer_progress_bar] then
                    local progress_bar = main_frame[chaos_timer_progress_bar]

                    progress_bar.value = mathlib.normalize(storage.chaos_timer:get_time(), 0,
                        storage.chaos_timer:get_duration())
                end

                for id, effect in pairs(storage.active_effects) do
                    if main_frame["chaoseffect_" .. id] then
                        local chaoseffect_frame = main_frame["chaoseffect_" .. id]

                        if chaoseffect_frame["chaoseffect_" .. id .. "_progressbar"] then
                            chaoseffect_frame["chaoseffect_" .. id .. "_progressbar"].value = mathlib.normalize(
                                effect.timer:get_time(), 0,
                                effect.timer:get_duration())
                        end
                    end
                end
            end
        end
    end
end

function gui.remove_effect(event, effect_id)
    if not game then
        return
    end

    for _, player in pairs(game.players) do
        if player then
            local screen_element = player.gui.screen

            if screen_element[chaos_main_frame] then
                local main_frame = screen_element[chaos_main_frame]

                debug_print.player_print(main_frame, "Main Frame: ")

                main_frame["chaoseffect_" .. effect_id].destroy()
            end
        end
    end
end

return gui


-- function removeEffectFromPlayerGUI(id)
--     for _, player in pairs(game.players) do
--         if player.gui.top.chaos_frame then
--             local mainFrame = player.gui.top.chaos_frame

--             if mainFrame["effect_" .. id] then
--                 mainFrame["effect_" .. id].destroy()
--             end
--         end
--     end
-- end

-- function updateActiveChaosEffects()
--     for idEffect, activeChaosEffect in pairs(global.activeChaosEffects) do
--         if activeChaosEffect.endOnTick <= game.tick then
--             local effect = chaosEffects[activeChaosEffect.id]

--             if effect.resetFunction then effect.resetFunction(activeChaosEffect.effectFunctionTable) end

--             removeEffectFromPlayerGUI(activeChaosEffect.id)
--             table.remove(global.activeChaosEffects, idEffect)
--         end
--     end
-- end

-- function addEffectToPlayerGUI(player, chaosEntry, effectFunctionTable)
--     local id = chaosEntry.id

--     if player.gui.top.chaos_frame then
--         local mainFrame = player.gui.top.chaos_frame

--         if mainFrame["effect_" .. id] then return end

--         local frame = mainFrame.add { type = "flow", name = "effect_" .. id, direction = "vertical" }
--         local style = frame.style
--         style.padding = { 0, 10, 0, 10 }
--         style.vertical_align = "center"
--         style.height = 36
--         style.horizontally_stretchable = true

--         local label = frame.add { type = "label", name = "effect_" .. id .. "_label", caption = effectFunctionTable
--             .description or chaosEntry.description }
--         local style = label.style
--         style.font = "default-small"


--         if chaosEntry.resetFunction then
--             local progressbar = frame.add { type = "progressbar", name = "effect_" .. id .. "_progressbar" }
--             local style = progressbar.style
--             style.bar_width = 6
--             style.horizontally_stretchable = true
--         end
--     end
-- end

-- function updatePlayerGUI()
--     for _, player in pairs(game.players) do
--         if player.gui.top.chaos_frame then
--             local mainFrame = player.gui.top.chaos_frame

--             if mainFrame.chaos_progressbar then
--                 mainFrame.chaos_progressbar.value = (game.tick - global.nextChaosTimerRefire + REFIRE_INTERVAL) /
--                     REFIRE_INTERVAL
--             end

--             for _, activeChaosEffect in pairs(global.activeChaosEffects) do
--                 if mainFrame["effect_" .. activeChaosEffect.id] then
--                     if mainFrame["effect_" .. activeChaosEffect.id]["effect_" .. activeChaosEffect.id .. "_progressbar"] then
--                         mainFrame["effect_" .. activeChaosEffect.id]["effect_" .. activeChaosEffect.id .. "_progressbar"].value = (activeChaosEffect.endOnTick - game.tick) /
--                             activeChaosEffect.duration
--                     end
--                 end
--             end
--         end
--     end
-- end
