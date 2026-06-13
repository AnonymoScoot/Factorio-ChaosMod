local print = {}

function print.player_print(obj, prepend, append)
    if not game then
        return
    end

    if not game.players[1] then
        return
    end

    local player = game.players[1]

    player.print(print.format(prepend) .. print.format(obj) .. print.format(append))
end

function print.format(value, indent, visited)
    indent = indent or 0
    visited = visited or {}

    local pad = string.rep("  ", indent)
    local t = type(value)

    if t == "nil" then
        return pad .. ""
    end

    if t == "number" or t == "string" or t == "boolean" then
        return pad .. tostring(value)
    end

    if t ~= "table" then
        return pad .. "<" .. t .. "> " .. tostring(value)
    end

    if next(value) == nil then
        return "{}"
    end

    if visited[value] then
        return "{<circular>}"
    end
    visited[value] = true

    local result = "{\n"

    for k, v in pairs(value) do
        local key = "[" .. tostring(k) .. "] = "

        if type(v) == "table" then
            result = result .. pad .. "  " .. key
                .. print.format(v, indent + 1, visited) .. "\n"
        else
            result = result .. pad .. "  " .. key
                .. print.format(v, 0, visited) .. "\n"
        end
    end

    result = result .. pad .. "}"
    return result
end

return print
