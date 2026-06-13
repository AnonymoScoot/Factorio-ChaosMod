local timer = require("scripts.lib.timer")

local test = {}

function test.timer()
    local t = timer.new(60, function()
        print("End")
    end)

    print(t.is_running())
end

test.timer()
