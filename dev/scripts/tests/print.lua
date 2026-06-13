local printd = require("release.scripts.debug.print")

local test = {}

function test.format()
    print(printd.format(5))
    print(printd.format("text"))
    print(printd.format({}))

    print(printd.format({ 1, 2, 3 }))

    print(printd.format({ 1, "a", true, false }))

    print(printd.format({
        a = 1,
        b = { 2, 3, 4 },
        c = { x = "hello", y = "world" }
    }))

    print(printd.format({
        level1 = {
            level2 = {
                level3 = {
                    value = "deep"
                }
            }
        }
    }))

    print(printd.format({
        a = {},
        b = { {} },
        c = 1
    }))

    print(printd.format({
        [1] = "one",
        [2] = "two",
        key = "value"
    }))

    print(printd.format({
        yes = true,
        no = false
    }))

    print(printd.format({
        a = nil,
        b = 2
    }))

    local t = { a = 1 }
    t.self = t
    print(printd.format(t))
end

test.format()
