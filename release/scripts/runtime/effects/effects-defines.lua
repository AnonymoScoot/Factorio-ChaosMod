require("scripts/library-math")
require("scripts/library-modifier")

addChaosEffect({

	name = "disable-research",
	gain = -1,
	duration = 10800,
	description = { "chaos-description.disable-research" },
	effectFunction = function()
		game.forces.player.disable_research()
	end,
	resetFunction = function()
		game.forces.player.enable_research()
	end,

})

addChaosEffect({

	name = "chart-random-area",
	gain = 1,
	description = { "chaos-description.chart-random-area" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomChunkPosition = surface.get_random_chunk()
		local boundingBox = {
			{ randomChunkPosition.x * 32 + math.random(-32, 32) * 32,
				randomChunkPosition.y * 32 +
				math.random(-32, 32) * 32 },
			{ randomChunkPosition.x * 32 + math.random(-32, 32) * 32,
				randomChunkPosition.y * 32 +
				math.random(-32, 32) * 32 },
		}

		game.forces.player.chart(surface, boundingBox)
	end,

})

addChaosEffect({

	name = "clear-chart",
	gain = -3,
	description = { "chaos-description.clear-chart" },
	effectFunction = function()
		game.forces.player.clear_chart()
	end,

})

addChaosEffect({

	name = "rechart",
	gain = 1,
	description = { "chaos-description.rechart" },
	effectFunction = function()
		game.forces.player.rechart()
	end,

})

addChaosEffect({

	name = "chart-all",
	gain = 3,
	description = { "chaos-description.chart-all" },
	effectFunction = function()
		game.forces.player.chart_all()
	end,

})

addChaosEffect({

	name = "unchart-random-chunk",
	gain = -1,
	description = { "chaos-description.unchart-random-chunk" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomChunkPosition = surface.get_random_chunk()

		game.forces.player.unchart_chunk(randomChunkPosition, surface)
	end,

})

addChaosEffect({

	name = "cease-fire-player",
	gain = -3,
	duration = 10800,
	description = { "chaos-description.cease-fire-player" },
	effectFunction = function()
		game.forces.player.set_cease_fire("enemy", true)
	end,
	resetFunction = function()
		game.forces.player.set_cease_fire("enemy", false)
	end,

})

addChaosEffect({

	name = "cease-fire-enemy",
	gain = 3,
	duration = 10800,
	description = { "chaos-description.cease-fire-enemy" },
	effectFunction = function()
		game.forces.enemy.set_cease_fire("player", true)
	end,
	resetFunction = function()
		game.forces.enemy.set_cease_fire("player", false)
	end,

})

addChaosEffect({

	name = "kill-all-units",
	gain = 2,
	description = { "chaos-description.kill-all-units" },
	effectFunction = function()
		game.forces.enemy.kill_all_units()
	end,

})

addChaosEffect({

	name = "random-spawn-position",
	gain = 0,
	description = { "chaos-description.random-spawn-position" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for i = 1, 64 do
			local randomChunkPosition = surface.get_random_chunk()
			local tile = surface.get_tile(randomChunkPosition.x * 32, randomChunkPosition.y * 32)

			if not tile.collides_with("player-layer") then
				game.forces.player.set_spawn_position(tile.position, surface)
				break
			end
		end
	end,

})

addChaosEffect({

	name = "reset-evolution",
	gain = 3,
	description = { "chaos-description.reset-evolution" },
	effectFunction = function()
		game.forces.enemy.reset_evolution()
	end,

})

addChaosEffect({

	name = "research-random-technology",
	gain = 3,
	description = { "chaos-description.research-random-technology" },
	effectFunction = function()
		local technologies = game.forces.player.technologies

		local keys = {}
		for key, _ in pairs(technologies) do
			table.insert(keys, key)
		end

		for i = 1, #technologies do
			local index = math.random(1, #keys)
			local key = keys[index]
			local tech = technologies[key]

			if not tech.researched then
				tech.researched = true
				break
			else
				table.remove(keys, index)
			end
		end
	end,

})

addChaosEffect({

	name = "random-technology-progress",
	gain = 2,
	description = { "chaos-description.random-technology-progress" },
	effectFunction = function()
		local technologies = game.forces.player.technologies

		for key, tech in pairs(technologies) do
			if not tech.researched then
				game.forces.player.set_saved_technology_progress(tech, math.random() * 0.99)
			end
		end
	end,

})

addChaosEffect({

	name = "enable-random-recipe",
	gain = 3,
	description = { "chaos-description.enable-random-recipe" },
	effectFunction = function()
		local recipes = game.forces.player.recipes

		local keys = {}
		for key, _ in pairs(recipes) do
			table.insert(keys, key)
		end

		for i = 1, #recipes do
			local index = math.random(1, #keys)
			local key = keys[index]
			local recipe = recipes[key]

			if not recipe.enabled and not (recipe.name == "electric-energy-interface") then
				recipe.enabled = true
				break
			else
				table.remove(keys, index)
			end
		end
	end,

})

addChaosEffect({

	name = "manual-mining-speed",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("manual_mining_speed_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.mining-speed-decreased" or
				"chaos-description.mining-speed-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("manual_mining_speed_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "manual-crafting-speed",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("manual_crafting_speed_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.crafting-speed-decreased" or
				"chaos-description.crafting-speed-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("manual_crafting_speed_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "laboratory-speed-modifier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("laboratory_speed_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.laboratory-speed-decreased" or
				"chaos-description.laboratory-speed-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("laboratory_speed_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "laboratory-productivity-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("laboratory_productivity_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.laboratory-productivity-decreased" or
				"chaos-description.laboratory-productivity-decreased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("laboratory_productivity_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "worker-robots-speed-modifier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("worker_robots_speed_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.worker-robot-speed-decreased" or
				"chaos-description.worker-robot-speed-decreased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("worker_robots_speed_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "worker-robots-battery-modifier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("worker_robots_battery_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.worker-robot-battery-decreased" or
				"chaos-description.worker-robot-battery-decreased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("worker_robots_battery_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "worker-robots-storage-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("worker_robots_storage_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.worker-robot-storage-decreased" or
				"chaos-description.worker-robot-storage-decreased", math.abs(modifyingValue) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("worker_robots_storage_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "research-progress-random",
	gain = 0,
	description = { "chaos-description.research-progress-random" },
	effectFunction = function()
		if game.forces.player.current_research then
			game.forces.player.research_progress = math.random()
		end
	end,

})

addChaosEffect({

	name = "inserter-stack-size-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("inserter_stack_size_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.inserter-stack-size-bonus-decreased" or
				"chaos-description.inserter-stack-size-bonus-increased", math.abs(modifyingValue) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("inserter_stack_size_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "stack-inserter-capacity-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("stack_inserter_capacity_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.stack-inserter-capacity-bonus-decreased" or
				"chaos-description.stack-inserter-capacity-bonus-increased", math.abs(modifyingValue) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("stack_inserter_capacity_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-trash-slot-count",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_trash_slot_count")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-trash-slot-count-decreased" or
				"chaos-description.character-trash-slot-count-increased", math.abs(modifyingValue) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_trash_slot_count", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "maximum-following-robot-count",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("maximum_following_robot_count")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.maximum-following-robot-count-decreased" or
				"chaos-description.maximum-following-robot-count-increased", math.abs(modifyingValue) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("maximum_following_robot_count", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "following-robots-lifetime-modifier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("following_robots_lifetime_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.following-robots-lifetime-decreased" or
				"chaos-description.following-robots-lifetime-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("following_robots_lifetime_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-running-speed-modifier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_running_speed_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-running-speed-modifier-decreased" or
				"chaos-description.character-running-speed-modifier-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_running_speed_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "artillery-range-modifier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("artillery_range_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.artillery-range-modifier-decreased" or
				"chaos-description.artillery-range-modifier-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("artillery_range_modifier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-build-distance-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_build_distance_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-build-distance-bonus-decreased" or
				"chaos-description.character-build-distance-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_build_distance_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-item-drop-distance-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_item_drop_distance_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-item-drop-distance-bonus-decreased" or
				"chaos-description.character-item-drop-distance-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_item_drop_distance_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-reach-distance-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_reach_distance_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-reach-distance-bonus-decreased" or
				"chaos-description.character-reach-distance-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_reach_distance_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-resource-reach-distance-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_resource_reach_distance_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-resource-reach-distance-bonus-decreased" or
				"chaos-description.character-resource-reach-distance-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_resource_reach_distance_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-item-pickup-distance-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_item_pickup_distance_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-item-pickup-distance-bonus-decreased" or
				"chaos-description.character-item-pickup-distance-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_item_pickup_distance_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-loot-pickup-distance-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_loot_pickup_distance_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-loot-pickup-distance-bonus-decreased" or
				"chaos-description.character-loot-pickup-distance-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_loot_pickup_distance_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-inventory-slots-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_inventory_slots_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-inventory-slots-bonus-decreased" or
				"chaos-description.character-inventory-slots-bonus-increased", modifyingValue },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_inventory_slots_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "character-health-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("character_health_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.character-health-bonus-decreased" or
				"chaos-description.character-health-bonus-increased", modifyingValue },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("character_health_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "mining-drill-productivity-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("mining_drill_productivity_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.mining-drill-productivity-bonus-decreased" or
				"chaos-description.mining-drill-productivity-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("mining_drill_productivity_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "train-braking-force-bonus",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyForceModifier("train_braking_force_bonus")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.train-braking-force-bonus-decreased" or
				"chaos-description.train-braking-force-bonus-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertForceModifier("train_braking_force_bonus", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "research-queue",
	effectFunction = function()
		if game.forces.player.research_queue_enabled then
			game.forces.player.research_queue_enabled = false
			return {
				description = { "chaos-description.research-queue-disabled" },
				gain = -1
			}
		else
			game.forces.player.research_queue_enabled = true
			return {
				description = { "chaos-description.research-queue-enabled" },
				gain = 1
			}
		end
	end,

})

addChaosEffect({

	name = "pollute-random",
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomChunkPosition = surface.get_random_chunk()
		local mapPosition = { randomChunkPosition.x * 32, randomChunkPosition.y * 32 }
		local pick = math.random(1, 4)
		local randomNumber

		if pick == 1 then
			randomNumber = math.randomRange(50, 100)
			surface.pollute(mapPosition, randomNumber)
			return {
				description = { "chaos-description.pollute-random-small" },
				gain = -1
			}
		elseif pick == 2 then
			randomNumber = math.randomRange(100, 500)
			surface.pollute(mapPosition, randomNumber)
			return {
				description = { "chaos-description.pollute-random-medium" },
				gain = -2
			}
		elseif pick == 3 then
			randomNumber = math.randomRange(500, 1000)
			surface.pollute(mapPosition, randomNumber)
			return {
				description = { "chaos-description.pollute-random-large" },
				gain = -3
			}
		else
			randomNumber = math.randomRange(1000, 10000)
			surface.pollute(mapPosition, randomNumber)
			return {
				description = { "chaos-description.pollute-random-very-large" },
				gain = -3
			}
		end
	end,

})

addChaosEffect({

	name = "build-enemy-base-at-random-position",
	gain = -1,
	description = { "chaos-description.build-enemy-base-at-random-position" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomChunkPosition = surface.get_random_chunk()
		local mapPosition = { randomChunkPosition.x * 32, randomChunkPosition.y * 32 }

		surface.build_enemy_base(mapPosition, math.random() * (30 - 5) + 5, game.forces.enemy)
	end,

})

addChaosEffect({

	name = "mark-deconstruct-random-area",
	gain = -1,
	description = { "chaos-description.mark-deconstruct-random-area" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomChunkPosition = surface.get_random_chunk()
		local boundingBox = {
			{ randomChunkPosition.x * 32 + math.random(-32, 32) * 32,
				randomChunkPosition.y * 32 +
				math.random(-32, 32) * 32 },
			{ randomChunkPosition.x * 32 + math.random(-32, 32) * 32,
				randomChunkPosition.y * 32 +
				math.random(-32, 32) * 32 },
		}

		surface.deconstruct_area { area = boundingBox, force = game.forces.player }
	end,

})

addChaosEffect({

	name = "clear-all-pollution",
	gain = 3,
	description = { "chaos-description.clear-all-pollution" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		surface.clear_pollution()
	end,

})



addChaosEffect({

	name = "always-day",
	effectFunction = function()
		local surface = game.players[#game.players].surface

		if surface.always_day then
			surface.always_day = false
			return {
				description = { "chaos-description.always-day-disabled" },
				gain = -2
			}
		else
			surface.always_day = true
			return {
				description = { "chaos-description.always-day-enabled" },
				gain = 2
			}
		end
	end,

})

addChaosEffect({

	name = "random-time-of-day",
	gain = 0,
	description = { "chaos-description.random-time-of-day" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		surface.daytime = math.random()
	end,

})

addChaosEffect({

	name = "random-wind-speed",
	gain = 0,
	duration = 10800,
	description = { "chaos-description.random-wind-speed" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local returnTable = {}

		returnTable.wind_speed = surface.wind_speed
		returnTable.wind_orientation_change = surface.wind_orientation_change

		surface.wind_speed = math.random() * (0.5 - 0.25) + 0.25
		surface.wind_orientation_change = math.random() * (0.001 - 0.0001) + 0.0001

		return returnTable
	end,
	resetFunction = function(effectFunctionTable)
		local surface = game.players[#game.players].surface

		surface.wind_speed = effectFunctionTable.wind_speed
		surface.wind_orientation_change = effectFunctionTable.wind_orientation_change
	end,

})

addChaosEffect({

	name = "peaceful-mode",
	gain = 3,
	duration = 10800,
	description = { "chaos-description.peaceful-mode" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		surface.peaceful_mode = true
	end,
	resetFunction = function()
		local surface = game.players[#game.players].surface

		surface.peaceful_mode = false
	end,

})

addChaosEffect({

	name = "daytime-freeze",
	gain = 0,
	effectFunction = function()
		local surface = game.players[#game.players].surface

		if surface.freeze_daytime then
			surface.freeze_daytime = false
			return {
				description = { "chaos-description.unfreeze-daytime" }
			}
		else
			surface.freeze_daytime = true
			return {
				description = { "chaos-description.freeze-daytime" }
			}
		end
	end,

})

addChaosEffect({

	name = "short-daytime",
	gain = 0,
	duration = 10800,
	description = { "chaos-description.short-daytime" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local returnTable = {}

		returnTable.ticks_per_day = surface.ticks_per_day

		surface.ticks_per_day = math.randomRange(600, 1200)

		return returnTable
	end,
	resetFunction = function(effectFunctionTable)
		local surface = game.players[#game.players].surface

		surface.ticks_per_day = effectFunctionTable.ticks_per_day
	end,

})

addChaosEffect({

	name = "set-daytime",
	gain = 0,
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomNumber = math.random(1, 4)

		if randomNumber == 1 then
			surface.daytime = surface.dusk
			return {
				description = { "chaos-description.set-daytime-dusk" }
			}
		elseif randomNumber == 2 then
			surface.daytime = surface.dawn
			return {
				description = { "chaos-description.set-daytime-dawn" }
			}
		elseif randomNumber == 3 then
			surface.daytime = surface.evening
			return {
				description = { "chaos-description.set-daytime-evening" }
			}
		else
			surface.daytime = surface.morning
			return {
				description = { "chaos-description.set-daytime-morning" }
			}
		end
	end,

})

addChaosEffect({

	name = "random-daytime-phases",
	gain = 0,
	description = { "chaos-description.random-daytime-phases" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local ticksPerDay = surface.ticks_per_day

		local middleTick = math.floor(math.random() * ((ticksPerDay - 120) - 120) + 120)
		local leftTick = math.floor(math.random() * ((middleTick - 60) - 60) + 60)
		local rightTick = math.floor(math.random() * ((ticksPerDay - 60) - (middleTick + 60)) + (middleTick + 60))

		local duskTick = math.floor(math.random() * (leftTick - 0) + 0)
		local eveningTick = math.floor(math.random() * (middleTick - (leftTick + 1)) + (leftTick + 1))
		local morningTick = math.floor(math.random() * (rightTick - (middleTick + 1)) + (middleTick + 1))
		local dawnTick = math.floor(math.random() * (ticksPerDay - (rightTick + 1)) + (rightTick + 1))

		surface.dusk = 1 / ticksPerDay
		surface.evening = 2 / ticksPerDay
		surface.morning = 3 / ticksPerDay

		surface.dawn = dawnTick / ticksPerDay
		surface.morning = morningTick / ticksPerDay
		surface.evening = eveningTick / ticksPerDay
		surface.dusk = duskTick / ticksPerDay
	end,

})

addChaosEffect({

	name = "solar-power",
	duration = 10800,
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifyingValue

		if math.random() < 0.5 then
			modifyingValue = math.roundTo(math.randomRange(-1, -0.1), 0.1)
		else
			modifyingValue = math.roundTo(math.randomRange(0.1, 1), 0.1)
		end

		surface.solar_power_multiplier = surface.solar_power_multiplier + modifyingValue

		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.solar-power-decreased" or
				"chaos-description.solar-power-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function()
		local surface = game.players[#game.players].surface

		surface.solar_power_multiplier = 1
	end,

})

addChaosEffect({

	name = "dark-night",
	duration = 10800,
	gain = -1,
	description = { "chaos-description.dark-night" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		surface.brightness_visual_weights = { 1, 1, 1 }
	end,
	resetFunction = function()
		local surface = game.players[#game.players].surface

		surface.brightness_visual_weights = { 0, 0, 0 }
	end,

})

addChaosEffect({

	name = "turn-enemy-units-to-trees",
	gain = 3,
	description = { "chaos-description.turn-enemy-units-to-trees" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "type",
			type = "tree"
		} })

		local keys = {}
		for key, _ in pairs(searchTable) do
			table.insert(keys, key)
		end


		for k, entity in pairs(surface.find_entities_filtered {
			type = "unit",
			force = "enemy",
		}) do
			if entity.valid then
				surface.create_entity {
					name = searchTable[keys[math.random(#keys)]].name,
					position = entity.position
				}
			end
		end

		game.forces.enemy.kill_all_units()
	end,

})

addChaosEffect({

	name = "turn-trees-to-enemy-units",
	gain = -3,
	description = { "chaos-description.turn-trees-to-enemy-units" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		local units = {
			"small-biter",
			"medium-biter",
			"big-biter",
			"small-spitter",
			"medium-spitter",
			"big-spitter"
		}

		for k, entity in pairs(surface.find_entities_filtered {
			type = "tree",
		}) do
			if entity.valid and math.random() < 0.1 then
				surface.create_entity {
					name = units[math.random(#units)],
					position = entity.position
				}
				entity.destroy {}
			end
		end
	end,

})

addChaosEffect({

	name = "convert-all-biters-to-player-force",
	gain = 3,
	description = { "chaos-description.convert-all-biters-to-player-force" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "unit-spawner", "turret", "unit" },
			force = "enemy"
		}) do
			if entity.valid then
				entity.force = "player"
			end
		end
	end,

})

addChaosEffect({

	name = "convert-all-player-turrets-to-enemy-force",
	gain = -3,
	description = { "chaos-description.convert-all-player-turrets-to-enemy-force" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "ammo-turret", "electric-turret", "fluid-turret", "artillery-turret" },
			force = "player"
		}) do
			if entity.valid then
				entity.force = "enemy"
			end
		end
	end,

})

addChaosEffect({

	name = "turn-all-player-turrets-to-worms",
	gain = -3,
	description = { "chaos-description.turn-all-player-turrets-to-worms" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		local units = {
			"small-worm-turret",
			"medium-worm-turret",
			"big-worm-turret"
		}

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "ammo-turret", "electric-turret", "fluid-turret", "artillery-turret" },
			force = "player"
		}) do
			if entity.valid then
				surface.create_entity {
					name = units[math.random(#units)],
					position = entity.position,
					force = "enemy"
				}
				entity.destroy {}
			end
		end
	end,

})

addChaosEffect({

	name = "convert-all-worms-to-player-force",
	gain = 3,
	description = { "chaos-description.convert-all-worms-to-player-force" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "turret" },
			force = "enemy"
		}) do
			if entity.valid then
				entity.force = "player"
			end
		end
	end,

})

addChaosEffect({

	name = "convert-all-worms-to-player-force",
	gain = 3,
	description = { "chaos-description.convert-all-worms-to-player-force" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "turret" },
			force = "enemy"
		}) do
			if entity.valid then
				entity.force = "player"
			end
		end
	end,

})

addChaosEffect({

	name = "remove-all-biters",
	gain = 3,
	description = { "chaos-description.remove-all-biters" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			force = "enemy"
		}) do
			if entity.valid then
				entity.destroy()
			end
		end
	end,

})

addChaosEffect({

	name = "turn-trees-into-resources",
	gain = 1,
	description = { "chaos-description.turn-trees-into-resources" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "type",
			type = "resource"
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			if prototype.resource_category == "basic-solid" then
				table.insert(keys, key)
			end
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "tree",
		}) do
			if entity.valid then
				surface.create_entity {
					name = searchTable[keys[math.random(#keys)]].name,
					position = entity.position,
					amount = math.randomRange(10, 1000),
					enable_tree_removal = false,
					enable_cliff_removal = false,
					snap_to_tile_center = true
				}

				entity.destroy()
			end
		end
	end,

})

addChaosEffect({

	name = "resource-amount",
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local multiplier = 1
		local randomNumber = math.random(1, 4)
		local returnTable = {}

		if randomNumber == 1 then
			multiplier = 0.25
			returnTable.description = { "chaos-description.resource-amount-quartered" }
			returnTable.gain = -3
		elseif randomNumber == 2 then
			multiplier = 0.5
			returnTable.description = { "chaos-description.resource-amount-halved" }
			returnTable.gain = -2
		elseif randomNumber == 3 then
			multiplier = 2
			returnTable.description = { "chaos-description.resource-amount-doubled" }
			returnTable.gain = 2
		else
			multiplier = 4
			returnTable.description = { "chaos-description.resource-amount-quadrupled" }
			returnTable.gain = 3
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "resource",
		}) do
			if entity.valid then
				entity.amount = math.clamp(math.ceil(entity.amount * multiplier), 1, 4294967295)
			end
		end

		return returnTable
	end,

})

addChaosEffect({

	name = "randomize-resource-deposits",
	gain = -2,
	description = { "chaos-description.randomize-resource-deposits" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "type",
			type = "resource"
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			if prototype.resource_category == "basic-solid" then
				table.insert(keys, key)
			end
		end

		for i = #keys, 2, -1 do
			local j = math.random(i)
			keys[i], keys[j] = keys[j], keys[i]
		end

		local shuffledTable = {}
		for i, key in ipairs(keys) do
			shuffledTable[key] = keys[math.random(#keys)]
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "resource",
		}) do
			if entity.valid and entity.prototype.resource_category == "basic-solid" then
				surface.create_entity {
					name = shuffledTable[entity.name],
					position = entity.position,
					amount = entity.amount,
					enable_tree_removal = false,
					enable_cliff_removal = false,
					snap_to_tile_center = true
				}

				entity.destroy()
			end
		end
	end,

})

addChaosEffect({

	name = "randomize-fluids",
	gain = -3,
	description = { "chaos-description.randomize-fluids" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_fluid_prototypes({ {
			filter = "name",
			name = "fluid-unknown",
			invert = true,
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			table.insert(keys, key)
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "pipe", "storage-tank" },
		}) do
			if entity.valid and entity.fluidbox[1] then
				local fluid = entity.fluidbox[1]
				entity.fluidbox[1] = {
					name = searchTable[keys[math.random(#keys)]].name,
					amount = fluid.amount,
					temperature = fluid.temperature
				}
			end
		end
	end,

})

addChaosEffect({

	name = "randomize-fluids-to-one-fluid",
	gain = -2,
	description = { "chaos-description.randomize-fluids-to-one-fluid" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_fluid_prototypes({ {
			filter = "name",
			name = "fluid-unknown",
			invert = true,
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			table.insert(keys, key)
		end

		local randomFluid = keys[math.random(#keys)]

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "pipe", "storage-tank" },
		}) do
			if entity.valid and entity.fluidbox[1] then
				local fluid = entity.fluidbox[1]
				entity.fluidbox[1] = { name = randomFluid, amount = fluid.amount, temperature = fluid.temperature }
			end
		end
	end,

})

addChaosEffect({

	name = "turn-enemy-units-to-landmines",
	gain = -3,
	description = { "chaos-description.turn-enemy-units-to-landmines" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			type = "unit",
			force = "enemy",
		}) do
			surface.create_entity {
				name = "land-mine",
				position = entity.position,
				force = "enemy"
			}
		end

		game.forces.enemy.kill_all_units()
	end,

})

addChaosEffect({

	name = "turn-trees-to-rocks",
	gain = -1,
	description = { "chaos-description.turn-trees-to-rocks" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "name",
			name = { "sand-rock-big", "rock-big", "rock-huge" },
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			table.insert(keys, key)
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "tree",
		}) do
			if entity.valid then
				surface.create_entity {
					name = searchTable[keys[math.random(#keys)]].name,
					position = entity.position
				}

				entity.destroy {}
			end
		end
	end,

})

addChaosEffect({

	name = "insert-random-modules",
	gain = 3,
	description = { "chaos-description.insert-random-modules" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_item_prototypes({ {
			filter = "type",
			type = "module"
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			table.insert(keys, key)
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = { "assembling-machine", "lab", "furnace", "mining-drill", "beacon", "rocket-silo" },
		}) do
			if entity.valid then
				if entity.prototype.module_inventory_size then
					for i = 1, entity.prototype.module_inventory_size do
						for j = 1, 10 do
							local moduleItem = { name = searchTable[keys[math.random(#keys)]].name, count = 1 }

							if entity.can_insert(moduleItem) then
								entity.insert(moduleItem)
								break
							end
						end
					end
				end
			end
		end
	end,

})

addChaosEffect({

	name = "set-random-recipes",
	gain = -3,
	description = { "chaos-description.set-random-recipes" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.recipe_prototypes

		local keys = {}
		for key, prototype in pairs(searchTable) do
			table.insert(keys, key)
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "assembling-machine",
			force = "player"
		}) do
			if entity.valid then
				for i = 1, #keys do
					entity.set_recipe(searchTable[keys[math.random(#keys)]].name)

					if entity.get_recipe() then
						break
					end
				end
			end
		end
	end,

})

addChaosEffect({

	name = "reset-assembler-recipes",
	gain = -3,
	description = { "chaos-description.reset-assembler-recipes" },
	effectFunction = function()
		local surface = game.players[#game.players].surface

		for k, entity in pairs(surface.find_entities_filtered {
			type = "assembling-machine",
			force = "player"
		}) do
			if entity.valid then
				entity.set_recipe(nil)
			end
		end
	end,

})

addChaosEffect({

	name = "mix-ore-deposits",
	gain = -3,
	description = { "chaos-description.mix-ore-deposits" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "type",
			type = "resource"
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			if prototype.resource_category == "basic-solid" then
				table.insert(keys, key)
			end
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "resource",
		}) do
			if math.random() < 0.02 then
				if entity.valid and entity.prototype.resource_category == "basic-solid" then
					surface.create_entity {
						name = searchTable[keys[math.random(#keys)]].name,
						position = entity.position,
						amount = entity.amount,
						enable_tree_removal = false,
						enable_cliff_removal = false,
						snap_to_tile_center = true
					}

					entity.destroy()
				end
			end
		end
	end,

})

addChaosEffect({

	name = "technology-price-multiplier",
	duration = 10800,
	effectFunction = function()
		local modifyingValue = modifier.applyDifficulyModifier("technology_price_multiplier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and 2 or -2,
			description = {
				modifyingValue < 0 and "chaos-description.technology-price-decreased" or
				"chaos-description.technology-price-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertDifficulyModifier("technology_price_multiplier", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "recipe-difficulty",
	effectFunction = function()
		local modifier = game.difficulty_settings.recipe_difficulty

		if modifier == defines.difficulty_settings.recipe_difficulty.normal then
			game.difficulty_settings.recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive
			return {
				description = { "chaos-description.recipe-difficulty-expensive" },
				gain = -3
			}
		else
			game.difficulty_settings.recipe_difficulty = defines.difficulty_settings.recipe_difficulty.normal
			return {
				description = { "chaos-description.recipe-difficulty-normal" },
				gain = 3
			}
		end
	end,

})

addChaosEffect({

	name = "pollution",
	effectFunction = function()
		local modifier = game.map_settings.pollution.enabled

		if modifier then
			game.map_settings.pollution.enabled = false
			return {
				description = { "chaos-description.pollution-disabled" },
				gain = 3
			}
		else
			game.map_settings.pollution.enabled = true
			return {
				description = { "chaos-description.pollution-enabled" },
				gain = -3
			}
		end
	end,

})

addChaosEffect({

	name = "pollution-diffusion-ratio",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.pollution.diffusion_ratio
		local modifyingValue = modifier.applyMapSettingsModifier("pollution", "diffusion_ratio")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and 2 or -2,
			description = {
				modifyingValue < 0 and "chaos-description.pollution-diffusion-ratio-decreased" or
				"chaos-description.pollution-diffusion-ratio-increased",
				math.roundTo((modifyingValue / baseValue) * 100, 1) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("pollution", "diffusion_ratio", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "pollution-min-to-diffuse",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.pollution.min_to_diffuse
		local modifyingValue = modifier.applyMapSettingsModifier("pollution", "min_to_diffuse")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.pollution-min-to-diffuse-decreased" or
				"chaos-description.pollution-min-to-diffuse-increased",
				math.roundTo((modifyingValue / baseValue) * 100, 1) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("pollution", "min_to_diffuse", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "pollution-ageing",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.pollution.ageing
		local modifyingValue = modifier.applyMapSettingsModifier("pollution", "ageing")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.pollution-ageing-decreased" or
				"chaos-description.pollution-ageing-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("pollution", "ageing", effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "pollution-enemy-attack",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.pollution.enemy_attack_pollution_consumption_modifier
		local modifyingValue = modifier.applyMapSettingsModifier("pollution",
			"enemy_attack_pollution_consumption_modifier")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and -2 or 2,
			description = {
				modifyingValue < 0 and "chaos-description.pollution-enemy-attack-decreased" or
				"chaos-description.pollution-enemy-attack-increased", modifyingValue * 100 },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("pollution", "enemy_attack_pollution_consumption_modifier",
			effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "enemy-evolution",
	effectFunction = function()
		local modifier = game.map_settings.enemy_evolution.enabled

		if modifier then
			game.map_settings.enemy_evolution.enabled = false
			return {
				description = { "chaos-description.enemy-evolution-disabled" },
				gain = 3
			}
		else
			game.map_settings.enemy_evolution.enabled = true
			return {
				description = { "chaos-description.enemy-evolution-enabled" },
				gain = -3
			}
		end
	end,

})

addChaosEffect({

	name = "evolution-time-factor",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.enemy_evolution.time_factor
		local modifyingValue = modifier.applyMapSettingsModifier("enemy_evolution", "time_factor")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and 2 or -2,
			description = {
				modifyingValue < 0 and "chaos-description.evolution-time-factor-decreased" or
				"chaos-description.evolution-time-factor-increased", math.roundTo((modifyingValue / baseValue) * 100, 1) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("enemy_evolution", "time_factor",
			effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "evolution-destroy-factor",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.enemy_evolution.destroy_factor
		local modifyingValue = modifier.applyMapSettingsModifier("enemy_evolution", "destroy_factor")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and 2 or -2,
			description = {
				modifyingValue < 0 and "chaos-description.evolution-destroy-factor-decreased" or
				"chaos-description.evolution-destroy-factor-increased",
				math.roundTo((modifyingValue / baseValue) * 100, 1) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("enemy_evolution", "destroy_factor",
			effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "evolution-pollution-factor",
	duration = 10800,
	effectFunction = function()
		local baseValue = game.map_settings.enemy_evolution.pollution_factor
		local modifyingValue = modifier.applyMapSettingsModifier("enemy_evolution", "pollution_factor")
		return {
			modifyingValue = modifyingValue,
			gain = modifyingValue < 0 and 2 or -2,
			description = {
				modifyingValue < 0 and "chaos-description.evolution-pollution-factor-decreased" or
				"chaos-description.evolution-pollution-factor-increased",
				math.roundTo((modifyingValue / baseValue) * 100, 1) },
		}
	end,
	resetFunction = function(effectFunctionTable)
		modifier.revertMapSettingsModifier("enemy_evolution", "pollution_factor",
			effectFunctionTable.modifyingValue)
	end,

})

addChaosEffect({

	name = "enemy-expansion",
	effectFunction = function()
		local modifier = game.map_settings.enemy_expansion.enabled

		if modifier then
			game.map_settings.enemy_expansion.enabled = false
			return {
				description = { "chaos-description.enemy-expansion-disabled" },
				gain = 3
			}
		else
			game.map_settings.enemy_expansion.enabled = true
			return {
				description = { "chaos-description.enemy-expansion-enabled" },
				gain = -3
			}
		end
	end,

})

addChaosEffect({

	name = "turn-rocks-into-trees",
	gain = 2,
	description = { "chaos-description.turn-rocks-into-trees" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "type",
			type = "tree"
		} })

		local keys = {}
		for key, _ in pairs(searchTable) do
			table.insert(keys, key)
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "simple-entity",
		}) do
			if entity.valid then
				surface.create_entity {
					name = searchTable[keys[math.random(#keys)]].name,
					position = entity.position
				}
				entity.destroy {}
			end
		end
	end,

})

addChaosEffect({

	name = "turn-rocks-into-resources",
	gain = 2,
	description = { "chaos-description.turn-rocks-into-resources" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local searchTable = game.get_filtered_entity_prototypes({ {
			filter = "type",
			type = "resource"
		} })

		local keys = {}
		for key, prototype in pairs(searchTable) do
			if prototype.resource_category == "basic-solid" then
				table.insert(keys, key)
			end
		end

		for k, entity in pairs(surface.find_entities_filtered {
			type = "simple-entity",
		}) do
			if entity.valid then
				surface.create_entity {
					name = searchTable[keys[math.random(#keys)]].name,
					position = entity.position,
					amount = math.randomRange(100, 1000),
					enable_tree_removal = false,
					enable_cliff_removal = false,
					snap_to_tile_center = true
				}

				entity.destroy()
			end
		end
	end,

})

addChaosEffect({

	name = "deplete-random-resources",
	gain = -3,
	description = { "chaos-description.deplete-random-resources" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local randomNumber = math.random(10, 100)

		for k, entity in pairs(surface.find_entities_filtered {
			type = "resource",
		}) do
			if entity.valid and math.random(1, randomNumber) == 1 then
				entity.deplete()
			end
		end
	end,

})

addChaosEffect({

	name = "mapgen-cliff-richness",
	description = { "chaos-description.mapgen-cliff-richness" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_size"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["cliff_settings"]["richness"] = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			modifyingValue = value,
			gain = value < 1 and 2 or
				(value == 1 and 0 or -2),
			description = { "chaos-description.mapgen-cliff-richness", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-cliff-elevation-interval",
	description = { "chaos-description.mapgen-cliff-elevation-interval" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "cliff_elevation_interval"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["cliff_settings"]["cliff_elevation_interval"] = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			modifyingValue = value,
			gain = value < 40 and -2 or
				(value == 40 and 0 or 2),
			description = { "chaos-description.mapgen-cliff-elevation-interval", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-water-coverage",
	description = { "chaos-description.mapgen-water-coverage" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_size"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["water"] = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			modifyingValue = value,
			description = { "chaos-description.mapgen-water-coverage", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-water-scale",
	description = { "chaos-description.mapgen-water-scale" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_scale"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["terrain_segmentation"] = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			modifyingValue = value,
			description = { "chaos-description.mapgen-water-scale", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-autoplace-trees-frequency",
	description = { "chaos-description.mapgen-autoplace-trees-frequency" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_scale"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["autoplace_controls"].trees.frequency = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			modifyingValue = value,
			description = { "chaos-description.mapgen-autoplace-trees-frequency", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-autoplace-trees-size",
	description = { "chaos-description.mapgen-autoplace-trees-size" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_size"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["autoplace_controls"].trees.size = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			modifyingValue = value,
			description = { "chaos-description.mapgen-autoplace-trees-size", description },
		}
	end,

})

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

addChaosEffect({

	name = "mapgen-autoplace-enemy-base-frequency",
	description = { "chaos-description.mapgen-autoplace-enemy-base-frequency" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_size_nonzero"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["autoplace_controls"]["enemy-base"].frequency = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			gain = value < 1 and 2 or (value == 1 and 0 or -2),
			modifyingValue = value,
			description = { "chaos-description.mapgen-autoplace-enemy-base-frequency", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-autoplace-enemy-base-size",
	description = { "chaos-description.mapgen-autoplace-enemy-base-size" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_size"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["autoplace_controls"]["enemy-base"].size = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			gain = value < 1 and 2 or (value == 1 and 0 or -2),
			modifyingValue = value,
			description = { "chaos-description.mapgen-autoplace-enemy-base-size", description },
		}
	end,

})

addChaosEffect({

	name = "mapgen-autoplace-enemy-base-richness",
	description = { "chaos-description.mapgen-autoplace-enemy-base-richness" },
	effectFunction = function()
		local surface = game.players[#game.players].surface
		local modifier_mod = "map_gen_size_nonzero"
		local fn = function(number)
			local mapGenSettings = surface.map_gen_settings
			mapGenSettings["autoplace_controls"]["enemy-base"].richness = number
			return mapGenSettings
		end
		local entry = modifier.applyMapGenSettingsModifier(surface, fn, modifier_mod)
		local value = modifier[modifier_mod][entry].value
		local description = modifier[modifier_mod][entry].description
		return {
			gain = value < 1 and 2 or (value == 1 and 0 or -2),
			modifyingValue = value,
			description = { "chaos-description.mapgen-autoplace-enemy-base-richness", description },
		}
	end,

})
