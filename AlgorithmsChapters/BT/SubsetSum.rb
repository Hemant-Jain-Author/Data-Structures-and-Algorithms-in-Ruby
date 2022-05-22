def printSubset( flags,  arr,  size)
	i = 0
	while (i < size)
		if (flags[i])
			print(arr[i].to_s + " ")
		end
		i += 1
	end
	print("\n")
end

def subsetSum( arr,  n,  target)
	flags = Array.new(n){false}
	subsetSumUtil(arr, n, flags, 0, 0, target)
end

def subsetSumUtil( arr,  n,  flags,  sum,  curr,  target)
	if (target == sum)
		printSubset(flags, arr, n)
		# Solution found.
		return
	end
	if (curr >= n || sum > target)
		# constraint check and Backtracking.
		return
	end
	# Current element included.
	flags[curr] = true
	subsetSumUtil(arr, n, flags, sum + arr[curr], curr + 1, target)
	# Current element excluded.
	flags[curr] = false
	subsetSumUtil(arr, n, flags, sum, curr + 1, target)
end

arr = [15, 22, 14, 26, 32, 9, 16, 8]
target = 53
n = arr.length
subsetSum(arr, n, target)

"""
15 22 16 
15 14 16 8 
22 14 9 8 
"""