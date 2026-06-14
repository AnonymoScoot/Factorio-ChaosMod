local player_gui = require("scripts.gui.player")

local effects = require("scripts.effects.effects")
local effects_defines = require("scripts.effects.defines")

local debug_print = require("scripts.debug.print")
-- local debug_overlay = require("scripts.debug.overlay")

local timer = require("scripts.lib.timer")
local handler = require("scripts.events.handler")

local globals = require("scripts.globals.globals")
local log = require("scripts.debug.log")



commands.add_command("print_enabled_effects", nil, function(command)
    debug_print.player_print(effects.enabled_effects, "Enabled effects: ")
end)
commands.add_command("print_globals", nil, function(command)
    debug_print.player_print(storage, "Globals: ")
end)
commands.add_command("toggle_timer", nil, function(command)
    storage.chaos_timer:toggle()
end)
commands.add_command("set_timer", nil, function(command)
    storage.chaos_timer:set_time(command.parameter)
end)

script.on_load(function()

end)

handler:add_listener(defines.events.on_player_created, function(event)
    if player_gui then player_gui.create_player_gui(event) end
    if debug_overlay then debug_overlay.create_gui(event) end
end)

handler:add_listener(defines.events.on_tick, function(event)
    for id, effect in pairs(storage.active_effects) do
        if effect.timer:tick() then
            effects.revert_effect_changes(effect.name)
            globals.remove_active_effect(id)
            player_gui.remove_effect(event, id)
        end
    end

    if storage.chaos_timer:tick() then
        effects.pick_chaos_effect()
    end

    -- timer.tick_all()

    if player_gui then
        player_gui.update_player_gui(event)
    end

    if debug_overlay then
        debug_overlay.update(event, storage.chaos_timer)
    end
end)
