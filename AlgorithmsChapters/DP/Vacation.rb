def min( *arr)
	return arr.min()
end

def max( *arr)
	return arr.max()
end

# days are must travel days, costs are cost of tickets.
def self.minCostTravel( days,  costs)
	n = days.length
	max = days[n - 1]
	dp = Array.new(max + 1){0}
	j = 0
	i = 1
	while (i <= max)
		if (days[j] == i)
			# That days is definitely travelled.
			j += 1
			dp[i] = dp[i - 1] + costs[0]
			dp[i] = min(dp[i],dp[max(0,i - 7)] + costs[1])
			dp[i] = min(dp[i],dp[max(0,i - 30)] + costs[2])
		else
			dp[i] = dp[i - 1]
		end
		i += 1
	end
	return dp[max]
end

days = [1, 3, 5, 7, 12, 20, 30]
costs = [2, 7, 20]
print("Min cost is:" + self.minCostTravel(days, costs).to_s,"\n")
