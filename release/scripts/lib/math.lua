function math.clamp(number, minValue, maxValue)
	if number < minValue then
		return minValue
	elseif number > maxValue then
		return maxValue
	else
		return number
	end
end

function math.clampBottom(number, minValue)
	if number < minValue then
		return minValue
	else
		return number
	end
end

function math.clampTop(number, maxValue)
	if number > maxValue then
		return maxValue
	else
		return number
	end
end

function math.roundTo(number, increment)
	return math.floor(number / increment + 0.5) * increment
end

function math.randomRange(minValue, maxValue)
	return math.random() * (maxValue - minValue) + minValue
end
