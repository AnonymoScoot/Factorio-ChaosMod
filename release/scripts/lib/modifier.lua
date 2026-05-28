modifier = {}

------------// Force Modifiers //------------
function modifier.applyForceModifier(mod)
    local pick = math.random()
    local distanceToBottom = math.abs(game.forces.player[mod] - modifier[mod].minValue)
    local minValue = 0
    local maxValue = 0

    if pick < 0.5 and distanceToBottom - modifier[mod].increment >= 0 then
        minValue = -distanceToBottom
        maxValue = -modifier[mod].increment
    else
        minValue = modifier[mod].increment
        maxValue = distanceToBottom +
            math.clamp(modifier[mod].exceedValue - distanceToBottom, 0, modifier[mod].exceedValue)
    end

    local randomValue = math.roundTo(math.randomRange(minValue, maxValue), modifier[mod].increment)

    game.forces.player[mod] = math.clampBottom(game.forces.player[mod] + randomValue, modifier[mod].minValue)

    return randomValue
end

function modifier.revertForceModifier(mod, value)
    game.forces.player[mod] = math.clampBottom(
        math.roundTo(game.forces.player[mod] - value, modifier[mod].increment),
        modifier[mod].minValue)
end

modifier["manual_mining_speed_modifier"] = {
    minValue = -1,
    exceedValue = 2,
    increment = 0.1,
}
modifier["manual_crafting_speed_modifier"] = {
    minValue = -1,
    exceedValue = 2,
    increment = 0.1,
}
modifier["laboratory_speed_modifier"] = {
    minValue = -1,
    exceedValue = 2,
    increment = 0.1,
}
modifier["laboratory_productivity_bonus"] = {
    minValue = -1,
    exceedValue = 2,
    increment = 0.1,
}
modifier["worker_robots_speed_modifier"] = {
    minValue = -0.9,
    exceedValue = 2,
    increment = 0.1,
}
modifier["worker_robots_battery_modifier"] = {
    minValue = -0.9,
    exceedValue = 2,
    increment = 0.1,
}
modifier["worker_robots_storage_bonus"] = {
    minValue = 0,
    exceedValue = 3,
    increment = 1,
}
modifier["inserter_stack_size_bonus"] = {
    minValue = 0,
    exceedValue = 3,
    increment = 1,
}
modifier["stack_inserter_capacity_bonus"] = {
    minValue = 0,
    exceedValue = 3,
    increment = 1,
}
modifier["character_trash_slot_count"] = {
    minValue = 0,
    exceedValue = 100,
    increment = 10,
}
modifier["maximum_following_robot_count"] = {
    minValue = 1,
    exceedValue = 10,
    increment = 1,
}
modifier["following_robots_lifetime_modifier"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_running_speed_modifier"] = {
    minValue = -0.9,
    exceedValue = 2,
    increment = 0.1,
}
modifier["artillery_range_modifier"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_build_distance_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_item_drop_distance_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_reach_distance_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_resource_reach_distance_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_item_pickup_distance_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_loot_pickup_distance_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["character_inventory_slots_bonus"] = {
    minValue = 0,
    exceedValue = 100,
    increment = 10,
}
modifier["character_health_bonus"] = {
    minValue = 0,
    exceedValue = 1000,
    increment = 100,
}
modifier["mining_drill_productivity_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}
modifier["train_braking_force_bonus"] = {
    minValue = 0,
    exceedValue = 2,
    increment = 0.1,
}

------------// Difficulty Modifiers //------------
function modifier.applyDifficulyModifier(mod)
    local pick = math.random()
    local distanceToBottom = math.abs(game.difficulty_settings[mod] - modifier[mod].minValue)
    local minValue = 0
    local maxValue = 0

    if pick < 0.5 and distanceToBottom - modifier[mod].increment >= 0 then
        minValue = -distanceToBottom
        maxValue = -modifier[mod].increment
    else
        minValue = modifier[mod].increment
        maxValue = distanceToBottom +
            math.clamp(modifier[mod].exceedValue - distanceToBottom, 0, modifier[mod].exceedValue)
    end

    local randomValue = math.roundTo(math.randomRange(minValue, maxValue), modifier[mod].increment)

    game.difficulty_settings[mod] = math.clampBottom(game.difficulty_settings[mod] + randomValue, modifier[mod].minValue)

    return randomValue
end

function modifier.revertDifficulyModifier(mod, value)
    game.difficulty_settings[mod] = math.clampBottom(
        math.roundTo(game.difficulty_settings[mod] - value, modifier[mod].increment),
        modifier[mod].minValue)
end

modifier["technology_price_multiplier"] = {
    minValue = 0.1,
    exceedValue = 4,
    increment = 0.1,
}

------------// MapSettings Modifiers //------------
function modifier.applyMapSettingsModifier(setting, mod)
    local pick = math.random()
    local distanceToBottom = math.abs(game.map_settings[setting][mod] - modifier[mod].minValue)
    local minValue = 0
    local maxValue = 0

    if pick < 0.5 and distanceToBottom - modifier[mod].increment >= 0 then
        minValue = -distanceToBottom
        maxValue = -modifier[mod].increment
    else
        minValue = modifier[mod].increment
        maxValue = modifier[mod].maxValue - game.map_settings[setting][mod]
    end

    local randomValue = math.roundTo(math.randomRange(minValue, maxValue), modifier[mod].increment)

    game.map_settings[setting][mod] = math.clamp(game.map_settings[setting][mod] + randomValue, modifier[mod].minValue,
        modifier[mod].maxValue)

    return randomValue
end

function modifier.revertMapSettingsModifier(setting, mod, value)
    game.map_settings[setting][mod] = math.clamp(
        math.roundTo(game.map_settings[setting][mod] - value, modifier[mod].increment), modifier[mod].minValue,
        modifier[mod].maxValue)
end

modifier["diffusion_ratio"] = {
    minValue = 0.001,
    maxValue = 0.1,
    increment = 0.001,
}
modifier["min_to_diffuse"] = {
    minValue = 1,
    maxValue = 75,
    increment = 1,
}
modifier["ageing"] = {
    minValue = 0.1,
    maxValue = 10,
    increment = 0.1,
}
modifier["enemy_attack_pollution_consumption_modifier"] = {
    minValue = 0.1,
    maxValue = 10,
    increment = 0.1,
}
modifier["time_factor"] = {
    minValue = 0.000001,
    maxValue = 0.0001,
    increment = 0.000001,
}
modifier["destroy_factor"] = {
    minValue = 0.0002,
    maxValue = 0.02,
    increment = 0.0001,
}
modifier["pollution_factor"] = {
    minValue = 0.0000001,
    maxValue = 0.000009,
    increment = 0.0000001,
}

------------// ManGenSettings Modifiers //------------
function modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
    local randomEntry = math.random(#modifier[modifier_mod])
    local randomValue = modifier[modifier_mod][randomEntry].value

    surface.map_gen_settings = fn(randomValue)

    return randomEntry
end

-- modifier["map_gen_size"] = {
--     { value = 0,                description = "none" },
--     { value = 0.5,              description = "very low" },
--     { value = 1 / math.sqrt(2), description = "low" },
--     { value = 1,                description = "normal" },
--     { value = math.sqrt(2),     description = "high" },
--     { value = 2,                description = "very high" },
-- }
modifier["cliff_elevation_interval"] = {
    { value = 240, description = "very low" },
    { value = 80,  description = "low" },
    { value = 40,  description = "normal" },
    { value = 20,  description = "high" },
    { value = 6,   description = "very high" },
}
-- Coverage
modifier["map_gen_size"] = {
    { value = 0,     description = "none" },
    { value = 1 / 6, description = "very low" },
    { value = 1 / 3, description = "low" },
    { value = 1,     description = "normal" },
    { value = 3,     description = "high" },
    { value = 6,     description = "very high" },
}
-- Non-zero
modifier["map_gen_size_nonzero"] = {
    { value = 1 / 6, description = "very low" },
    { value = 1 / 3, description = "low" },
    { value = 1,     description = "normal" },
    { value = 3,     description = "high" },
    { value = 6,     description = "very high" },
}
-- Frequency
modifier["map_gen_scale"] = {
    { value = 6,     description = "very low" },
    { value = 3,     description = "low" },
    { value = 1,     description = "normal" },
    { value = 1 / 3, description = "high" },
    { value = 1 / 6, description = "very high" },
}
modifier["tile_probability"] = {
    { value = 0.1, description = "10" },
    { value = 0.2, description = "20" },
    { value = 0.3, description = "30" },
    { value = 0.4, description = "40" },
    { value = 0.5, description = "50" },
    { value = 0.6, description = "60" },
    { value = 0.7, description = "70" },
    { value = 0.8, description = "80" },
    { value = 0.9, description = "90" },
}
