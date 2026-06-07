-- local player_gui = require("scripts.runtime.gui.player.lua")
local effects = require("scripts.runtime.effects.effects")
local effects_defines = require("scripts.runtime.effects.defines")

local debug_print = require("scripts.runtime.debug.print")
local debug_overlay = require("scripts.runtime.debug.overlay")

local timer = require("scripts.lib.timer")



local chaos_timer = timer.new(180, function()
    local effect = effects.pick_chaos_effect()
    table.insert(storage.active_effects, effect)
    if debug_overlay then
        debug_overlay.add_effect(effect)
    end
end)

storage.chaos_timer = storage.chaos_timer or 0
storage.active_effects = storage.active_effects or {}


commands.add_command("print_enabled_effects", nil, function(command)
    debug_print.player_print(effects.enabled_effects, "Enabled effects: ")
end)
commands.add_command("print_globals", nil, function(command)
    debug_print.player_print(storage, "Globals: ")
end)
commands.add_command("toggle_timer", nil, function(command)
    timer.toggle(chaos_timer)
end)
commands.add_command("set_timer", nil, function(command)
    timer.set_time(chaos_timer, command.parameter)
end)

script.on_load(function()
    timer.set_time(chaos_timer, storage.chaos_timer)
end)


script.on_event(defines.events.on_player_created, function(event)
    if player_gui then player_gui.create_player_gui(event) end
    if debug_overlay then debug_overlay.create_gui(event) end
end)

script.on_event(defines.events.on_tick, function(event)
    timer.tick(chaos_timer)
    storage.chaos_timer = timer.get_time(chaos_timer)


    if debug_overlay then
        debug_overlay.update(event, chaos_timer)
    end
end)
