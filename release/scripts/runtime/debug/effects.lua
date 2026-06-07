local effect_debug = {
    timer = {
        timer_enabled = false

    }
}

function effect_debug.timer.start()
    effect_debug.timer_enabled = true
end

function effect_debug.timer.stop()
    effect_debug.timer_enabled = false
end

function effect_debug.timer.toggle()
    if effect_debug.timer_enabled then
        effect_debug.timer_enabled = false
    else
        effect_debug.timer_enabled = true
    end
end

function effect_debug.timer.set_time(time)
    storage.chaos_timer = time
end

function effect_debug.timer.set_full_time()
    storage.chaos_timer = storage.chaos_timer_interval
end

return effect_debug
