def min( *arr)
	return arr.min()
end

def max( *arr)
	return arr.max()
end

def mxVal( mx,  i,  j)
	if (mx[i][j] != -99999)
		return mx[i][j]
	end
	k = i
	while (k < j)
		mx[i][j] = [mx[i][j], mxVal(mx, i, k), mxVal(mx, k + 1, j)].max()
		k += 1
	end
	return mx[i][j]
end

def minCostBstTDUtil( dp,  mx,  i,  j,  arr)
	if (j <= i)
		return 0
	end
	if (dp[i][j] != 99999)
		return dp[i][j]
	end
	k = i
	while (k < j)
		dp[i][j] = min(dp[i][j],minCostBstTDUtil(dp, mx, i, k, arr) + 
							minCostBstTDUtil(dp, mx, k + 1, j, arr) + 
							mxVal(mx, i, k) * mxVal(mx, k + 1, j))
		k += 1
	end
	return dp[i][j]
end

def minCostBstTD( arr)
	n = arr.length
	dp = Array.new(n){Array.new(n){99999}}
	mx = Array.new(n){Array.new(n){-99999}}

	i = 0
	while (i < n)
		mx[i][i] = arr[i]
		i += 1
	end
	return minCostBstTDUtil(dp, mx, 0, n - 1, arr)
end

def minCostBstBU( arr)
	n = arr.length
	dp = Array.new(n){Array.new(n){0}}
	mx = Array.new(n){Array.new(n){0}}
	i = 0
	while (i < n)
		mx[i][i] = arr[i]
		i += 1
	end
	l = 1
	while (l < n)
		i = 0
		j = i + l
		# l is length of range.
		while (j < n)
			dp[i][j] = 99999
			k = i
			while (k < j)
				dp[i][j] = min(dp[i][j],dp[i][k] + dp[k + 1][j] + mx[i][k] * mx[k + 1][j])
				mx[i][j] = max(mx[i][k],mx[k + 1][j])
				k += 1
			end
			i += 1
			j += 1
		end
		l += 1
	end
	return dp[0][n - 1]
end

arr = [6, 2, 4]
print("Total cost: " + minCostBstTD(arr).to_s,"\n")
print("Total cost: " + minCostBstBU(arr).to_s,"\n")

"""
Total cost: 32
Total cost: 32
"""