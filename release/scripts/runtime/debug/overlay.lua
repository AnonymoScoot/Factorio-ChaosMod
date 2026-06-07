local math_lib = require("scripts/lib/math")

local overlay = {}

function overlay.create_gui(event)
    local player = game.get_player(event.player_index)

    local screen_element = player.gui.screen
    local main_frame = screen_element.add { type = "flow", name = "debug_overlay", direction = "vertical" }

    local chaos_refire_interval = main_frame.add { type = "label", name = "label_chaos_refire_interval", caption = "" }
end

function overlay.update(event)
    local player = game.players[1]

    player.gui.screen["debug_overlay"]["label_chaos_refire_interval"].caption = "chaos_timer: " ..
        storage.chaos_timer .. "(" .. math.floor(storage.chaos_timer / 60) .. "s)"

    -- if player.gui.screen["debug_overlay"]["label_chaos_effect"] then
    --     player.gui.screen["debug_overlay"]["label_chaos_effect"].caption = "effect: " .. effect
    -- end

end

function overlay.add_effect(effect)
    local player = game.players[1]

    local chaos_effect = player.gui.screen["debug_overlay"].add { type = "label", name = "label_chaos_effect", caption = "effect: " .. effect.name }

    
end

return overlay
