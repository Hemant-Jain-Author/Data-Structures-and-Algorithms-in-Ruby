def stairUniqueWaysBU( n)
	if (n <= 2)
		return n
	end
	first = 1
	second = 2
	temp = 0
	i = 3
	while (i <= n)
		temp = first + second
		first = second
		second = temp
		i += 1
	end
	return temp
end

def stairUniqueWaysBU2( n)
	if (n < 2)
		return n
	end
	ways = Array.new(n){0}
	ways[0] = 1
	ways[1] = 2
	i = 2
	while (i < n)
		ways[i] = ways[i - 1] + ways[i - 2]
		i += 1
	end
	return ways[n - 1]
end

print("Unique way to reach top:: " + stairUniqueWaysBU(4).to_s,"\n")
print("Unique way to reach top:: " + stairUniqueWaysBU2(4).to_s,"\n")
