local Timer = {}
Timer.__index = Timer

Timer.active_timers = setmetatable({}, {
    __mode = "v"
})

script.register_metatable("Timer", Timer)

function Timer.tick_all()
    for _, timer in pairs(Timer.active_timers) do
        if timer then
            timer:tick()
        end
    end
end

function Timer.new(config)
    config = config or {}

    local instance = setmetatable({
        running = true,
        time = 0,
        duration = config.duration or 60,
        tick_rate = config.tick_rate or 1,
        fire_only_once = config.fire_only_once or false
    }, Timer)

    table.insert(Timer.active_timers, instance)

    return instance
end

function Timer:start()
    self.running = true
end

function Timer:stop()
    self.running = false
end

function Timer:toggle()
    self.running = not self.running
end

function Timer:reset()
    self.time = 0
end

function Timer:is_running()
    return self.running
end

function Timer:get_time()
    return self.time
end

function Timer:set_time(time)
    self.time = time
end

function Timer:tick()
    if not self.running then return end

    self.time = self.time + self.tick_rate

    if self.time >= self.duration then
        self.time = 0

        if self.fire_only_once then
            self:stop()
        end
        return true
    end
    return false
end

return Timer
