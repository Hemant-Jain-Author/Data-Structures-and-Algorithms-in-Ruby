def max( *arr)
	return arr.max()
end

def lbs( arr)
	n = arr.length
	lis = Array.new(n){1} # Initialize LIS values for all indexes as 1.
	lds = Array.new(n){1} # Initialize LDS values for all indexes as 1.
	max = 0
	i = 0
	# Populating LIS values in bottom up manner.
	while (i < n)
		j = 0
		while (j < i)
			if (arr[j] < arr[i] && lis[i] < lis[j] + 1)
				lis[i] = lis[j] + 1
			end
			j += 1
		end
		i += 1
	end
	i = n - 1
	# Populating LDS values in bottom up manner.
	while (i > 0)
		j = n - 1
		while (j > i)
			if (arr[j] < arr[i] && lds[i] < lds[j] + 1)
				lds[i] = lds[j] + 1
			end
			j -= 1
		end
		i -= 1
	end
	i = 0
	while (i < n)
		max = max(max,lis[i] + lds[i] - 1)
		i += 1
	end
	return max
end

arr = [1, 6, 3, 11, 1, 9, 5, 12, 3, 14, 6, 17, 3, 19, 2, 19]
print("Length of lbs is " + lbs(arr).to_s,"\n")

# Length of lbs is 8
