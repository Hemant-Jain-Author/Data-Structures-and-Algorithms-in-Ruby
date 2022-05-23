# Allowed values from 0 to maxValue.
def BucketSort( arr,  maxValue)
	numBucket = 5
	BucketSortUtil(arr, maxValue, numBucket)
end

def BucketSortUtil( arr,  maxValue,  numBucket)
	length = arr.length
	if (length == 0)
		return
	end

	# Create empty buckets
	bucket =  Array.new(numBucket){ Array.new()}

	div = (maxValue / numBucket).ceil.to_i

	i = 0
	# Add elements into the buckets
	while (i < length)
		if (arr[i] < 0 || arr[i] > maxValue)
			print("Value out of range.","\n")
			return
		end
		bucketIndex = (arr[i] / div)
		# Maximum value will be assigned to last bucket.
		if (bucketIndex >= numBucket)
			bucketIndex = numBucket - 1
		end
		bucket[bucketIndex].append(arr[i])
		i += 1
	end
	i = 0
	# Sort the elements of each bucket.
	while (i < numBucket)
		bucket[i] = bucket[i].sort()
		i += 1
	end

	# Populate output from the sorted subarray.
	index = 0
	i = 0
	while (i < numBucket)
		count = bucket[i].size()
		j = 0
		while (j < count)
			arr[index] = bucket[i][j]
			index += 1
			j += 1
		end
		i += 1
	end
end

array = [1, 34, 7, 99, 5, 23, 45, 88, 77, 19, 91, 100]
maxValue = 100
BucketSort(array, maxValue)
print(array)
