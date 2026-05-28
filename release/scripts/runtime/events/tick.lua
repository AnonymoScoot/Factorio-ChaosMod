script.on_event(defines.events.on_tick, function(event)
    updateActiveChaosEffects()
    updatePlayerGUI()

    if game.tick >= global.nextChaosTimerRefire then
        global.nextChaosTimerRefire = game.tick + REFIRE_INTERVAL

        pickRandomChaosEffect()
    end
end)
