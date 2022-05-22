def fibonacci( n)
	if (n < 2)
		return n
	end
	return fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacciBU( n)
	if (n < 2)
		return n
	end
	dp = Array.new(n + 1){0}
	dp[0] = 0
	dp[1] = 1
	i = 2
	while (i <= n)
		dp[i] = dp[i - 2] + dp[i - 1]
		i += 1
	end
	return dp[n]
end

def fibonacciBU2( n)
	if (n < 2)
		return n
	end
	first = 0
	second = 1
	temp = 0
	i = 2
	while (i <= n)
		temp = first + second
		first = second
		second = temp
		i += 1
	end
	return temp
end

def fibonacciTD( n)
	dp = Array.new(n + 1){0}
	fibonacciTDUtil(n, dp)
	return dp[n]
end

def fibonacciTDUtil( n,  dp)
	if (n < 2)
		return dp[n] = n
	end
	if (dp[n] != 0)
		return dp[n]
	end
	dp[n] = fibonacciTDUtil(n - 1, dp) + fibonacciTDUtil(n - 2, dp)
	return dp[n]
end

print(fibonacci(10),"\n")
print(fibonacciBU(10),"\n")
print(fibonacciBU2(10),"\n")
print(fibonacciTD(10),"\n")
