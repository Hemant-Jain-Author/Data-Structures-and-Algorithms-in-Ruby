def min( *arr)
	return arr.min()
end

def minCost( cost,  m,  n)
	if (m == 0 || n == 0)
		return 99999
	end
	if (m == 1 && n == 1)
		return cost[0][0]
	end
	return cost[m - 1][n - 1] + min(minCost(cost, m - 1, n - 1), 
								minCost(cost, m - 1, n), 
								minCost(cost, m, n - 1))
end

def minCostBU( cost,  m,  n)
	tc = Array.new(m){Array.new(n){0}}
	tc[0][0] = cost[0][0]
	i = 1
	# Initialize first column.
	while (i < m)
		tc[i][0] = tc[i - 1][0] + cost[i][0]
		i += 1
	end

	j = 1
	# Initialize first row.
	while (j < n)
		tc[0][j] = tc[0][j - 1] + cost[0][j]
		j += 1
	end
	
	i = 1
	while (i < m)
		j = 1
		while (j < n)
			tc[i][j] = cost[i][j] + min(tc[i - 1][j - 1], tc[i - 1][j], tc[i][j - 1])
			j += 1
		end
		i += 1
	end
	return tc[m - 1][n - 1]
end

cost = [
[1, 3, 4],
[4, 7, 5],
[1, 5, 3]]
print(minCost(cost, 3, 3),"\n")
print(minCostBU(cost, 3, 3),"\n")
