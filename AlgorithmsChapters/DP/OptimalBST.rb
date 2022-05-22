def min( *arr)
	return arr.min()
end

def optBstCostUtil( freq,  i,  j)
	if (i > j)
		return 0
	end
	if (j == i)
		# one element in this subarray
		return freq[i]
	end
	min = 99999
	r = i
	while (r <= j)
		min = min(min,optBstCostUtil(freq, i, r - 1) + optBstCostUtil(freq, r + 1, j))
		r += 1
	end
	return min + sum(freq, i, j)
end

def optBstCost( keys,  freq)
	n = freq.length
	return optBstCostUtil(freq, 0, n - 1)
end

def optBstCostTD( keys,  freq)
	n = freq.length
	cost = Array.new(n){Array.new(n){99999}}
	i = 0
	while (i < n)
		cost[i][i] = freq[i]
		i += 1
	end
	return optBstCostTDUtil(freq, cost, 0, n - 1)
end

def optBstCostTDUtil( freq,  cost,  i,  j)
	if (i > j)
		return 0
	end
	if (cost[i][j] != 99999)
		return cost[i][j]
	end
	s = sum(freq, i, j)
	r = i
	while (r <= j)
		cost[i][j] = min(cost[i][j],optBstCostTDUtil(freq, cost, i, r - 1) + 
									optBstCostTDUtil(freq, cost, r + 1, j) + s)
		r += 1
	end
	return cost[i][j]
end

def sum( freq,  i,  j)
	s = 0
	k = i
	while (k <= j)
		s += freq[k]
		k += 1
	end
	return s
end

def sumInit( freq,  n)
	sum = Array.new(n){0}
	sum[0] = freq[0]
	i = 1
	while (i < n)
		sum[i] = sum[i - 1] + freq[i]
		i += 1
	end
	return sum
end

def sumRange( sum,  i,  j)
	if (i == 0)
		return sum[j]
	end
	return sum[j] - sum[i - 1]
end

def optBstCostBU( keys,  freq)
	n = freq.length
	cost = Array.new(n){Array.new(n){99999}}

	i = 0
	while (i < n)
		cost[i][i] = freq[i]
		i += 1
	end
	sm = 0
	l = 1
	while (l < n)
		i = 0
		j = i + l
		# l is length of range.
		while (j < n)
			sm = sum(freq, i, j)
			r = i
			while (r <= j)
				cost[i][j] = min(cost[i][j],sm + ((r - 1 >= i) ? cost[i][r - 1] : 0) + ((r + 1 <= j) ? cost[r + 1][j] : 0))
				r += 1
			end
			i += 1
			j += 1
		end
		l += 1
	end
	return cost[0][n - 1]
end

def optBstCostBU2( keys,  freq)
	n = freq.length
	cost = Array.new(n){Array.new(n){99999}}

	sumArr = sumInit(freq, n)
	i = 0
	while (i < n)
		cost[i][i] = freq[i]
		i += 1
	end
	sm = 0
	l = 1
	while (l < n)
		i = 0
		j = i + l
		# l is length of range.
		while (j < n)
			sm = sumRange(sumArr, i, j)
			r = i
			while (r <= j)
				cost[i][j] = min(cost[i][j],sm + ((r - 1 >= i) ? cost[i][r - 1] : 0) + ((r + 1 <= j) ? cost[r + 1][j] : 0))
				r += 1
			end
			i += 1
			j += 1
		end
		l += 1
	end
	return cost[0][n - 1]
end

keys = [9, 15, 25]
freq = [30, 10, 40]
print("OBST cost:" + optBstCost(keys, freq).to_s,"\n")
print("OBST cost:" + optBstCostTD(keys, freq).to_s,"\n")
print("OBST cost:" + optBstCostBU(keys, freq).to_s,"\n")
print("OBST cost:" + optBstCostBU2(keys, freq).to_s,"\n")
