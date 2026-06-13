local math_lib = require("scripts.lib.math")
local timer = require("scripts.lib.timer")

local overlay = {}

function overlay.create_gui(event)
    local player = game.get_player(event.player_index)

    if not player then
        return
    end

    local screen_element = player.gui.screen
    local main_frame = screen_element.add { type = "flow", name = "debug_overlay", direction = "vertical" }

    local chaos_refire_interval = main_frame.add { type = "label", name = "label_chaos_refire_interval", caption = "" }

    local picked_effects = main_frame.add { type = "list-box", name = "list_picked_effects", caption = "picked effects" }
end

function overlay.update(event, chaos_timer)
    local player = game.players[1]

    player.gui.screen["debug_overlay"]["label_chaos_refire_interval"].caption = "chaos_timer: " ..
        chaos_timer:get_time() .. "(" .. math.floor(chaos_timer:get_time() / 60) .. "s)"

    -- if player.gui.screen["debug_overlay"]["label_chaos_effect"] then
    --     player.gui.screen["debug_overlay"]["label_chaos_effect"].caption = "effect: " .. effect
    -- end
end

function overlay.add_effect(effect)
    local player = game.players[1]

    if not player.gui.screen["debug_overlay"]["list_picked_effects"] then
        return
    end

    player.gui.screen["debug_overlay"]["list_picked_effects"].add_item(effect)
end

return overlay
