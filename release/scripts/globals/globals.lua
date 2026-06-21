local timer = require("scripts.lib.timer")
local debug_print = require("scripts.debug.print")

local globals = {}

storage.chaos_timer = storage.chaos_timer or timer.new {
    duration = 60 * 2
}
storage.active_effects = storage.active_effects or {}

function globals.add_active_effect(effect, id)
    storage.active_effects[id] = effect
end

function globals.remove_active_effect(id)
    if debug_print then
        debug_print.player_print(id, "Removing active effect at: ")
    end

    storage.active_effects[id] = nil
end

return globals
