def LCSubStr( st1,  st2)
	_X = st1.chars
	_Y = st2.chars
	m = st1.length
	n = st2.length
	dp = Array.new(m + 1){Array.new(n + 1){0}} # Dynamic programming array.
	p = Array.new(m + 1){Array.new(n + 1){0}}
	
	i = 1
	# For printing the substring.
	# Fill dp array in bottom up fashion.
	while (i <= m)
		j = 1
		while (j <= n)
			if (_X[i - 1] == _Y[j - 1])
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
	PrintLCS(p, _X, m, n)
	return dp[m][n]
end

def PrintLCS( p,  _X,  i,  j)
	if (i == 0 || j == 0)
		return
	end
	if (p[i][j] == 0)
		PrintLCS(p, _X, i - 1, j - 1)
		print(_X[i - 1])
	elsif (p[i][j] == 1)
		PrintLCS(p, _X, i - 1, j)
	else
		PrintLCS(p, _X, i, j - 1)
	end
end

_X = "carpenter"
_Y = "sharpener"
print(LCSubStr(_X, _Y),"\n")
