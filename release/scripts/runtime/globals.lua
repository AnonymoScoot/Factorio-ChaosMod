local globals = {}

function globals.increase_timer()
    storage.chaos_timer = storage.chaos_timer + 1
end

function globals.reset_timer()
    storage.chaos_timer = 0
end

function globals.timer_is_full()
    if storage.chaos_timer >= storage.chaos_timer_interval then
        return true
    end
    return false
end

return globals
