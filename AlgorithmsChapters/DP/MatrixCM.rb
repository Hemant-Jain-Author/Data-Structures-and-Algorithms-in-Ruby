def min( *arr)
	return arr.min()
end

def MatrixChainMulBruteForceUtil( p,  i,  j)
	if (i == j)
		return 0
	end
	min = 99999
	k = i
	# place parenthesis at different places between
	# first and last matrix, recursively calculate
	# count of multiplications for each parenthesis
	# placement and return the minimum count
	while (k < j)
		count = MatrixChainMulBruteForceUtil(p, i, k) + 
		MatrixChainMulBruteForceUtil(p, k + 1, j) + p[i-1]*p[k]*p[j]
		if (count < min)
			min = count
		end
		k += 1
	end
	# Return minimum count
	return min
end

def MatrixChainMulBruteForce( p,  n)
	i = 1
	j = n - 1
	return MatrixChainMulBruteForceUtil(p, i, j)
end

def MatrixChainMulTD( p,  n)
	dp = Array.new(n){Array.new(n){99999}}
	i = 1
	while (i < n)
		dp[i][i] = 0
		i += 1
	end
	return MatrixChainMulTDUtil(dp, p, 1, n - 1)
end

# Function for matrix chain multiplication
def MatrixChainMulTDUtil( dp,  p,  i,  j)
	# Base Case
	if (dp[i][j] != 99999)
		return dp[i][j]
	end
	k = i
	while (k < j)
		dp[i][j] = min(dp[i][j],MatrixChainMulTDUtil(dp, p, i, k) + 
			MatrixChainMulTDUtil(dp, p, k + 1, j) + p[i-1]*p[k]*p[j])
		k += 1
	end
	return dp[i][j]
end

def MatrixChainMulBU( p,  n)
	dp = Array.new(n){Array.new(n){99999}}

	i = 1
	while (i < n)
		dp[i][i] = 0
		i += 1
	end
	
	l = 1
	while (l < n)
		i = 1
		j = i + l
		# l is length of range.
		while (j < n)
			k = i
			while (k < j)
				dp[i][j] = min(dp[i][j],dp[i][k] + p[i - 1] * p[k] * p[j] + dp[k + 1][j])
				k += 1
			end
			i += 1
			j += 1
		end
		l += 1
	end
	return dp[1][n - 1]
end

def PrintOptPar( n,  pos,  i,  j)
	if (i == j)
		print("M" + pos[i][i].to_s + " ")
	else
		print("( ")
		PrintOptPar(n, pos, i, pos[i][j])
		PrintOptPar(n, pos, pos[i][j] + 1, j)
		print(") ")
	end
end

def PrintOptimalParenthesis( n,  pos)
	print("OptimalParenthesis : ")
	PrintOptPar(n, pos, 1, n - 1)
	print("","\n")
end

def MatrixChainMulBU2( p,  n)
	dp = Array.new(n){Array.new(n){99999}}
	pos = Array.new(n){Array.new(n){0}}

	i = 1
	while (i < n)
		dp[i][i] = 0
		pos[i][i] = i
		i += 1
	end

	l = 1
	while (l < n)
		i = 1
		j = i + l
		# l is length of range.
		while (j < n)
			k = i
			while (k < j)
				dp[i][j] = min(dp[i][j],dp[i][k] + p[i - 1] * p[k] * p[j] + dp[k + 1][j])
				pos[i][j] = k
				k += 1
			end
			i += 1
			j += 1
		end
		l += 1
	end
	PrintOptimalParenthesis(n, pos)
	return dp[1][n - 1]
end

# Driver Code
arr = [1, 2, 3, 4]
n = arr.length
print("Matrix Chain Multiplication is: " + MatrixChainMulBruteForce(arr, n).to_s,"\n")
print("Matrix Chain Multiplication is: " + MatrixChainMulTD(arr, n).to_s,"\n")
print("Matrix Chain Multiplication is: " + MatrixChainMulBU(arr, n).to_s,"\n")
print("Matrix Chain Multiplication is: " + MatrixChainMulBU2(arr, n).to_s,"\n")
