local Log = {}

function Log.print(obj, prepend, append)
    local tick
    if game then
        tick = game.tick
    end
    log(
        "Tick (" ..
        (tick or "") .. ") " .. (prepend or "") .. serpent.block(obj) .. (append or "") .. "\n" .. debug.traceback())
end

return Log
