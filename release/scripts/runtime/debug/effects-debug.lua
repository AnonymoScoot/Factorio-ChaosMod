require("scripts/library-math")
require("scripts/library-modifier")

addChaosEffect({

    name = "mapgen-autoplace-control-frequency",
    description = { "chaos-description.mapgen-autoplace-control-frequency" },
    effectFunction = function()
        local surface = game.players[#game.players].surface
        local modifier_mod = "map_gen_size_nonzero"
        local resource
        local fn = function(number)
            local mapGenSettings = surface.map_gen_settings
            local entities = game.get_filtered_entity_prototypes({ {
                filter = "type",
                type = "resource"
            } })
            local keys = {}
            for key, _ in pairs(entities) do
                table.insert(keys, key)
            end
            resource = entities[keys[math.random(#keys)]]

            if mapGenSettings["autoplace_controls"][resource.name] then
                mapGenSettings["autoplace_controls"][resource.name].frequency = number
            end
            return mapGenSettings
        end
        local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
        local value = modifier[modifier_mod][entry].value
        local description = modifier[modifier_mod][entry].description
        return {
            gain = value < 1 and -2 or (value == 1 and 0 or 2),
            modifyingValue = value,
            description = { "chaos-description.mapgen-autoplace-control-frequency", { "entity-name." .. resource.name },
                description },
        }
    end,

})

addChaosEffect({

    name = "mapgen-autoplace-control-size",
    description = { "chaos-description.mapgen-autoplace-control-size" },
    effectFunction = function()
        local surface = game.players[#game.players].surface
        local modifier_mod = "map_gen_size"
        local resource
        local fn = function(number)
            local mapGenSettings = surface.map_gen_settings
            local entities = game.get_filtered_entity_prototypes({ {
                filter = "type",
                type = "resource"
            } })
            local keys = {}
            for key, _ in pairs(entities) do
                table.insert(keys, key)
            end
            resource = entities[keys[math.random(#keys)]]

            if mapGenSettings["autoplace_controls"][resource.name] then
                mapGenSettings["autoplace_controls"][resource.name].size = number
            end
            return mapGenSettings
        end
        local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
        local value = modifier[modifier_mod][entry].value
        local description = modifier[modifier_mod][entry].description
        return {
            gain = value < 1 and -2 or (value == 1 and 0 or 2),
            modifyingValue = value,
            description = { "chaos-description.mapgen-autoplace-control-size", { "entity-name." .. resource.name },
                description },
        }
    end,

})

addChaosEffect({

    name = "mapgen-autoplace-control-richness",
    description = { "chaos-description.mapgen-autoplace-control-richness" },
    effectFunction = function()
        local surface = game.players[#game.players].surface
        local modifier_mod = "map_gen_size_nonzero"
        local resource
        local fn = function(number)
            local mapGenSettings = surface.map_gen_settings
            local entities = game.get_filtered_entity_prototypes({ {
                filter = "type",
                type = "resource"
            } })
            local keys = {}
            for key, _ in pairs(entities) do
                table.insert(keys, key)
            end
            resource = entities[keys[math.random(#keys)]]

            if mapGenSettings["autoplace_controls"][resource.name] then
                mapGenSettings["autoplace_controls"][resource.name].richness = number
            end
            return mapGenSettings
        end
        local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
        local value = modifier[modifier_mod][entry].value
        local description = modifier[modifier_mod][entry].description
        return {
            gain = value < 1 and -2 or (value == 1 and 0 or 2),
            modifyingValue = value,
            description = { "chaos-description.mapgen-autoplace-control-richness", { "entity-name." .. resource.name },
                description },
        }
    end,

})
