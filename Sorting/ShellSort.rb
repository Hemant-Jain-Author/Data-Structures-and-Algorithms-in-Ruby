def greater( value1, value2)
	return value1 > value2
end

def ShellSort( arr)
	n = arr.length
	gap = n / 2
	# Gap starts with n/2 and half in each iteration.
	while (gap > 0)
		i = gap
		# Do a gapped insertion sort.
		while (i < n)
			curr = arr[i]
			# Shift elements of already sorted list
			# to find right position for curr value.
			j = i
			while (j >= gap && greater(arr[j - gap], curr))
				arr[j] = arr[j - gap]
				j -= gap
			end
			# Put current value in its correct location
			arr[j] = curr
			i += 1
		end
		gap /= 2
	end
end

array = [36, 32, 11, 6, 19, 31, 17, 3]
ShellSort(array)
print array
