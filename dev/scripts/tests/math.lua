local mathlib = require("release.scripts.lib.math")

local test = {}

function test.normalize()
    print(mathlib.normalize(25, 20, 30))
end

test.normalize()
