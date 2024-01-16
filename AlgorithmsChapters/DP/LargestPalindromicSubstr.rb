# Palindromic Substrings
def largestPalinSubstr( str)
	n = str.length
	dp = Array.new(n){Array.new(n){0}}
	i = 0
	while (i < n)
		dp[i][i] = 1
		i += 1
	end
	max = 1
	start = 0
	l = 1
	while (l < n)
		i = 0
		j = i + l
		while (j < n)
			if (str[i] == str[j] && dp[i + 1][j - 1] == j - i - 1)
				dp[i][j] = dp[i + 1][j - 1] + 2
				if (dp[i][j] > max)
					max = dp[i][j]
					# Keeping track of max length and
					start = i
				end
			else
				dp[i][j] = 0
			end
			i += 1
			j += 1
		end
		l += 1
	end
	print("Max Length Palindromic Substrings : " + str[start...start + max],"\n")
	return max
end

str = "ABCAUCBCxxCBA"
print("Max Palindromic Substrings len: " + largestPalinSubstr(str).to_s,"\n")

"""
Max Length Palindromic Substrings : BCxxCB
Max Palindromic Substrings len: 6
"""
