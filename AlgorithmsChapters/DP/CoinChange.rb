def minCoins( coins,  n,  val)
	# Greedy may be wrong.
	if (val <= 0)
		return 0
	end
	count = 0
	coins.sort()
	i = n - 1
	while (i >= 0 && val > 0)
		if (coins[i] <= val)
			count += 1
			val -= coins[i]
		else
			i -= 1
		end
	end
	return (val == 0) ? count : -1
end

def minCoins2( coins,  n,  val)
	# Brute force.
	if (val == 0)
		return 0
	end
	count = 99999
	i = 0
	while (i < n)
		if (coins[i] <= val)
			subCount = minCoins2(coins, n, val - coins[i])
			if (subCount >= 0)
				count = [count,subCount + 1].min()
			end
		end
		i += 1
	end
	return (count != 99999) ? count : -1
end

def minCoinsTD( coins,  n,  val)
	count = Array.new(val + 1){99999}
	count[0] = 0
	# zero val need zero coins.
	return minCoinsTDUtil(count, coins, n, val)
end

def minCoinsTDUtil( count,  coins,  n,  val)
	# Base Case
	if (count[val] != 99999)
		return count[val]
	end
	i = 0
	# Recursion
	while (i < n)
		# For all possible coins
		if (coins[i] <= val)
			# check validity of a sub-problem
			subCount = minCoinsTDUtil(count, coins, n, val - coins[i])
			if (subCount != 99999 && count[val] > (subCount + 1))
				count[val] = subCount + 1
			end
		end
		i += 1
	end
	return count[val]
end

def minCoinsBU( coins,  n,  val)
	# DP bottom up approach.
	count = Array.new(val + 1){99999}
	count[0] = 0
	i = 1
	# Base value.
	while (i <= val)
		j = 0
		while (j < n)
			# For all coins smaller than or equal to i.
			if (coins[j] <= i && count[i - coins[j]] != 99999 && count[i] > count[i - coins[j]] + 1)
				count[i] = count[i - coins[j]] + 1
			end
			j += 1
		end
		i += 1
	end
	return (count[val] != 99999) ? count[val] : -1
end

def printCoinsUtil( cvalue,  val)
	if (val > 0)
		printCoinsUtil(cvalue, val - cvalue[val])
		print(cvalue[val].to_s + " ")
	end
end

def printCoins( cvalue,  val)
	print("Coins are : ")
	printCoinsUtil(cvalue, val)
	print("\n")
end

def minCoinsBU2( coins,  n,  val)
	# DP bottom up approach.
	count = Array.new(val + 1){99999}
	cvalue = Array.new(val + 1){99999}

	count[0] = 0
	i = 1
	# Base value.
	while (i <= val)
		j = 0
		while (j < n)
			# For all coins smaller than or equal to i.
			if (coins[j] <= i && count[i - coins[j]] != 99999 && count[i] > count[i - coins[j]] + 1)
				count[i] = count[i - coins[j]] + 1
				cvalue[i] = coins[j]
			end
			j += 1
		end
		i += 1
	end
	if (count[val] == 99999)
		return -1
	end
	printCoins(cvalue, val)
	return count[val]
end

coins = [5, 6]
value = 16
n = coins.length
print("Count is : " + minCoins(coins, n, value).to_s,"\n")
print("Count is : " + minCoins2(coins, n, value).to_s,"\n")
print("Count is : " + minCoinsTD(coins, n, value).to_s,"\n")
print("Count is : " + minCoinsBU(coins, n, value).to_s,"\n")
print("Count is : " + minCoinsBU2(coins, n, value).to_s,"\n")

# 	Count is : -1
# 	Count is : 3
# 	Count is : 3
# 	Count is : 3
# 	Coins are : 6 5 5 
# 	Count is : 3
