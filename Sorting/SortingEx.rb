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
		arr[index] = 0
		index += 1
		zero -= 1
	end
	while (one > 0)
		arr[index] = 1
		index += 1
		one -= 1
	end
	while (two > 0)
		arr[index] = 2
		index += 1
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
	p arr
	arr2 = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]
	partition012(arr2, arr2.length)
	p arr2
	arr3 = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]
	partition012_(arr3, arr3.length)
	p arr3
end
# 	[0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1]
# 	[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2]
# 	[0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2]


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
	p arr
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
	p "minSwaps " + minSwaps(array, array.length, 10).to_s
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
	p array
	array2 = [9, 1, 8, 2, 7, 3, 6, 4, 5]
	separateEvenAndOdd2(array2, array2.length)
	p array2
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
	p array
end

# 	[5, 6, 4, 7, 3, 8, 2, 9, 1]

def eqGreater( value1, value2, _A)
	value1 = _A * value1 * value1
	value2 = _A * value2 * value2
	return value1 > value2
end
    222
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
	p "Total number of reductions: " + count.to_s
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
	p arr
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
	p arr1
	p arr2
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

# Testing code.
def main9()
	arr1 = [1, 2, 6, 5, 4, 7]
	p checkReverse(arr1, arr1.length)
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
	p unionArr[0..uIndex-1]
	p interArr[0..iIndex-1]
end

def unionIntersectionUnsorted( arr1, size1, arr2, size2)
	arr1 = arr1.sort()
	arr2 = arr2.sort()
	unionIntersectionSorted(arr1, size1, arr2, size2)
end

# Testing code.
def main10()
	arr1 = [1, 11, 2, 3, 14, 5, 6, 8, 9]
	arr2 = [2, 4, 5, 12, 7, 8, 13, 10]
	unionIntersectionUnsorted(arr1, arr1.length, arr2, arr2.length)
end

# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14][2, 5, 8]

def waveArray2( arr)
    size = arr.length
    i = 1
    # Odd elements are lesser then even elements.
    while (i < size)
        if ((i - 1) >= 0 && arr[i] > arr[i - 1])
            swap(arr, i, i - 1)
        end
        if ((i + 1) < size && arr[i] > arr[i + 1])
            swap(arr, i, i + 1)
        end
        i += 2
    end
end
def waveArray( arr)
    size = arr.length
    arr = arr.sort
    i = 0
    while (i < size - 1)
        swap(arr, i, i + 1)
        i += 2
    end
end
# Testing code
def main11()
arr = [8, 1, 2, 3, 4, 5, 6, 4, 2]
waveArray(arr)
p arr
    arr2 = [8, 1, 2, 3, 4, 5, 6, 4, 2]
    waveArray2(arr2)
    p arr2
end
# 	[8, 1, 2, 3, 4, 5, 6, 4, 2]
# 	[8, 1, 3, 2, 5, 4, 6, 2, 4]


def indexArray( arr,  size)
    i = 0
    while (i < size)
        curr = i
        value = -1
        # swaps to move elements in proper position.
        while (arr[curr] != -1 && arr[curr] != curr)
            temp = arr[curr]
            arr[curr] = value
            value = curr = temp
        end
        # check if some swaps happened.
        if (value != -1)
            arr[curr] = value
        end
        i += 1
    end
end

def indexArray2( arr,  size)
    i = 0
    while (i < size)
        while (arr[i] != -1 && arr[i] != i)
            # swap arr[i] and arr[arr[i]] 
            temp = arr[i]
            arr[i] = arr[temp]
            arr[temp] = temp
        end
        i += 1
    end
end
# Testing code
def main12()
arr = [8, -1, 6, 1, 9, 3, 2, 7, 4, -1]
size = arr.length
indexArray2(arr, size)
p arr
    arr2 = [8, -1, 6, 1, 9, 3, 2, 7, 4, -1]
    size = arr2.length
    indexArray(arr2, size)
    p arr2
end
# 	[-1, 1, 2, 3, 4, -1, 6, 7, 8, 9]
# 	[-1, 1, 2, 3, 4, -1, 6, 7, 8, 9]



def sort1toN( arr,  size)
    i = 0
    while (i < size)
        curr = i
        value = -1
        # swaps to move elements in proper position.
        while (curr >= 0 && curr < size && arr[curr] != curr + 1)
            nxt = arr[curr]
            arr[curr] = value
            value = nxt
            curr = nxt - 1
        end
        i += 1
    end
end

def sort1toN2( arr,  size)
    i = 0
    while (i < size)
        while (arr[i] != i + 1 && arr[i] > 1)
            temp = arr[i]
            arr[i] = arr[temp - 1]
            arr[temp - 1] = temp
        end
        i += 1
    end
end
# Testing code
def main13()
arr = [8, 5, 6, 1, 9, 3, 2, 7, 4, 10]
size = arr.length
sort1toN2(arr, size)
p arr
    arr2 = [8, 5, 6, 1, 9, 3, 2, 7, 4, 10]
    size = arr2.length
    sort1toN(arr2, size)
    p arr2
end
# 	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# 	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


def maxMinArr( arr,  size)
    aux = arr.clone
    start = 0
    stop = size - 1
    i = 0
    while (i < size)
        if (i % 2 == 0)
            arr[i] = aux[stop]
            stop -= 1
        else
            arr[i] = aux[start]
            start += 1
        end
        i += 1
    end
end
def reverseArr( arr,  start,  stop)
    while (start < stop)
        swap(arr, start, stop)
        start += 1
        stop -= 1
    end
end
def maxMinArr2( arr,  size)
    i = 0
    while (i < (size - 1))
        reverseArr(arr, i, size - 1)
        i += 1
    end
end
# Testing code
def main14()
    arr = [1, 2, 3, 4, 5, 6, 7]
    size = arr.length
    maxMinArr(arr, size)
    p (arr)
    arr2 = [1, 2, 3, 4, 5, 6, 7]
    size2 = arr.length
    maxMinArr2(arr2, size2)
    p (arr2)
end
# 	[7, 1, 6, 2, 5, 3, 4]
# 	[7, 1, 6, 2, 5, 3, 4]


def maxCircularSum( arr,  size)
    sumAll = 0
    currVal = 0
    i = 0
    while (i < size)
        sumAll += arr[i]
        currVal += (i * arr[i])
        i += 1
    end
    maxVal = currVal
    i = 1
    while (i < size)
        currVal = (currVal + sumAll) - (size * arr[size - i])
        if (currVal > maxVal)
            maxVal = currVal
        end
        i += 1
    end
    return maxVal
end
# Testing code
def main15()
    arr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    print("MaxCircularSum: " + maxCircularSum(arr, arr.length).to_s,"\n")
end
# 	MaxCircularSum: 290

main1()
main2()
main3()
main4()
main5()
main6()
main7()
main8()
main9()
main10() 
main11()
main12()
main13()
main14()
main15()
