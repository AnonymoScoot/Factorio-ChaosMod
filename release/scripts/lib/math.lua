local mathlib = {}

function mathlib.clamp(value, min, max)
	return math.min(max, math.max(min, value))
end

function mathlib.round_to(value, increment)
	return math.floor(value / increment + 0.5) * increment
end

function mathlib.random_range(min, max)
	return math.random() * (max - min) + min
end

function mathlib.normalize(value, min, max)
	return (value - min) / (max - min)
end

return mathlib
