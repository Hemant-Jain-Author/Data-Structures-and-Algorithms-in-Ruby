def gridUniqueWays( m,  n)
	dp = Array.new(m){Array.new(n){0}}
	dp[0][0] = 1
	i = 1
	# Initialize first column.
	while (i < m)
		dp[i][0] = dp[i - 1][0]
		i += 1
	end
	j = 1
	# Initialize first row.
	while (j < n)
		dp[0][j] = dp[0][j - 1]
		j += 1
	end
	i = 1
	while (i < m)
		j = 1
		while (j < n)
			dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
			j += 1
		end
		i += 1
	end
	return dp[m - 1][n - 1]
end

# Diagonal movement allowed.
def gridUnique3Ways( m,  n)
	dp = Array.new(m){Array.new(n){0}}
	dp[0][0] = 1
	i = 1
	# Initialize first column.
	while (i < m)
		dp[i][0] = dp[i - 1][0]
		i += 1
	end
	j = 1
	# Initialize first row.
	while (j < n)
		dp[0][j] = dp[0][j - 1]
		j += 1
	end
	i = 1
	while (i < m)
		j = 1
		while (j < n)
			dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j] + dp[i][j - 1]
			j += 1
		end
		i += 1
	end
	return dp[m - 1][n - 1]
end

print(gridUniqueWays(3, 3),"\n")
print(gridUnique3Ways(3, 3),"\n")

"""
6
13
"""