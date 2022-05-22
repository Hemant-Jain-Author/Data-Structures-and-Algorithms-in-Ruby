def min( x,  y,  z)
	return [x, y, z].min()
end

def editDist( str1,  str2)
	m = str1.length
	n = str2.length
	return editDistUtil(str1, str2, m, n)
end

def editDistUtil( str1,  str2,  m,  n)
	if (m == 0 || n == 0)
		# If any one string is empty, then empty the other string.
		return m + n
	end
	# If last characters of both strings are same, ignore last characters.
	if (str1[m - 1] == str2[n - 1])
		return editDistUtil(str1, str2, m - 1, n - 1)
	end
	# If last characters are not same, consider all three operations:
	# (1) Insert last char of second into first.
	# (2) Remove last char of first.
	# (3) Replace last char of first with second.
	return 1 + min(editDistUtil(str1, str2, m, n - 1), 
	# Insert
	editDistUtil(str1, str2, m - 1, n), 
	# Remove
	editDistUtil(str1, str2, m - 1, n - 1))
end

def editDistDP( str1,  str2)
	m = str1.length
	n = str2.length
	dp = Array.new(m + 1){Array.new(n + 1){0}}
	i = 0
	# Fill dp[][] in bottom up manner.
	while (i <= m)
		j = 0
		while (j <= n)
			# If any one string is empty, then empty the other string.
			if (i == 0 || j == 0)
				dp[i][j] = (i + j)
			elsif (str1[i - 1] == str2[j - 1])
				dp[i][j] = dp[i - 1][j - 1]
			else
				dp[i][j] = 1 + min(dp[i][j - 1],
				# Insert
				dp[i - 1][j],
				# Remove
				dp[i - 1][j - 1])
			end
			j += 1
		end
		i += 1
	end
	return dp[m][n]
end

str1 = "sunday"
str2 = "saturday"
print(editDist(str1, str2),"\n")
print(editDistDP(str1, str2),"\n")
