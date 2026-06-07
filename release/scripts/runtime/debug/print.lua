local print = {}

function print.print_globals(command)
    if not game then
        return
    end

    local player = game.get_player(command.player_index)

    if not player then
        return
    end

    for k, v in pairs(storage) do
        if type(v) == "number" or type(v) == "string" then
            player.print(k .. ": " .. v)
        else
            player.print(k .. " (type " .. type(v) .. ")")
        end
    end
end

function print.print_picked_effect(effect)
    if not game then
        return
    end

    local player = game.players[1]

    if not player then
        return
    end

    player.print("Effect picked: " .. effect)
end

function print.print_registered_effect(effect)
    if not game then
        return
    end

    local player = game.players[1]

    if not player then
        return
    end

    player.print("New effect registered: " .. effect)
end

function print.print_active_effects(effects)
    if not game then
        return
    end

    local player = game.players[1]

    if not player then
        return
    end

    for k, v in pairs(storage.active_effects) do
        player.print(v.name)
    end
end

function print.print_enabled_effects(effects)
    print.print(effects)
end

function print.print_registered_effects(registered_effects)
    if not game then
        return
    end

    local player = game.players[1]

    if not player then
        return
    end

    for k, effect in pairs(registered_effects) do
        player.print("Registered effect: " .. effect.name)
    end
end

function print.print(obj)
    if not game then
        return
    end

    local player = game.players[1]

    if not player then
        return
    end

    if type(obj) == "number" or type(obj) == "string" then
        player.print(obj)
    else
        if type(obj) == "table" then
            for k, v in pairs(obj) do
                if type(v) == "number" or type(v) == "string" then
                    player.print(k .. ": " .. v)
                else
                    player.print(k .. " (type " .. type(v) .. ")")
                end
            end
        end
    end
end

return print
