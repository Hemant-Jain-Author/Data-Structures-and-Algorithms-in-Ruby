def max( *arr)
	return arr.max()
end

# Palindromic Subsequence
def largestPalindromicSubseq( str)
	n = str.length
	dp = Array.new(n){Array.new(n){0}}
	i = 0
	while (i < n)
		# each char is itself palindromic with length 1
		dp[i][i] = 1
		i += 1
	end
	l = 1
	while (l < n)
		i = 0
		j = l
		while (j < n)
			if (str[i] == str[j])
				dp[i][j] = dp[i + 1][j - 1] + 2
			else
				dp[i][j] = max(dp[i + 1][j],dp[i][j - 1])
			end
			i += 1
			j += 1
		end
		l += 1
	end
	return dp[0][n - 1]
end

str = "ABCAUCBCxxCBA"
print("Largest Palindromic Subseq: " + largestPalindromicSubseq(str).to_s,"\n")

# Largest Palindromic Subseq: 9
