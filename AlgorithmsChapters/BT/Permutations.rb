def swap( arr,  i,  j)
	temp = arr[i]
	arr[i] = arr[j]
	arr[j] = temp
end

def permutation( arr,  i,  length)
	if (length == i)
		print(arr, "\n")
		return
	end
	j = i
	while (j < length)
		swap(arr, i, j)
		permutation(arr, i + 1, length)
		swap(arr, i, j)
		j += 1
	end
	return
end

def isValid( arr,  n)
	j = 1
	while (j < n)
		if ((arr[j] - arr[j - 1]).abs < 2)
			return false
		end
		j += 1
	end
	return true
end

def permutation2( arr,  i,  length)
	if (length == i)
		if (isValid(arr, length))
			print(arr, "\n")
		end
		return
	end
	j = i
	while (j < length)
		swap(arr, i, j)
		permutation2(arr, i + 1, length)
		swap(arr, i, j)
		j += 1
	end
	return
end

def isValid2( arr,  i)
	if (i < 1 || (arr[i] - arr[i - 1]).abs >= 2)
		return true
	end
	return false
end

def permutation3( arr,  i,  length)
	if (length == i)
		print(arr, "\n")
		return
	end
	j = i
	while (j < length)
		swap(arr, i, j)
		if (isValid2(arr, i))
			permutation3(arr, i + 1, length)
		end
		swap(arr, i, j)
		j += 1
	end
	return
end

# Testing code

arr = [1, 2, 3, 4]
permutation(arr, 0, 4)
print("\n")
permutation2(arr, 0, 4)
print("\n")
permutation3(arr, 0, 4)

"""
[1, 2, 3, 4]
[1, 2, 4, 3]
...
[4, 1, 3, 2]
[4, 1, 2, 3]

[2, 4, 1, 3]
[3, 1, 4, 2]

[2, 4, 1, 3]
[3, 1, 4, 2]
"""
