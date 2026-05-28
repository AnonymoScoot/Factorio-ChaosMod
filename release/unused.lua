-- addChaosEffect({

-- 	gain = 0,
-- 	description = {"chaos-description.clone-random-area"},
-- 	effectFunction = function(event)

-- 		local surface = game.players[#game.players].surface
-- 		local randomChunkPosition = surface.get_random_chunk()



-- 		local boundingBox = {
-- 			left_top = { x = randomChunkPosition.x * 32 + math.random(-32,32) * 32, y = randomChunkPosition.y * 32 + math.random(-32,32) * 32},
-- 			right_bottom = { x = randomChunkPosition.x * 32 + math.random(-32,32) * 32, y = randomChunkPosition.y * 32 + math.random(-32,32) * 32},
-- 		}

-- 		local sideX = boundingBox.right_bottom.


-- 		local randomOffsetChunkPosition = surface.get_random_chunk()
-- 		local offsetX = (randomOffsetChunkPosition.x - randomChunkPosition.x) * 32
-- 		local offsetY = (randomOffsetChunkPosition.y - randomChunkPosition.y) * 32
-- 		local destination = boundingBox
-- 		destination.left_top.x = destination.left_top.x + offsetX
-- 		destination.left_top.y = destination.left_top.y + offsetY
-- 		destination.right_bottom.x = destination.right_bottom.x + offsetX
-- 		destination.right_bottom.y = destination.right_bottom.y + offsetY

-- 		surface.clone_area{
-- 			source_area = boundingBox,
-- 			destination_area = destination,
-- 			clone_tiles = true,
-- 			clone_entities = true,
-- 			clone_decoratives = true,
-- 			clear_destination_entities = true,
-- 			clear_destination_decoratives = true,
-- 			expand_map = true,
-- 			create_build_effect_smoke = false,
-- 		}

-- 	end,

-- })
