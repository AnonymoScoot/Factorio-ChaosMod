local Handler = {
    listeners = {}
}

function Handler:add_listener(event, callback)
    self.listeners[event] = self.listeners[event] or {}
    table.insert(self.listeners[event], callback)
end

script.on_event(defines.events.on_player_created, function(event)
    local callbacks = Handler.listeners[defines.events.on_player_created]
    if not callbacks then
        return
    end

    for _, callback in ipairs(callbacks) do
        callback(event)
    end
end)

script.on_event(defines.events.on_tick, function(event)
    local callbacks = Handler.listeners[defines.events.on_tick]
    if not callbacks then
        return
    end

    for _, callback in ipairs(callbacks) do
        callback(event)
    end
end)

return Handler
