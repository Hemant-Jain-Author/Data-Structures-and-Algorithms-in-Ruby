
def max( *arr)
	return arr.max()
end

def maxCost01Knapsack( wt,  cost,  capacity)
	n = wt.length
	return maxCost01KnapsackUtil(wt, cost, n, capacity)
end

def maxCost01KnapsackUtil( wt,  cost,  n,  capacity)
	# Base Case
	if (n == 0 || capacity == 0)
		return 0
	end
	# Return the maximum of two cases:
	# (1) nth item is included
	# (2) nth item is not included
	first = 0
	if (wt[n - 1] <= capacity)
		first = cost[n - 1] + maxCost01KnapsackUtil(wt, cost, n - 1, capacity - wt[n - 1])
	end
	second = maxCost01KnapsackUtil(wt, cost, n - 1, capacity)
	return max(first,second)
end

def maxCost01KnapsackTD( wt,  cost,  capacity)
	n = wt.length
	dp = Array.new(capacity + 1){Array.new(n + 1){0}}
	return maxCost01KnapsackTDUtil(dp, wt, cost, n, capacity)
end

def maxCost01KnapsackTDUtil( dp,  wt,  cost,  i,  w)
	if (w == 0 || i == 0)
		return 0
	end
	if (dp[w][i] != 0)
		return dp[w][i]
	end
	# Their are two cases:
	# (1) ith item is included
	# (2) ith item is not included
	first = 0
	if (wt[i - 1] <= w)
		first = maxCost01KnapsackTDUtil(dp, wt, cost, i - 1, w - wt[i - 1]) + cost[i - 1]
	end
	second = maxCost01KnapsackTDUtil(dp, wt, cost, i - 1, w)
	return dp[w][i] = max(first,second)
end

def maxCost01KnapsackBU( wt,  cost,  capacity)
	n = wt.length
	dp = Array.new(capacity + 1){Array.new(n + 1){0}}
	w = 1
	# Build table dp[][] in bottom up approach.
	# Weights considered against capacity.
	while (w <= capacity)
		i = 1
		while (i <= n)
			# Their are two cases:
			# (1) ith item is included
			# (2) ith item is not included
			first = 0
			if (wt[i - 1] <= w)
				first = dp[w - wt[i - 1]][i - 1] + cost[i - 1]
			end
			second = dp[w][i - 1]
			dp[w][i] = max(first,second)
			i += 1
		end
		w += 1
	end
	printItems(dp, wt, cost, n, capacity)
	return dp[capacity][n]
end

def printItems( dp,  wt,  cost,  n,  capacity)
	totalCost = dp[capacity][n]
	print("Selected items are:")
	i = n - 1
	while (i > 0)
		if (totalCost != dp[capacity][i - 1])
			print(" (wt:" + wt[i].to_s + ", cost:" + cost[i].to_s + ")")
			capacity -= wt[i]
			totalCost -= cost[i]
		end
		i -= 1
	end
end

def KS01UnboundBU( wt,  cost,  capacity)
	n = wt.length
	dp = Array.new(capacity + 1){0}
	w = 1
	# Build table dp[] in bottom up approach.
	# Weights considered against capacity.
	while (w <= capacity)
		i = 1
		while (i <= n)
			# Their are two cases:
			# (1) ith item is included
			# (2) ith item is not included
			if (wt[i - 1] <= w)
				dp[w] = max(dp[w],dp[w - wt[i - 1]] + cost[i - 1])
			end
			i += 1
		end
		w += 1
	end
	# printItems(dp, wt, cost, n, capacity);
	return dp[capacity]
end

wt = [10, 40, 20, 30]
cost = [60, 40, 90, 120]
capacity = 50
maxCost = KS01UnboundBU(wt, cost, capacity)
print("Maximum cost obtained = " + maxCost.to_s,"\n")
maxCost = maxCost01Knapsack(wt, cost, capacity)
print("Maximum cost obtained = " + maxCost.to_s,"\n")
maxCost = maxCost01KnapsackBU(wt, cost, capacity)
print("Maximum cost obtained = " + maxCost.to_s,"\n")
maxCost = maxCost01KnapsackTD(wt, cost, capacity)
print("Maximum cost obtained = " + maxCost.to_s,"\n")
