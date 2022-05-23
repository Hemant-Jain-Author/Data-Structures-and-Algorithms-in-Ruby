def LCSubStr( str1,  str2)
	m = str1.length
	n = str2.length
	dp = Array.new(m + 1){Array.new(n + 1){0}} # Dynamic programming array.
	p = Array.new(m + 1){Array.new(n + 1){0}}
	
	# For printing the substring.
	# Fill dp array in bottom up fashion.
	i = 1
	while (i <= m)
		j = 1
		while (j <= n)
			if (str1[i - 1] == str2[j - 1])
				dp[i][j] = dp[i - 1][j - 1] + 1
				p[i][j] = 0
			else
				dp[i][j] = (dp[i - 1][j] > dp[i][j - 1]) ? dp[i - 1][j] : dp[i][j - 1]
				p[i][j] = (dp[i - 1][j] > dp[i][j - 1]) ? 1 : 2
			end
			j += 1
		end
		i += 1
	end
	PrintLCS(p, str1, m, n)
	return dp[m][n]
end

def PrintLCS( p,  str1,  i,  j)
	if (i == 0 || j == 0)
		return
	end
	if (p[i][j] == 0)
		PrintLCS(p, str1, i - 1, j - 1)
		print(str1[i - 1])
	elsif (p[i][j] == 1)
		PrintLCS(p, str1, i - 1, j)
	else
		PrintLCS(p, str1, i, j - 1)
	end
end

str1 = "carpenter"
str2 = "sharpener"
print(LCSubStr(str1, str2),"\n")

# arpener7