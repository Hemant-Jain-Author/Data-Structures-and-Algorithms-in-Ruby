def RadixSort( arr)
	n = arr.length
	m = getMax(arr, n)
	div = 1
	# Counting sort for every digit.
	# The dividend passed is used to calculate current working digit.
	while (m / div > 0)
		countSort(arr, n, div)
		div *= 10
	end
end

def countSort( arr, n, dividend)
	temp = arr.clone()
	count = Array.new(10){0}
	i = 0
	# Store count of occurrences in count array.
	# (number / dividend) % 10 is used to find the working digit.
	while (i < n)
		count[(temp[i] / dividend) % 10] += 1
		i += 1
	end
	i = 1
	# Change count[i] so that count[i] contains
	# number of elements till index i in output.
	while (i < 10)
		count[i] += count[i - 1]
		i += 1
	end
	i = n - 1
	# Copy content to input arr.
	while (i >= 0)
		index = (temp[i] / dividend) % 10
		arr[count[index] - 1] = temp[i]
		count[index] -= 1
		i -= 1
	end
end

def getMax( arr, n)
	max = arr[0]
	i = 1
	while (i < n)
		if (max < arr[i])
			max = arr[i]
		end
		i += 1
	end
	return max
end

array = [100, 49, 65, 91, 702, 29, 4, 55]
RadixSort(array)
print array
