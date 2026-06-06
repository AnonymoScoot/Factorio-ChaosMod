local globals = require("scripts/runtime/globals.lua")
-- local player_gui = require("scripts/runtime/gui/player.lua")
local debug_print = require("scripts/runtime/debug/print.lua")
local debug_overlay = require("scripts/runtime/debug/overlay.lua")
local effects = require("scripts/runtime/effects/effects.lua")

storage.chaos_timer = 0
storage.chaos_timer_interval = 60

script.on_event(defines.events.on_player_created, function(event)
    if player_gui then player_gui.create_player_gui(event) end
    if debug_overlay then debug_overlay.create_gui(event) end
end)

script.on_event(defines.events.on_tick, function(event)
    if globals then
        if globals.timer_is_full() then
            effects.pick_chaos_effect()
            globals.reset_timer()
        else
            globals.increase_timer()
        end
    end
    if debug_overlay then debug_overlay.update() end
end)
