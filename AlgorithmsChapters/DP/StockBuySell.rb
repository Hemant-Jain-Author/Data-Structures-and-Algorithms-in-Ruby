def maxProfit( arr)
	buyProfit = -arr[0] # Buy stock profit
	sellProfit = 0 # Sell stock profit
	n = arr.length
	i = 1
	while (i < n)
		newBuyProfit = (sellProfit - arr[i] > buyProfit) ? sellProfit - arr[i] : buyProfit
		newSellProfit = (buyProfit + arr[i] > sellProfit) ? buyProfit + arr[i] : sellProfit
		buyProfit = newBuyProfit
		sellProfit = newSellProfit
		i += 1
	end
	return sellProfit
end

def maxProfitTC( arr,  t)
	buyProfit = -arr[0]
	sellProfit = 0
	n = arr.length
	i = 1
	while (i < n)
		newBuyProfit = ((sellProfit - arr[i]) > buyProfit) ? (sellProfit - arr[i]) : buyProfit
		newSellProfit = ((buyProfit + arr[i] - t) > sellProfit) ? (buyProfit + arr[i] - t) : sellProfit
		buyProfit = newBuyProfit
		sellProfit = newSellProfit
		i += 1
	end
	return sellProfit
end

def maxProfit2( arr)
	n = arr.length
	dp = Array.new(n){Array.new(2){0}}
	dp[0][0] = -arr[0] # Buy stock profit
	dp[0][1] = 0

	i = 1
	# Sell stock profit
	while (i < n)
		dp[i][0] = (dp[i - 1][1] - arr[i] > dp[i - 1][0]) ? dp[i - 1][1] - arr[i] : dp[i - 1][0]
		dp[i][1] = (dp[i - 1][0] + arr[i] > dp[i - 1][1]) ? dp[i - 1][0] + arr[i] : dp[i - 1][1]
		i += 1
	end
	return dp[n - 1][1]
end

def maxProfitTC2( arr,  t)
	n = arr.length
	dp = Array.new(n){Array.new(2){0}}
	dp[0][0] = -arr[0]
	dp[0][1] = 0
	i = 1
	while (i < n)
		dp[i][0] = ((dp[i - 1][1] - arr[i]) > dp[i - 1][0]) ? (dp[i - 1][1] - arr[i]) : dp[i - 1][0]
		dp[i][1] = ((dp[i - 1][0] + arr[i] - t) > dp[i - 1][1]) ? (dp[i - 1][0] + arr[i] - t) : dp[i - 1][1]
		i += 1
	end
	return dp[n - 1][1]
end

arr = [10, 12, 9, 23, 25, 55, 49, 70]
print("Total profit: " + maxProfit(arr).to_s,"\n")
print("Total profit: " + maxProfit2(arr).to_s,"\n")
print("Total profit: " + maxProfitTC(arr, 2).to_s,"\n")
print("Total profit: " + maxProfitTC2(arr, 2).to_s,"\n")
