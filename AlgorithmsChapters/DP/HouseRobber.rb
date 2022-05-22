def max( *arr)
	return arr.max()
end

def self.maxRobbery( house)
	n = house.length
	dp = Array.new(n){0}
	dp[0] = house[0]
	dp[1] = house[1]
	dp[2] = dp[0] + house[2]
	i = 3
	while (i < n)
		dp[i] = max(dp[i - 2],dp[i - 3]) + house[i]
		i += 1
	end
	return max(dp[n - 1],dp[n - 2])
end

def self.maxRobbery2( house)
	n = house.length
	dp = Array.new(n){Array.new(2){0}}
	dp[0][1] = house[0]
	dp[0][0] = 0
	i = 1
	while (i < n)
		dp[i][1] = max(dp[i - 1][0] + house[i],dp[i - 1][1])
		dp[i][0] = dp[i - 1][1]
		i += 1
	end
	return max(dp[n - 1][1],dp[n - 1][0])
end

arr = [10, 12, 9, 23, 25, 55, 49, 70]
print("Total cash: " + self.maxRobbery(arr).to_s,"\n")
print("Total cash: " + self.maxRobbery2(arr).to_s,"\n")
