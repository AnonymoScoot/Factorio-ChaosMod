local timer = require("scripts.lib.timer")

local globals = {}

storage.chaos_timer = storage.chaos_timer or timer.new {
    duration = 60 * 5
}
storage.active_effects = storage.active_effects or {}

function globals.add_active_effect(name, effect_timer)
    storage.active_effects[name] = effect_timer
end

function globals.remove_active_effect(name)
    storage.active_effects[name] = nil
end

return globals
