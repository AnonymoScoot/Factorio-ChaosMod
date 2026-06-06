local print = {}

function print.print_globals(command)
    local player = game.get_player(command.player_index)

    for k, v in pairs(storage) do
        player.print(k .. ": " .. v)
    end
end

function print.print_picked_effect(effect)
    local player = game.players[1]

    player.print("Effect picked:" .. effect)
end

commands.add_command("print_globals", nil, print.print_globals)

return print
