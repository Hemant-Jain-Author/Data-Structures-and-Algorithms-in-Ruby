def makePairs( nuts,  bolts)
	makePairsUtil(nuts, bolts, 0, nuts.length - 1)
	print("Matched nuts and bolts are : ",nuts,bolts)
end

# Quick sort kind of approach.
def makePairsUtil( nuts,  bolts,  low,  high)
	if (low < high)
		# Choose first element of bolts array as pivot to partition nuts.
		pivot = partition(nuts, low, high, bolts[low])
		# Using nuts[pivot] as pivot to partition bolts.
		partition(bolts, low, high, nuts[pivot])
		# Recursively lower and upper half of nuts and bolts are matched.
		makePairsUtil(nuts, bolts, low, pivot - 1)
		makePairsUtil(nuts, bolts, pivot + 1, high)
	end
end

def swap( arr,  first,  second)
	temp = arr[first]
	arr[first] = arr[second]
	arr[second] = temp
end

# Partition method similar to quick sort algorithm.
def partition( arr,  low,  high,  pivot)
	i = low
	j = low
	while (j < high)
		if (arr[j] < pivot)
			swap(arr, i, j)
			i += 1
		elsif (arr[j] == pivot)
			swap(arr, high, j)
			j -= 1
		end
		j += 1
	end
	swap(arr, i, high)
	return i
end

nuts = [1, 2, 6, 5, 4, 3]
bolts = [6, 4, 5, 1, 3, 2]
makePairs(nuts, bolts)

"""
Matched nuts and bolts are : [1, 2, 3, 4, 5, 6][1, 2, 3, 4, 5, 6]
"""