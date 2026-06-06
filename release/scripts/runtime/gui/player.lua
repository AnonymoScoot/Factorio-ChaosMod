local gui_settings = require("gui-settings")

local gui = {}

function gui.create_player_gui(event)
    local player = game.get_player(event.player_index)

    local screen_element = player.gui.screen
    local main_frame = screen_element.add { type = "flow", name = "chaos_frame", direction = "vertical" }
    local style = main_frame.style
    style.padding = { 0, 0, 0, 0 }
    style.width = 320
    style.vertical_spacing = 0
    style.height = 376

    local progressbar = main_frame.add { type = "progressbar", name = "chaos_progressbar" }
    local style = progressbar.style
    style.bar_width = 8
    style.horizontally_stretchable = true
    style.margin = { 0, 0, 8, 0 }
end

function gui.update_player_gui(event)
    local player = game.get_player(event.player_index)

    player.gui.screen["chaos_frame"].globallabel.caption = storage.five
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
