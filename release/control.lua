local globals = require("scripts/runtime/globals")
-- local player_gui = require("scripts/runtime/gui/player.lua")
local effects = require("scripts/runtime/effects/effects")
local effects_defines = require("scripts/runtime/effects/defines")

local debug_print = require("scripts/runtime/debug/print")
local debug_overlay = require("scripts/runtime/debug/overlay")
local debug_effects = require("scripts/runtime/debug/effects")


storage.chaos_timer = 0
storage.chaos_timer_interval = 60
storage.active_effects = {}


commands.add_command("print_enabled_effects", nil,
    function() debug_print.print_enabled_effects(effects.enabled_effects) end)
commands.add_command("print_globals", nil, debug_print.print_globals)
commands.add_command("print_active_effects", nil, debug_print.print_active_effects)
commands.add_command("toggle_timer", nil, debug_effects.timer.toggle)
commands.add_command("fill_timer", nil, debug_effects.timer.set_full_time)

-- for k, effect in pairs(effects_defines) do
--     effects.register_chaos_effect(effect)
-- end



script.on_event(defines.events.on_player_created, function(event)
    if player_gui then player_gui.create_player_gui(event) end
    if debug_overlay then debug_overlay.create_gui(event) end
end)

script.on_event(defines.events.on_tick, function(event)
    if globals then
        if globals.timer_is_full() then
            local effect = effects.pick_chaos_effect()
            table.insert(storage.active_effects, effect)
            globals.reset_timer()
            if debug_overlay then
                debug_overlay.add_effect(effect)
            end
        else
            if debug_effects then
                if debug_effects.timer_enabled then
                    globals.increase_timer()
                end
            else
                globals.increase_timer()
            end
        end
    end
    if debug_overlay then
        debug_overlay.update()
    end
end)
