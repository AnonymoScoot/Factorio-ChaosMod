local Timer = {}

function Timer.new(duration, callback, tick_rate)
    return {
        running = true,
        time = 0,
        duration = duration or 60,
        callback = callback or nil,
        tick_rate = tick_rate or 1,
    }
end

function Timer.start(self)
    self.running = true
end

function Timer.stop(self)
    self.running = false
end

function Timer.toggle(self)
    self.running = not self.running
end

function Timer.reset(self)
    self.time = 0
end

function Timer.is_running(self)
    return self.running
end

function Timer.get_time(self)
    return self.time
end

function Timer.set_time(self, time)
    self.time = time
end

function Timer.tick(self)
    if not self.running then return end

    self.time = self.time + self.tick_rate

    if self.time >= self.duration then
        if self.callback then
            self.callback()
        end

        self.time = 0
    end
end

return Timer
