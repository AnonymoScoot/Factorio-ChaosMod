local mathlib = {}

function mathlib.clamp(number, minValue, maxValue)
	if number < minValue then
		return minValue
	elseif number > maxValue then
		return maxValue
	else
		return number
	end
end

function mathlib.clampBottom(number, minValue)
	if number < minValue then
		return minValue
	else
		return number
	end
end

function mathlib.clampTop(number, maxValue)
	if number > maxValue then
		return maxValue
	else
		return number
	end
end

function mathlib.roundTo(number, increment)
	return math.floor(number / increment + 0.5) * increment
end

function mathlib.randomRange(minValue, maxValue)
	return math.random() * (maxValue - minValue) + minValue
end

return mathlib
