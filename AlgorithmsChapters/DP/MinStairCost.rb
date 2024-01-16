def min( *arr)
	return arr.min()
end

def minStairCost( cost,  n)
	# base case
	if (n == 1)
		return cost[0]
	end

	dp = Array.new(n){0}
	dp[0] = cost[0]
	dp[1] = cost[1]

	i = 2
	while (i < n)
		dp[i] = min(dp[i - 1],dp[i - 2]) + cost[i]
		i += 1
	end
	return min(dp[n - 2],dp[n - 1])
end

a = [1, 5, 6, 3, 4, 7, 9, 1, 2, 11]
n = a.length
print("minStairCost : " + minStairCost(a, n).to_s)

# minStairCost : 18
