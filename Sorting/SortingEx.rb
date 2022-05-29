def swap( arr, x, y)
	temp = arr[x]
	arr[x] = arr[y]
	arr[y] = temp
	return
end

def partition01( arr, size)
	left = 0
	right = size - 1
	count = 0
	while (left < right)
		while (arr[left] == 0) 
			left += 1
		end
		while (arr[right] == 1) 
			right -= 1
		end
		if (left < right)
			swap(arr, left, right)
			count += 1
		end
	end
	return count
end

def partition012_( arr, size)
	zero = 0
	one = 0
	two = 0
	i = 0
	while (i < size)
		if (arr[i] == 0)
			zero += 1
		elsif (arr[i] == 1)
			one += 1
		else
			two += 1
		end
		i += 1
	end
	index = 0
	while (zero > 0)
		arr[index += 1] = 0
		zero -= 1
	end
	while (one > 0)
		arr[index += 1] = 1
		one -= 1
	end
	while (two > 0)
		arr[index += 1] = 2
		two -= 1
	end
end

def partition012( arr, size)
	left = 0
	right = size - 1
	i = 0
	while (i <= right)
		if (arr[i] == 0)
			swap(arr, i, left)
			i += 1
			left += 1
		elsif (arr[i] == 2)
			swap(arr, i, right)
			right -= 1
		else
			i += 1
		end
	end
end
# Testing code
def main1()
	arr = [0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1]
	partition01(arr, arr.length)
	print(arr)
	arr2 = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]
	partition012(arr2, arr2.length)
	print(arr2)
	arr3 = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]
	partition012_(arr3, arr3.length)
	print(arr3)
end
# 	[0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1]
# 	[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2]
# 	[0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2]


def rangePartition( arr, size, lower, higher)
	start = 0
	ed = size - 1
	i = 0
	while (i <= ed)
		if (arr[i] < lower)
			swap(arr, i, start)
			i += 1
			start += 1
		elsif (arr[i] > higher)
			swap(arr, i, ed)
			ed -= 1
		else
			i += 1
		end
	end
end

# Testing code
def main2()
	arr = [1, 2, 3, 4, 18, 5, 17, 6, 16, 7, 15, 8, 14, 9, 13, 10, 12, 11]
	rangePartition(arr, arr.length, 9, 12)
	print(arr)
end

# [1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 9, 11, 14, 13, 15, 16, 17, 18]

def minSwaps( arr, size, val)
	swapCount = 0
	first = 0
	second = size - 1
	while (first < second)
		if (arr[first] <= val)
			first += 1
		elsif (arr[second] > val)
			second -= 1
		else
			temp = arr[first]
			arr[first] = arr[second]
			arr[second] = temp
			swapCount += 1
		end
	end
	return swapCount
end

# Testing code
def main3()
	array = [1, 2, 3, 4, 18, 5, 17, 6, 16, 7, 15, 8, 14, 9, 13, 10, 12, 11]
	print("minSwaps " + minSwaps(array, array.length, 10).to_s,"\n")
end

# minSwaps 3

def separateEvenAndOdd( data, size)
	left = 0
	right = size - 1
	aux = Array.new(size){0}
	i = 0
	while (i < size)
		if (data[i] % 2 == 0)
			aux[left] = data[i]
			left += 1
		elsif (data[i] % 2 == 1)
			aux[right] = data[i]
			right -= 1
		end
		i += 1
	end
	i = 0
	while (i < size)
		data[i] = aux[i]
		i += 1
	end
end

def separateEvenAndOdd2( data, size)
	left = 0
	right = size - 1
	while (left < right)
		if (data[left] % 2 == 0)
			left += 1
		elsif (data[right] % 2 == 1)
			right -= 1
		else
			swap(data, left, right)
			left += 1
			right -= 1
		end
	end
end

# Testing code
def main4()
	array = [9, 1, 8, 2, 7, 3, 6, 4, 5]
	separateEvenAndOdd(array, array.length)
	print(array)
	array2 = [9, 1, 8, 2, 7, 3, 6, 4, 5]
	separateEvenAndOdd2(array2, array2.length)
	print(array2)
end

# [8, 2, 6, 4, 5, 3, 7, 1, 9]
# [4, 6, 8, 2, 7, 3, 1, 9, 5]

def absGreater( value1, value2, ref)
	return ((value1 - ref).abs > (value2 - ref).abs)
end

def absBubbleSort( arr, size, ref)
	i = 0
	while (i < (size - 1))
		j = 0
		while (j < (size - i - 1))
			if (absGreater(arr[j], arr[j + 1], ref))
				swap(arr, j, j + 1)
			end
			j += 1
		end
		i += 1
	end
end

# Testing code
def main5()
	array = [9, 1, 8, 2, 7, 3, 6, 4, 5]
	ref = 5
	absBubbleSort(array, array.length, ref)
	print(array)
end

# 	[5, 6, 4, 7, 3, 8, 2, 9, 1]

def eqGreater( value1, value2, _A)
	value1 = _A * value1 * value1
	value2 = _A * value2 * value2
	return value1 > value2
end

def arrayReduction( arr, size)
	arr = arr.sort()
	count = 1
	reduction = arr[0]
	i = 0
	while (i < size)
		if (arr[i] - reduction > 0)
			reduction = arr[i]
			count += 1
		end
		i += 1
	end
	print("Total number of reductions: " + count.to_s,"\n")
end

# Testing code
def main6()
	arr = [5, 1, 1, 1, 2, 3, 5]
	arrayReduction(arr, arr.length)
end

# Total number of reductions: 4

def sortByOrder( arr, size, arr2, size2)
	ht = Hash.new
	out = Array.new(size)
	i = 0
	while (i < size)
		if (ht.key?(arr[i]))
			ht[arr[i]] = ht[arr[i]] + 1
		else
			ht[arr[i]] = 1
		end
		i += 1
	end

	j = 0
	ind = 0
	while (j < size2)
		if (ht.key?(arr2[j]))
			value = ht[arr2[j]]
			k = 0
			while (k < value)
				out[ind] = arr2[j]
				k += 1
				ind += 1
			end
			ht.delete(arr2[j])
		end
		j += 1
	end

	i = 0
	while (i < size)
		if (ht.key?(arr[i]))
			value = ht[arr[i]]
			k = 0
			while (k < value)
				out[ind] = arr[i]
				k += 1
				ind += 1
			end
			ht.delete(arr[i])
		end
		i += 1
	end

	i = 0
	while (i < size)
		arr[i] = out[i]
		i += 1
	end

end

# Testing code
def main7()
	arr = [2, 1, 2, 5, 7, 1, 9, 3, 6, 8, 8]
	arr2 = [2, 1, 8, 3]
	sortByOrder(arr, arr.length, arr2, arr2.length)
	print arr
end

# [2, 2, 1, 1, 8, 8, 3, 5, 7, 9, 6]

def merge( arr1, size1, arr2, size2)
	index = 0
	while (index < size1)
		if (arr1[index] <= arr2[0])
			index += 1
		else
			# always first element of arr2 is compared.
			temp = arr1[index]
			arr1[index] = arr2[0]
			arr2[0] = temp
			index += 1
			i = 0
			# After swap arr2 may be unsorted.
			# Insertion of the element in proper sorted position.
			while (i < (size2 - 1))
				if (arr2[i] < arr2[i + 1])
					break
				end
				temp = arr2[i]
				arr2[i] = arr2[i + 1]
				arr2[i + 1] = temp
				i += 1
			end
		end
	end
end

# Testing code.
def main8()
	arr1 = [1, 5, 9, 10, 15, 20]
	arr2 = [2, 3, 8, 13]
	merge(arr1, arr1.length, arr2, arr2.length)
	print(arr1)
	print(arr2)
end

# [1, 2, 3, 5, 8, 9][10, 13, 15, 20]

def checkReverse( arr, size)
	start = -1
	stop = -1
	i = 0
	while (i < (size - 1))
		if (arr[i] > arr[i + 1])
			start = i
			break
		end
		i += 1
	end
	if (start == -1)
		return true
	end
	i = start
	while (i < (size - 1))
		if (arr[i] < arr[i + 1])
			stop = i
			break
		end
		i += 1
	end
	if (stop == -1)
		return true
	end
	# increasing property
	# after reversal the sub array should fit in the array.
	if (arr[start - 1] > arr[stop] || arr[stop + 1] < arr[start])
		return false
	end
	i = stop + 1
	while (i < size - 1)
		if (arr[i] > arr[i + 1])
			return false
		end
		i += 1
	end
	return true
end

def main9()
	arr1 = [1, 2, 6, 5, 4, 7]
	print(checkReverse(arr1, arr1.length),"\n")
end

# true

def min( _X, _Y)
	if (_X < _Y)
		return _X
	end
	return _Y
end

def unionIntersectionSorted( arr1, size1, arr2, size2)
	first = 0
	second = 0
	unionArr = Array.new(size1 + size2){0}
	interArr = Array.new(min(size1, size2)){0}
	uIndex = 0
	iIndex = 0
	while (first < size1 && second < size2)
		if (arr1[first] == arr2[second])
			unionArr[uIndex] = arr1[first]
			uIndex += 1
			interArr[iIndex] = arr1[first]
			iIndex += 1
			first += 1
			second += 1
		elsif (arr1[first] < arr2[second])
			unionArr[uIndex] = arr1[first]
			uIndex += 1
			first += 1
		else
			unionArr[uIndex] = arr2[second]
			uIndex += 1
			second += 1
		end
	end
	while (first < size1)
		unionArr[uIndex] = arr1[first]
		uIndex += 1
		first += 1
	end
	while (second < size2)
		unionArr[uIndex] = arr2[second]
		uIndex += 1
		second += 1
	end
	print unionArr[0..uIndex-1]
	print interArr[0..iIndex-1]
end

def unionIntersectionUnsorted( arr1, size1, arr2, size2)
	arr1 = arr1.sort()
	arr2 = arr2.sort()
	unionIntersectionSorted(arr1, size1, arr2, size2)
end

def main10()
	arr1 = [1, 11, 2, 3, 14, 5, 6, 8, 9]
	arr2 = [2, 4, 5, 12, 7, 8, 13, 10]
	unionIntersectionUnsorted(arr1, arr1.length, arr2, arr2.length)
end

# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14][2, 5, 8]

=begin 
main1()
main2()
main3()
main4()
main5()
main6()
main7()
=end
main8()
main9()
main10() 
