def lis( arr)
	n = arr.length
	lis = Array.new(n){0}
	max = 0
	i = 0
	# Populating LIS values in bottom up manner.
	while (i < n)
		lis[i] = 1
		j = 0
		# Initialize LIS values for all indexes as 1.
		while (j < i)
			if (arr[j] < arr[i] && lis[i] < lis[j] + 1)
				lis[i] = lis[j] + 1
			end
			j += 1
		end
		if (max < lis[i])
			# Max LIS values.
			max = lis[i]
		end
		i += 1
	end
	return max
end

arr = [10, 12, 9, 23, 25, 55, 49, 70]
print("Length of lis is " + lis(arr).to_s,"\n")
