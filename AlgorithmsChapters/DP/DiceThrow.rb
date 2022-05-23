def findWays( n,  m,  vertex)
	dp = Array.new(n + 1){Array.new(vertex + 1){0}}
	
	# Table entries for only one dice.
	j = 1
	while (j <= m && j <= vertex)
		dp[1][j] = 1
		j += 1
	end

	# i is number of dice, j is Value, k value of dice.
	i = 2
	while (i <= n)
		j = 1
		while (j <= vertex)
			k = 1
			while (k <= j && k <= m)
				dp[i][j] += dp[i - 1][j - k]
				k += 1
			end
			j += 1
		end
		i += 1
	end
	return dp[n][vertex]
end

print(findWays(3, 6, 6).to_s)

# 10