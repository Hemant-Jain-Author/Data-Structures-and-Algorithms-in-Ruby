def linearSearchUnsorted( arr,  size,  value)
	i = 0
	while (i < size)
		if (value == arr[i])
			return true
		end
		i += 1
	end
	return false
end

def linearSearchSorted( arr,  size,  value)
	i = 0
	while (i < size)
		if (value == arr[i])
			return true
		elsif (value < arr[i])
			return false
		end
		i += 1
	end
	return false
end

# Binary Search Algorithm - Iterative Way
def binarySearch( arr,  size,  value)
	low = 0
	high = size - 1
	while (low <= high)
		mid = (low + high) / 2
		if (arr[mid] == value)
			return true
		elsif (arr[mid] < value)
			low = mid + 1
		else
			high = mid - 1
		end
	end
	return false
end

# Binary Search Algorithm - Recursive Way
def binarySearchRec( arr,  size,  value)
	low = 0
	high = size - 1
	return binarySearchRecUtil(arr, low, high, value)
end

def binarySearchRecUtil( arr,  low,  high,  value)
	if (low > high)
		return false
	end
	mid = (low + high) / 2
	if (arr[mid] == value)
		return true
	elsif (arr[mid] < value)
		return binarySearchRecUtil(arr, mid + 1, high, value)
	else
		return binarySearchRecUtil(arr, low, mid - 1, value)
	end
end

def binarySearchUtil( arr,  start,  ed,  key,  isInc)
	if (ed < start)
		return -1
	end
	mid = (start + ed) / 2
	if (key == arr[mid])
		return mid
	end
	if (isInc != false && key < arr[mid] || isInc == false && key > arr[mid])
		return binarySearchUtil(arr, start, mid - 1, key, isInc)
	else
		return binarySearchUtil(arr, mid + 1, ed, key, isInc)
	end
end

def fibonacciSearch( arr,  size,  value)
	# Initialize fibonacci numbers 
	fibNMn2 = 0
	fibNMn1 = 1
	fibN = fibNMn2 + fibNMn1
	while (fibN < size)
		fibNMn2 = fibNMn1
		fibNMn1 = fibN
		fibN = fibNMn2 + fibNMn1
	end
	low = 0
	while (fibN > 1)
		# fibonacci series start with 0, 1, 1, 2
		i = [low + fibNMn2,size - 1].min
		if (arr[i] == value)
			return true
		elsif (arr[i] < value)
			fibN = fibNMn1
			fibNMn1 = fibNMn2
			fibNMn2 = fibN - fibNMn1
			low = i
		else
			# for feb2 <= 1, these will be invalid.
			fibN = fibNMn2
			fibNMn1 = fibNMn1 - fibNMn2
			fibNMn2 = fibN - fibNMn1
		end
	end
	if (arr[low + fibNMn2] == value)
		# above loop does not check when fibNMn2 = 0
		return true
	end
	return false
end

def main1()
	first = [1, 3, 5, 7, 9, 25, 30]
	print(linearSearchUnsorted(first, 7, 8),"\n")
	print(linearSearchSorted(first, 7, 8),"\n")
	print(binarySearch(first, 7, 8),"\n")
	print(binarySearchRec(first, 7, 8),"\n")
	print(linearSearchUnsorted(first, 7, 25),"\n")
	print(linearSearchSorted(first, 7, 25),"\n")
	print(binarySearch(first, 7, 25),"\n")
	print(binarySearchRec(first, 7, 25),"\n")
	print(fibonacciSearch(first, 7, 8),"\n")
	print(fibonacciSearch(first, 7, 25),"\n")
end
# * false 
# * false 
# * false 
# * false
# * 
# * true 
# * true 
# * true 
# * true
def swap( arr,  first,  second)
	temp = arr[first]
	arr[first] = arr[second]
	arr[second] = temp
end

def firstRepeated( arr,  size)
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			if (arr[i] == arr[j])
				return arr[i]
			end
			j += 1
		end
		i += 1
	end
	return 0
end

def firstRepeated2( arr,  size)
	hm =  Hash.new
	i = 0
	while (i < size)
		if (hm.key?(arr[i]))
			hm[arr[i]] = 2
		else
			hm[arr[i]] = 1
		end
		i += 1
	end
	i = 0
	while (i < size)
		if (hm[arr[i]] == 2)
			return arr[i]
		end
		i += 1
	end
	return 0
end

def main2()
	first = [1, 3, 5, 3, 9, 1, 30]
	print(firstRepeated(first, first.length),"\n")
	print(firstRepeated2(first, first.length),"\n")
end
# * 1
def printRepeating( arr,  size)
	print("Repeating elements are ")
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			if (arr[i] == arr[j])
				print(" " + arr[i].to_s)
			end
			j += 1
		end
		i += 1
	end
	print("\n")
end

def printRepeating2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	print("Repeating elements are ")
	i = 1
	while (i < size)
		if (arr[i] == arr[i - 1])
			print(" " + arr[i].to_s)
		end
		i += 1
	end
	print("\n")
end

def printRepeating3( arr,  size)
	hs =  []
	print("Repeating elements are ")
	i = 0
	while (i < size)
		if (hs.include?(arr[i]))
			print(" " + arr[i].to_s)
		else
			hs.push(arr[i])
		end
		i += 1
	end
	print("\n")
end

def printRepeating4( arr,  size,  range)
	count = Array.new(range){0}
	i = 0
	while (i < size)
		count[i] = 0
		i += 1
	end
	print("Repeating elements are ")
	i = 0
	while (i < size)
		if (count[arr[i]] == 1)
			print(" " + arr[i].to_s)
		else
			count[arr[i]] += 1
		end
		i += 1
	end
	print("\n")
end

def main3()
	first = [1, 3, 5, 3, 9, 1, 30]
	printRepeating(first, first.length)
	printRepeating2(first, first.length)
	printRepeating3(first, first.length)
	printRepeating4(first, first.length, 50)
end
# * Repeating elements are 1 3 
# * Repeating elements are 1 3 
# * Repeating elements are 1 3 
# * Repeating elements are 1 3

def removeDuplicates( array,  size)
	j = 0
	array.sort! {|a,b| a <=> b }
	i = 1
	while (i < size)
		if (array[i] != array[j])
			j += 1
			array[j] = array[i]
		end
		i += 1
	end
	return array.slice(0,j + 1)
end

def removeDuplicates2( arr,  size)
	hm =  Hash.new
	j = 0
	i = 0
	while (i < size)
		if (!hm.key?(arr[i]))
			arr[j] = arr[i]
			j += 1
			hm[arr[i]] = 1
		end
		i += 1
	end
	return arr.slice(0,j)
end

def main4()
	first = [1, 3, 5, 3, 9, 1, 30]
	ret = removeDuplicates(first, first.length)
	i = 0
	while (i < ret.length)
		print(ret[i].to_s + " ")
		i += 1
	end
	print("\n")
	first2 = [1, 3, 5, 3, 9, 1, 30]
	ret2 = removeDuplicates2(first2, first2.length)
	i = 0
	while (i < ret2.length)
		print(ret2[i].to_s + " ")
		i += 1
	end
	print("\n")
end
# * 1 3 5 9 30
def findMissingNumber( arr,  size)
	found = 0
	i = 1
	while (i <= size)
		found = 0
		j = 0
		while (j < size)
			if (arr[j] == i)
				found = 1
				break
			end
			j += 1
		end
		if (found == 0)
			return i
		end
		i += 1
	end
	return (2**(0.size*8-2))
end

def findMissingNumber2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < size)
		if (arr[i] != i + 1)
			return i + 1
		end
		i += 1
	end
	return size
end

def findMissingNumber3( arr,  size)
	hm =  Hash.new
	i = 0
	while (i < size)
		hm[arr[i]] = 1
		i += 1
	end
	i = 1
	while (i <= size)
		if (!hm.key?(i))
			return i
		end
		i += 1
	end
	return (2**(0.size*8-2))
end

def findMissingNumber4( arr,  size)
	count = Array.new(size + 1){-1}
	i = 0
	while (i < size)
		count[arr[i] - 1] = 1
		i += 1
	end
	i = 0
	while (i <= size)
		if (count[i] == -1)
			return i + 1
		end
		i += 1
	end
	return (2**(0.size*8-2))
end

def findMissingNumber5( arr,  size)
	sum = 0
	i = 1
	# Element value range is from 1 to size+1.
	while (i < (size + 2))
		sum += i
		i += 1
	end
	i = 0
	while (i < size)
		sum -= arr[i]
		i += 1
	end
	return sum
end

def findMissingNumber6( arr,  size)
	i = 0
	while (i < size)
		# len(arr)+1 value should be ignored.
		if (arr[i] != size + 1 && arr[i] != size * 3 + 1)
			# 1 should not become (len(arr)+1) so multiplied by 2
			arr[(arr[i] - 1) % size] += size * 2
		end
		i += 1
	end
	i = 0
	while (i < size)
		if (arr[i] < (size * 2))
			return i + 1
		end
		i += 1
	end
	return (2**(0.size*8-2))
end

def findMissingNumber7( arr,  size)
	xorSum = 0
	i = 1
	# Element value range is from 1 to size+1.
	while (i < (size + 2))
		xorSum ^= i
		i += 1
	end
	i = 0
	# loop through the array and get the XOR of elements
	while (i < size)
		xorSum ^= arr[i]
		i += 1
	end
	return xorSum
end

def findMissingNumber8( arr,  size)
	st =  []
	i = 0
	while (i < size)
		st.push(arr[i])
		i += 1
	end
	i = 1
	while (i <= size)
		if (st.include?(i) == false)
			return i
		end
		i += 1
	end
	print("NoNumberMissing","\n")
	return -1
end

def main5()
	first = [1, 5, 4, 3, 2, 7, 8, 9]
	print(findMissingNumber(first, first.length),"\n")
	print(findMissingNumber2(first, first.length),"\n")
	print(findMissingNumber3(first, first.length),"\n")
	print(findMissingNumber4(first, first.length),"\n")
	print(findMissingNumber5(first, first.length),"\n")
	print(findMissingNumber7(first, first.length),"\n")
	print(findMissingNumber8(first, first.length),"\n")
	print(findMissingNumber6(first, first.length),"\n")
end
# * 6 6 6
def missingValues( arr,  size)
	max = arr[0]
	min = arr[0]
	i = 1
	while (i < size)
		if (max < arr[i])
			max = arr[i]
		end
		if (min > arr[i])
			min = arr[i]
		end
		i += 1
	end
	i = min + 1
	while (i < max)
		found = false
		j = 0
		while (j < size)
			if (arr[j] == i)
				found = true
				break
			end
			j += 1
		end
		if (!found)
			print(i.to_s + " ")
		end
		i += 1
	end
	print("\n")
end

def missingValues2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	value = arr[0]
	i = 0
	while (i < size)
		if (value == arr[i])
			value += 1
			i += 1
		else
			print(value.to_s + " ")
			value += 1
		end
	end
	print("\n")
end

def missingValues3( arr,  size)
	ht =  []
	minVal = 999999
	maxVal = -999999
	i = 0
	while (i < size)
		ht.push(arr[i])
		if (minVal > arr[i])
			minVal = arr[i]
		end
		if (maxVal < arr[i])
			maxVal = arr[i]
		end
		i += 1
	end
	i = minVal
	while (i < maxVal + 1)
		if (ht.include?(i) == false)
			print(i.to_s + " ")
		end
		i += 1
	end
	print("\n")
end

def main6()
	arr = [11, 14, 13, 17, 21, 18, 19, 23, 24]
	size = arr.length
	missingValues(arr, size)
	missingValues2(arr, size)
	missingValues3(arr, size)
end
# * 12 15 16 20 22 
# * 12 15 16 20 22
def oddCount( arr,  size)
	xorSum = 0
	i = 0
	while (i < size)
		xorSum ^= arr[i]
		i += 1
	end
	print("Odd values: " + xorSum.to_s,"\n")
end

def oddCount2( arr,  size)
	hm =  Hash.new
	i = 0
	while (i < size)
		if (hm.key?(arr[i]))
			hm.delete(arr[i])
		else
			hm[arr[i]] = 1
		end
		i += 1
	end
	print("Odd values: ")
	hm.each { |key,value|
	print(key.to_s + " ")
	}
	print("\n")
	print("Odd count is :: " + hm.size().to_s,"\n")
end

def oddCount3( arr,  size)
	xorSum = 0
	first = 0
	second = 0
	i = 0
	# 	 * xor of all elements in arr[] even occurrence will cancel each other. sum will
	# 	 * contain sum of two odd elements.
	while (i < size)
		xorSum = xorSum ^ arr[i]
		i += 1
	end
	# Rightmost set bit. 
	setBit = xorSum & ~(xorSum - 1)
	i = 0
	# 	 * Dividing elements in two group: Elements having setBit bit as 1. Elements
	# 	 * having setBit bit as 0. Even elements cancelled themselves if group and we
	# 	 * get our numbers.
	while (i < size)
		if ((arr[i] & setBit) != 0)
			first ^= arr[i]
		else
			second ^= arr[i]
		end
		i += 1
	end
	print("Odd values: " + first.to_s + " " + second.to_s,"\n")
end

def main7()
	arr = [10, 25, 30, 10, 15, 25, 15]
	size = arr.length
	oddCount(arr, size)
	oddCount2(arr, size)
	arr2 = [10, 25, 30, 10, 15, 25, 15, 40]
	size2 = arr2.length
	oddCount3(arr2, size2)
end
# Odd values: 30
# Odd values: 30 
# Odd count is :: 1
# Odd values: 30 40
def sumDistinct( arr,  size)
	sum = 0
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < (size - 1))
		if (arr[i] != arr[i + 1])
			sum += arr[i]
		end
		i += 1
	end
	sum += arr[size - 1]
	print("sum : " + sum.to_s,"\n")
end

def main8()
	arr = [1, 2, 3, 1, 1, 4, 5, 6]
	size = arr.length
	sumDistinct(arr, size)
end
# * sum : 21
def minAbsSumPair( arr,  size)
	# Array should have at least two elements
	if (size < 2)
		print("Invalid Input","\n")
		return
	end
	# Initialisation of values
	minFirst = 0
	minSecond = 1
	minSum = (arr[0] + arr[1]).abs
	l = 0
	while (l < size - 1)
		r = l + 1
		while (r < size)
			sum = (arr[l] + arr[r]).abs
			if (sum < minSum)
				minSum = sum
				minFirst = l
				minSecond = r
			end
			r += 1
		end
		l += 1
	end
	print("Minimum sum elements are : " + arr[minFirst].to_s + " , " + arr[minSecond].to_s,"\n")
end

def minAbsSumPair2( arr,  size)
	# Array should have at least two elements
	if (size < 2)
		print("Invalid Input","\n")
		return
	end
	arr.sort! {|a,b| a <=> b }
	# Initialisation of values
	minFirst = 0
	minSecond = size - 1
	minSum = (arr[minFirst] + arr[minSecond]).abs
	l = 0
	r = size - 1
	while (l < r)
		sum = (arr[l] + arr[r])
		if ((sum).abs < minSum)
			minSum = (sum).abs
			minFirst = l
			minSecond = r
		end
		if (sum < 0)
			l += 1
		elsif (sum > 0)
			r -= 1
		else
			break
		end
	end
	print("Minimum sum elements are : " + arr[minFirst].to_s + " , " + arr[minSecond].to_s,"\n")
end

def main9()
	first = [1, 5, -10, 3, 2, -6, 8, 9, 6]
	minAbsSumPair2(first, first.length)
	minAbsSumPair(first, first.length)
end
# * Minimum sum elements are : -6 , 6 
# * Minimum sum elements are : -6 , 6
def findPair( arr,  size,  value)
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			if ((arr[i] + arr[j]) == value)
				print("The pair is : " + arr[i].to_s + ", " + arr[j].to_s,"\n")
				return true
			end
			j += 1
		end
		i += 1
	end
	return false
end

def findPair2( arr,  size,  value)
	first = 0
	second = size - 1
	arr.sort! {|a,b| a <=> b }
	while (first < second)
		curr = arr[first] + arr[second]
		if (curr == value)
			print("The pair is " + arr[first].to_s + ", " + arr[second].to_s,"\n")
			return true
		elsif (curr < value)
			first += 1
		else
			second -= 1
		end
	end
	return false
end

def findPair3( arr,  size,  value)
	hs =  []
	i = 0
	while (i < size)
		if (hs.include?(value - arr[i]))
			print("The pair is : " + arr[i].to_s + ", " + (value - arr[i]).to_s,"\n")
			return true
		end
		hs.push(arr[i])
		i += 1
	end
	return false
end

def findPair4( arr,  size,  range,  value)
	count = Array.new(range + 1){0}
	i = 0
	while (i < size)
		if (count[value - arr[i]] > 0)
			print("The pair is : " + arr[i].to_s + ", " + (value - arr[i]).to_s,"\n")
			return true
		end
		count[arr[i]] += 1
		i += 1
	end
	return false
end

def main10()
	first = [1, 5, 4, 3, 2, 7, 8, 9, 6]
	findPair(first, first.length, 8)
	findPair2(first, first.length, 8)
	findPair3(first, first.length, 8)
	findPair4(first, first.length, 9, 8)
end
# * The pair is : 1, 7 
# * The pair is 1, 7 
# * The pair is : 5, 3  
# * The pair is : 5, 3
def findPairTwoLists( arr1,  size1,  arr2,  size2,  value)
	i = 0
	while (i < size1)
		j = 0
		while (j < size2)
			if ((arr1[i] + arr2[j]) == value)
				print("The pair is : " + arr1[i].to_s + ", " + arr2[j].to_s,"\n")
				return true
			end
			j += 1
		end
		i += 1
	end
	return false
end

def findPairTwoLists2( arr1,  size1,  arr2,  size2,  value)
	arr2.sort! {|a,b| a <=> b }
	i = 0
	while (i < size1)
		if (binarySearch(arr2, size2, value - arr1[i]))
			print("The pair is " + arr1[i].to_s + ", " + (value - arr1[i]).to_s,"\n")
			return true
		end
		i += 1
	end
	return false
end

def findPairTwoLists3( arr1,  size1,  arr2,  size2,  value)
	first = 0
	second = size2 - 1
	curr = 0
	arr1.sort! {|a,b| a <=> b }
	arr2.sort! {|a,b| a <=> b }
	while (first < size1 && second >= 0)
		curr = arr1[first] + arr2[second]
		if (curr == value)
			print("The pair is " + arr1[first].to_s + ", " + arr2[second].to_s,"\n")
			return true
		elsif (curr < value)
			first += 1
		else
			second -= 1
		end
	end
	return false
end

def findPairTwoLists4( arr1,  size1,  arr2,  size2,  value)
	hs =  []
	i = 0
	while (i < size2)
		hs.push(arr2[i])
		i += 1
	end
	i = 0
	while (i < size1)
		if (hs.include?(value - arr1[i]))
			print("The pair is : " + arr1[i].to_s + ", " + (value - arr1[i]).to_s,"\n")
			return true
		end
		i += 1
	end
	return false
end

def findPairTwoLists5( arr1,  size1,  arr2,  size2,  range,  value)
	count = Array.new(range + 1){0}
	i = 0
	while (i < size2)
		count[arr2[i]] = 1
		i += 1
	end
	i = 0
	while (i < size1)
		if (count[value - arr1[i]] != 0)
			print("The pair is : " + arr1[i].to_s + ", " + (value - arr1[i]).to_s,"\n")
			return true
		end
		i += 1
	end
	return false
end

def main10A()
	first = [1, 5, 4, 3, 2, 7, 8, 9, 6]
	second = [1, 5, 4, 3, 2, 7, 8, 9, 6]
	print(findPairTwoLists(first, first.length, second, second.length, 8),"\n")
	print(findPairTwoLists2(first, first.length, second, second.length, 8),"\n")
	print(findPairTwoLists3(first, first.length, second, second.length, 8),"\n")
	print(findPairTwoLists4(first, first.length, second, second.length, 8),"\n")
	print(findPairTwoLists5(first, first.length, second, second.length, 9, 8),"\n")
end
# * The pair is : 1, 7 true 
# * The pair is 1, 7 true 
# * The pair is 1, 7 true 
# * The pair is : 1, 7 true 
# * The pair is : 1, 7 true
def findDifference( arr,  size,  value)
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			if ((arr[i] - arr[j]).abs == value)
				print("The pair is:: " + arr[i].to_s + " & " + arr[j].to_s,"\n")
				return true
			end
			j += 1
		end
		i += 1
	end
	return false
end

def findDifference2( arr,  size,  value)
	first = 0
	second = 0
	arr.sort! {|a,b| a <=> b }
	while (first < size && second < size)
		diff = (arr[first] - arr[second]).abs
		if (diff == value)
			print("The pair is::" + arr[first].to_s + " & " + arr[second].to_s,"\n")
			return true
		elsif (diff > value)
			first += 1
		else
			second += 1
		end
	end
	return false
end

def main11()
	first = [1, 5, 4, 3, 2, 7, 8, 9, 6]
	print(findDifference(first, first.length, 6),"\n")
	print(findDifference2(first, first.length, 6),"\n")
end
# * The pair is:: 1 & 7 true 
# * The pair is::1 & 7 true
def findMinDiff( arr,  size)
	diff = (2**(0.size*8-2))
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			value = (arr[i] - arr[j]).abs
			if (diff > value)
				diff = value
			end
			j += 1
		end
		i += 1
	end
	return diff
end

def findMinDiff2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	diff = (2**(0.size*8-2))
	i = 0
	while (i < (size - 1))
		if ((arr[i + 1] - arr[i]) < diff)
			diff = arr[i + 1] - arr[i]
		end
		i += 1
	end
	return diff
end

def main12()
	second = [1, 6, 4, 19, 17, 20]
	print("findMinDiff : " + findMinDiff(second, second.length).to_s,"\n")
	print("findMinDiff : " + findMinDiff2(second, second.length).to_s,"\n")
end
# * findMinDiff : 1
def minDiffPair( arr1,  size1,  arr2,  size2)
	diff = (2**(0.size*8-2))
	first = 0
	second = 0
	i = 0
	while (i < size1)
		j = 0
		while (j < size2)
			value = (arr1[i] - arr2[j]).abs
			if (diff > value)
				diff = value
				first = arr1[i]
				second = arr2[j]
			end
			j += 1
		end
		i += 1
	end
	print("The pair is :: " + first.to_s + " & " + second.to_s,"\n")
	print("Minimum difference is :: " + diff.to_s,"\n")
	return diff
end

def minDiffPair2( arr1,  size1,  arr2,  size2)
	minDiff = (2**(0.size*8-2))
	i = 0
	j = 0
	first = 0
	second = 0
	arr1.sort! {|a,b| a <=> b }
	arr2.sort! {|a,b| a <=> b }
	while (i < size1 && j < size2)
		diff = (arr1[i] - arr2[j]).abs
		if (minDiff > diff)
			minDiff = diff
			first = arr1[i]
			second = arr2[j]
		end
		if (arr1[i] < arr2[j])
			i += 1
		else
			j += 1
		end
	end
	print("The pair is :: " + first.to_s + " & " + second.to_s,"\n")
	print("Minimum difference is :: " + minDiff.to_s,"\n")
	return minDiff
end

def main13()
	first = [1, 5, 4, 3, 2, 7, 8, 9, 6]
	second = [6, 4, 19, 17, 20]
	minDiffPair(first, first.length, second, second.length)
	minDiffPair(first, first.length, second, second.length)
end
# The pair is :: 4 & 4
# Minimum difference is :: 0
def closestPair( arr,  size,  value)
	diff = 999999
	first = -1
	second = -1
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			curr = (value - (arr[i] + arr[j])).abs
			if (curr < diff)
				diff = curr
				first = arr[i]
				second = arr[j]
			end
			j += 1
		end
		i += 1
	end
	print("closest pair is :: " + first.to_s + " " + second.to_s,"\n")
end

def closestPair2( arr,  size,  value)
	first = 0
	second = 0
	start = 0
	stop = size - 1
	arr.sort! {|a,b| a <=> b }
	diff = 9999999
	while (start < stop)
		curr = (value - (arr[start] + arr[stop]))
		if ((curr).abs < diff)
			diff = (curr).abs
			first = arr[start]
			second = arr[stop]
		end
		if (curr == 0)
			break
		elsif (curr > 0)
			start += 1
		else
			stop -= 1
		end
	end
	print("closest pair is :: " + first.to_s + " " + second.to_s,"\n")
end

def main14()
	first = [10, 20, 3, 4, 50, 80]
	closestPair(first, first.length, 47)
	closestPair2(first, first.length, 47)
end
# * closest pair is :: 3 50 
# * closest pair is :: 3 50
def sumPairRestArray( arr,  size)
	arr.sort! {|a,b| a <=> b }
	total = 0
	i = 0
	while (i < size)
		total += arr[i]
		i += 1
	end
	value = total / 2
	low = 0
	high = size - 1
	while (low < high)
		curr = arr[low] + arr[high]
		if (curr == value)
			print("Pair is :: " + arr[low].to_s + " " + arr[high].to_s,"\n")
			return true
		elsif (curr < value)
			low += 1
		else
			high -= 1
		end
	end
	return false
end

def main15()
	first = [1, 2, 4, 8, 16, 15]
	print(sumPairRestArray(first, first.length),"\n")
end
# Pair is :: 8 15
# true
def zeroSumTriplets( arr,  size)
	i = 0
	while (i < (size - 2))
		j = i + 1
		while (j < (size - 1))
			k = j + 1
			while (k < size)
				if (arr[i] + arr[j] + arr[k] == 0)
					print("Triplet:: " + arr[i].to_s + " " + arr[j].to_s + " " + arr[k].to_s,"\n")
				end
				k += 1
			end
			j += 1
		end
		i += 1
	end
end

def zeroSumTriplets2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < (size - 2))
		start = i + 1
		stop = size - 1
		while (start < stop)
			if (arr[i] + arr[start] + arr[stop] == 0)
				print("Triplet :: " + arr[i].to_s + " " + arr[start].to_s + " " + arr[stop].to_s,"\n")
				start += 1
				stop -= 1
			elsif (arr[i] + arr[start] + arr[stop] > 0)
				stop -= 1
			else
				start += 1
			end
		end
		i += 1
	end
end

def main16()
	first = [0, -1, 2, -3, 1]
	zeroSumTriplets(first, first.length)
	zeroSumTriplets2(first, first.length)
end
# * Triplet:: 0 -1 1 
# * Triplet:: 2 -3 1 
# * Triplet :: -3 1 2 
# * Triplet :: -1 0 1
def findTriplet( arr,  size,  value)
	i = 0
	while (i < (size - 2))
		j = i + 1
		while (j < (size - 1))
			k = j + 1
			while (k < size)
				if ((arr[i] + arr[j] + arr[k]) == value)
					print("Triplet :: " + arr[i].to_s + " " + arr[j].to_s + " " + arr[k].to_s,"\n")
				end
				k += 1
			end
			j += 1
		end
		i += 1
	end
end

def findTriplet2( arr,  size,  value)
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < size - 2)
		start = i + 1
		stop = size - 1
		while (start < stop)
			if (arr[i] + arr[start] + arr[stop] == value)
				print("Triplet ::" + arr[i].to_s + " " + arr[start].to_s + " " + arr[stop].to_s,"\n")
				start += 1
				stop -= 1
			elsif (arr[i] + arr[start] + arr[stop] > value)
				stop -= 1
			else
				start += 1
			end
		end
		i += 1
	end
end

def main17()
	first = [1, 5, 15, 6, 9, 8]
	findTriplet(first, first.length, 22)
	findTriplet2(first, first.length, 22)
end
# * Triplet :: 1 15 6 
# * Triplet :: 5 9 8 
# * Triplet ::1 6 15 
# * Triplet ::5 8 9
def abcTriplet( arr,  size)
	i = 0
	while (i < size - 1)
		j = i + 1
		while (j < size)
			k = 0
			while (k < size)
				if (k != i && k != j && arr[i] + arr[j] == arr[k])
					print("abcTriplet:: " + arr[i].to_s + " " + arr[j].to_s + " " + arr[k].to_s,"\n")
				end
				k += 1
			end
			j += 1
		end
		i += 1
	end
end

def abcTriplet2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < size)
		start = 0
		stop = size - 1
		while (start < stop)
			if (arr[i] == arr[start] + arr[stop])
				print("abcTriplet:: " + arr[start].to_s + " " + arr[stop].to_s + " " + arr[i].to_s,"\n")
				start += 1
				stop -= 1
			elsif (arr[i] < arr[start] + arr[stop])
				stop -= 1
			else
				start += 1
			end
		end
		i += 1
	end
end

def main18()
	first = [1, 5, 15, 6, 9, 8]
	abcTriplet(first, first.length)
	abcTriplet2(first, first.length)
end
# * abcTriplet:: 1 5 6 
# * abcTriplet:: 1 8 9 
# * abcTriplet:: 6 9 15
def smallerThenTripletCount( arr,  size,  value)
	count = 0
	i = 0
	while (i < size - 1)
		j = i + 1
		while (j < size)
			k = j + 1
			while (k < size)
				if (arr[i] + arr[j] + arr[k] < value)
					count += 1
				end
				k += 1
			end
			j += 1
		end
		i += 1
	end
	print("smallerThenTripletCount:: " + count.to_s,"\n")
end

def smallerThenTripletCount2( arr,  size,  value)
	count = 0
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < (size - 2))
		start = i + 1
		stop = size - 1
		while (start < stop)
			if (arr[i] + arr[start] + arr[stop] >= value)
				stop -= 1
			else
				count += stop - start
				start += 1
			end
		end
		i += 1
	end
	print("smallerThenTripletCount:: " + count.to_s,"\n")
end

def main19()
	first = [-2, -1, 0, 1]
	smallerThenTripletCount(first, first.length, 2)
	smallerThenTripletCount(first, first.length, 2)
end
# * 4 
# * 4
def apTriplets( arr,  size)
	i = 1
	while (i < size - 1)
		j = i - 1
		k = i + 1
		while (j >= 0 && k < size)
			if (arr[j] + arr[k] == 2 * arr[i])
				print("AP Triplet:: " + arr[j].to_s + " " + arr[i].to_s + " " + arr[k].to_s,"\n")
				k += 1
				j -= 1
			elsif (arr[j] + arr[k] < 2 * arr[i])
				k += 1
			else
				j -= 1
			end
		end
		i += 1
	end
end

def main20()
	arr = [2, 4, 10, 12, 14, 18, 36]
	apTriplets(arr, arr.length)
end
# * AP Triplet:: 2 10 18 
# * AP Triplet:: 10 12 14 
# * AP Triplet:: 10 14 18
def gpTriplets( arr,  size)
	i = 1
	while (i < size - 1)
		j = i - 1
		k = i + 1
		while (j >= 0 && k < size)
			if (arr[j] * arr[k] == arr[i] * arr[i])
				print("GP Triplet:: " + arr[j].to_s + " " + arr[i].to_s + " " + arr[k].to_s,"\n")
				k += 1
				j -= 1
			elsif (arr[j] + arr[k] < 2 * arr[i])
				k += 1
			else
				j -= 1
			end
		end
		i += 1
	end
end

def main21()
	arr = [1, 2, 4, 8, 16]
	gpTriplets(arr, arr.length)
end
# * GP Triplet:: 1 2 4 
# * GP Triplet:: 2 4 8 
# * GP Triplet:: 1 4 16 
# * GP Triplet:: 4 8 16
def numberOfTriangles( arr,  size)
	count = 0
	i = 0
	while (i < (size - 2))
		j = i + 1
		while (j < (size - 1))
			k = j + 1
			while (k < size)
				if (arr[i] + arr[j] > arr[k])
					count += 1
				end
				k += 1
			end
			j += 1
		end
		i += 1
	end
	return count
end

def numberOfTriangles2( arr,  size)
	count = 0
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < (size - 2))
		k = i + 2
		j = i + 1
		while (j < (size - 1))
			# 			 * if sum of arr[i] & arr[j] is greater arr[k] then sum of arr[i] & arr[j + 1]
			# 			 * is also greater than arr[k] this improvement make algo O(n2)
			while (k < size && arr[i] + arr[j] > arr[k]) 
				k += 1
			end
			count += k - j - 1
			j += 1
		end
		i += 1
	end
	return count
end

def main22()
	arr = [1, 2, 3, 4, 5]
	print(numberOfTriangles(arr, arr.length),"\n")
	print(numberOfTriangles2(arr, arr.length),"\n")
end
# * 3 
# * 3
def getMax( arr,  size)
	max = arr[0]
	count = 1
	maxCount = 1
	i = 0
	while (i < size)
		count = 1
		j = i + 1
		while (j < size)
			if (arr[i] == arr[j])
				count += 1
			end
			j += 1
		end
		if (count > maxCount)
			max = arr[i]
			maxCount = count
		end
		i += 1
	end
	return max
end

def getMax2( arr,  size)
	max = arr[0]
	maxCount = 1
	curr = arr[0]
	currCount = 1
	arr.sort! {|a,b| a <=> b }
	i = 1
	while (i < size)
		if (arr[i] == arr[i - 1])
			currCount += 1
		else
			currCount = 1
			curr = arr[i]
		end
		if (currCount > maxCount)
			maxCount = currCount
			max = curr
		end
		i += 1
	end
	return max
end

def getMax3( arr,  size,  range)
	max = arr[0]
	maxCount = 1
	count = Array.new(range){0}
	i = 0
	while (i < size)
		count[arr[i]] += 1
		if (count[arr[i]] > maxCount)
			maxCount = count[arr[i]]
			max = arr[i]
		end
		i += 1
	end
	return max
end

def main23()
	first = [1, 30, 5, 13, 9, 31, 5]
	print(getMax(first, first.length),"\n")
	print(getMax2(first, first.length),"\n")
	print(getMax3(first, first.length, 50),"\n")
end
# * 5 
# * 5 
# * 5
def getMajority( arr,  size)
	max = 0
	count = 0
	maxCount = 0
	i = 0
	while (i < size)
		j = i + 1
		while (j < size)
			if (arr[i] == arr[j])
				count += 1
			end
			j += 1
		end
		if (count > maxCount)
			max = arr[i]
			maxCount = count
		end
		i += 1
	end
	if (maxCount > size / 2)
		return max
	else
		return 0
	end
end

def getMajority2( arr,  size)
	majIndex = size / 2
	count = 1
	arr.sort! {|a,b| a <=> b }
	candidate = arr[majIndex]
	count = 0
	i = 0
	while (i < size)
		if (arr[i] == candidate)
			count += 1
		end
		i += 1
	end
	if (count > size / 2)
		return arr[majIndex]
	else
		return -(2**(0.size*8-2))
	end
end

def getMajority3( arr,  size)
	majIndex = 0
	count = 1
	i = 1
	while (i < size)
		if (arr[majIndex] == arr[i])
			count += 1
		else
			count -= 1
		end
		if (count == 0)
			majIndex = i
			count = 1
		end
		i += 1
	end
	candidate = arr[majIndex]
	count = 0
	i = 0
	while (i < size)
		if (arr[i] == candidate)
			count += 1
		end
		i += 1
	end
	if (count > size / 2)
		return arr[majIndex]
	else
		return 0
	end
end

def main24()
	first = [1, 5, 5, 13, 5, 31, 5]
	print(getMajority(first, first.length),"\n")
	print(getMajority2(first, first.length),"\n")
	print(getMajority3(first, first.length),"\n")
end
# * 5 
# * 5 
# * 5
def getMedian( arr,  size)
	arr.sort! {|a,b| a <=> b }
	return arr[size / 2]
end

def getMedian2( arr,  size)
	quickSelectUtil(arr, 0, size - 1, size / 2)
	return arr[size / 2]
end

def main25()
	first = [1, 5, 6, 6, 6, 6, 6, 6, 7, 8, 10, 13, 20, 30]
	print(getMedian(first, first.length),"\n")
	print(getMedian(first, first.length),"\n")
end
# * 6
def searchBitonicArrayMax( arr,  size)
	i = 0
	while (i < size - 2)
		if (arr[i] > arr[i + 1])
			return arr[i]
		end
		i += 1
	end
	print("error not a bitonic array","\n")
	return 0
end

def searchBitonicArrayMax2( arr,  size)
	start = 0
	ed = size - 1
	mid = (start + ed) / 2
	maximaFound = 0
	if (size < 3)
		print("error","\n")
		return 0
	end
	while (start <= ed)
		mid = (start + ed) / 2
		if (arr[mid - 1] < arr[mid] && arr[mid + 1] < arr[mid])
			# maxima
			maximaFound = 1
			break
		elsif (arr[mid - 1] < arr[mid] && arr[mid] < arr[mid + 1])
			# increasing
			start = mid + 1
		elsif (arr[mid - 1] > arr[mid] && arr[mid] > arr[mid + 1])
			# decreasing
			ed = mid - 1
		else
			break
		end
	end
	if (maximaFound == 0)
		print("error not a bitonic array","\n")
		return 0
	end
	return arr[mid]
end

def searchBitonicArray( arr,  size,  key)
	max = findMaxBitonicArray(arr, size)
	k = binarySearchUtil(arr, 0, max, key, true)
	if (k != -1)
		return k
	else
		return binarySearchUtil(arr, max + 1, size - 1, key, false)
	end
end

def findMaxBitonicArray( arr,  size)
	start = 0
	ed = size - 1
	if (size < 3)
		print("error","\n")
		return -1
	end
	while (start <= ed)
		mid = (start + ed) / 2
		if (arr[mid - 1] < arr[mid] && arr[mid + 1] < arr[mid])
			# maxima
			return mid
		elsif (arr[mid - 1] < arr[mid] && arr[mid] < arr[mid + 1])
			# increasing
			start = mid + 1
		elsif (arr[mid - 1] > arr[mid] && arr[mid] > arr[mid + 1])
			# decreasing
			ed = mid - 1
		else
			break
		end
	end
	print("error","\n")
	return -1
end

def main26()
	first = [1, 5, 10, 13, 20, 30, 8, 7, 6]
	print(searchBitonicArrayMax(first, first.length),"\n")
	print(searchBitonicArrayMax2(first, first.length),"\n")
	print(searchBitonicArray(first, first.length, 7),"\n")
end
# 30
# 30
# 7
def findKeyCount( arr,  size,  key)
	count = 0
	i = 0
	while (i < size)
		if (arr[i] == key)
			count += 1
		end
		i += 1
	end
	return count
end

def findFirstIndex( arr,  start,  ed,  key)
	if (ed < start)
		return -1
	end
	mid = (start + ed) / 2
	if (key == arr[mid] && (mid == start || arr[mid - 1] != key))
		return mid
	end
	if (key <= arr[mid])
		return findFirstIndex(arr, start, mid - 1, key)
	else
		return findFirstIndex(arr, mid + 1, ed, key)
	end
end

def findLastIndex( arr,  start,  ed,  key)
	if (ed < start)
		return -1
	end
	mid = (start + ed) / 2
	if (key == arr[mid] && (mid == ed || arr[mid + 1] != key))
		return mid
	end
	if (key < arr[mid])
		return findLastIndex(arr, start, mid - 1, key)
	else
		return findLastIndex(arr, mid + 1, ed, key)
	end
end

def findKeyCount2( arr,  size,  key)
	firstIndex = findFirstIndex(arr, 0, size - 1, key)
	lastIndex = findLastIndex(arr, 0, size - 1, key)
	return (lastIndex - firstIndex + 1)
end

def main27()
	first = [1, 5, 10, 13, 20, 30, 8, 7, 6]
	print(findKeyCount(first, first.length, 6),"\n")
	print(findKeyCount2(first, first.length, 6),"\n")
end
# * 1 
# * 1
# Using binary search method.
def firstIndex( arr,  size,  low,  high,  value)
	mid = 0
	if (high >= low)
		mid = (low + high) / 2
	end
	# 	 * Find first occurrence of value, either it should be the first element of the
	# 	 * array or the value before it is smaller than it.
	if ((mid == 0 || arr[mid - 1] < value) && (arr[mid] == value))
		return mid
	elsif (arr[mid] < value)
		return firstIndex(arr, size, mid + 1, high, value)
	else
		return firstIndex(arr, size, low, mid - 1, value)
	end
end

def isMajority2( arr,  size)
	majority = arr[size / 2]
	i = firstIndex(arr, size, 0, size - 1, majority)
	# 	 * we are using majority element form array so we will get some valid index
	# 	 * always.
	if (((i + size / 2) <= (size - 1)) && arr[i + size / 2] == majority)
		return true
	else
		return false
	end
end

def isMajority( arr,  size)
	count = 0
	mid = arr[size / 2]
	i = 0
	while (i < size)
		if (arr[i] == mid)
			count += 1
		end
		i += 1
	end
	if (count > size / 2)
		return true
	end
	return false
end

def main28()
	arr = [3, 3, 3, 3, 4, 5, 10]
	print(isMajority(arr, arr.length),"\n")
	print(isMajority2(arr, arr.length),"\n")
end
# * true
def maxProfit( stocks,  size)
	maxProfit = 0
	buy = 0
	sell = 0
	i = 0
	while (i < size - 1)
		j = i + 1
		while (j < size)
			if (maxProfit < stocks[j] - stocks[i])
				maxProfit = stocks[j] - stocks[i]
				buy = i
				sell = j
			end
			j += 1
		end
		i += 1
	end
	print("Purchase day is " + buy.to_s + " at price " + stocks[buy].to_s,"\n")
	print("Sell day is " + sell.to_s + " at price " + stocks[sell].to_s,"\n")
	return maxProfit
end

def maxProfit2( stocks,  size)
	buy = 0
	sell = 0
	curMin = 0
	currProfit = 0
	maxProfit = 0
	i = 0
	while (i < size)
		if (stocks[i] < stocks[curMin])
			curMin = i
		end
		currProfit = stocks[i] - stocks[curMin]
		if (currProfit > maxProfit)
			buy = curMin
			sell = i
			maxProfit = currProfit
		end
		i += 1
	end
	print("Purchase day is " + buy.to_s + " at price " + stocks[buy].to_s,"\n")
	print("Sell day is " + sell.to_s + " at price " + stocks[sell].to_s,"\n")
	return maxProfit
end

def main29()
	first = [10, 150, 6, 67, 61, 16, 86, 6, 67, 78, 150, 3, 28, 143]
	print(maxProfit(first, first.length),"\n")
	print(maxProfit2(first, first.length),"\n")
end
# * Purchase day is- 2 at price 6 
# * Sell day is- 10 at price 150 
# * 144
def findMedian( arrFirst,  sizeFirst,  arrSecond,  sizeSecond)
	medianIndex = ((sizeFirst + sizeSecond) + (sizeFirst + sizeSecond) % 2) / 2
	# ceiling
	# function.
	i = 0
	j = 0
	count = 0
	while (count < medianIndex - 1)
		if (i < sizeFirst - 1 && arrFirst[i] < arrSecond[j])
			i += 1
		else
			j += 1
		end
		count += 1
	end
	if (arrFirst[i] < arrSecond[j])
		return arrFirst[i]
	else
		return arrSecond[j]
	end
end

def main30()
	first = [1, 5, 6, 6, 6, 6, 6, 6, 7, 8, 10, 13, 20, 30]
	second = [1, 5, 6, 6, 6, 6, 6, 6, 7, 8, 10, 13, 20, 30]
	print(findMedian(first, first.length, second, second.length),"\n")
end
# * 6
def search01( arr,  size)
	i = 0
	while (i < size)
		if (arr[i] == 1)
			return i
		end
		i += 1
	end
	return -1
end

def binarySearch01( arr,  size)
	if (size == 1 && arr[0] == 1)
		return 0
	end
	return binarySearch01Util(arr, 0, size - 1)
end

def binarySearch01Util( arr,  start,  ed)
	if (ed < start)
		return -1
	end
	mid = (start + ed) / 2
	if (1 == arr[mid] && 0 == arr[mid - 1])
		return mid
	end
	if (0 == arr[mid])
		return binarySearch01Util(arr, mid + 1, ed)
	else
		return binarySearch01Util(arr, start, mid - 1)
	end
end

def main31()
	first = [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1]
	print(search01(first, first.length),"\n")
	print(binarySearch01(first, first.length),"\n")
end
# * 8
def rotationMax( arr,  size)
	i = 0
	while (i < size - 1)
		if (arr[i] > arr[i + 1])
			return arr[i]
		end
		i += 1
	end
	return -1
end

def rotationMaxUtil( arr,  start,  ed)
	if (ed <= start)
		return arr[start]
	end
	mid = (start + ed) / 2
	if (arr[mid] > arr[mid + 1])
		return arr[mid]
	end
	if (arr[start] <= arr[mid])
		# increasing part.
		return rotationMaxUtil(arr, mid + 1, ed)
	else
		return rotationMaxUtil(arr, start, mid - 1)
	end
end

def rotationMax2( arr,  size)
	return rotationMaxUtil(arr, 0, size - 1)
end

def main32()
	first = [34, 56, 77, 1, 5, 6, 6, 8, 10, 20, 30, 34]
	print(rotationMax(first, first.length),"\n")
	print(rotationMax2(first, first.length),"\n")
end
# 77
# 77
def findRotationMax( arr,  size)
	i = 0
	while (i < size - 1)
		if (arr[i] > arr[i + 1])
			return i
		end
		i += 1
	end
	return -1
end

def findRotationMaxUtil( arr,  start,  ed)
	# single element case.
	if (ed <= start)
		return start
	end
	mid = (start + ed) / 2
	if (arr[mid] > arr[mid + 1])
		return mid
	end
	if (arr[start] <= arr[mid])
		# increasing part.
		return findRotationMaxUtil(arr, mid + 1, ed)
	else
		return findRotationMaxUtil(arr, start, mid - 1)
	end
end

def findRotationMax2( arr,  size)
	return findRotationMaxUtil(arr, 0, size - 1)
end

def main33()
	first = [34, 56, 77, 1, 5, 6, 6, 8, 10, 20, 30, 34]
	print(findRotationMax(first, first.length),"\n")
	print(findRotationMax2(first, first.length),"\n")
end
# * 2
def countRotation( arr,  size)
	maxIndex = findRotationMaxUtil(arr, 0, size - 1)
	return (maxIndex + 1) % size
end

def main34()
	first = [34, 56, 77, 1, 5, 6, 6, 8, 10, 20, 30, 34]
	print(countRotation(first, first.length),"\n")
end
# * 3
def searchRotateArray( arr,  size,  key)
	i = 0
	while (i < size - 1)
		if (arr[i] == key)
			return i
		end
		i += 1
	end
	return -1
end

def binarySearchRotateArrayUtil( arr,  start,  ed,  key)
	if (ed < start)
		return -1
	end
	mid = (start + ed) / 2
	if (key == arr[mid])
		return mid
	end
	if (arr[mid] > arr[start])
		if (arr[start] <= key && key < arr[mid])
			return binarySearchRotateArrayUtil(arr, start, mid - 1, key)
		else
			return binarySearchRotateArrayUtil(arr, mid + 1, ed, key)
		end
	else
		if (arr[mid] < key && key <= arr[ed])
			return binarySearchRotateArrayUtil(arr, mid + 1, ed, key)
		else
			return binarySearchRotateArrayUtil(arr, start, mid - 1, key)
		end
	end
end

def binarySearchRotateArray( arr,  size,  key)
	return binarySearchRotateArrayUtil(arr, 0, size - 1, key)
end

def main35()
	first = [34, 56, 77, 1, 5, 6, 6, 6, 6, 6, 6, 7, 8, 10, 13, 20, 30]
	print(searchRotateArray(first, first.length, 20),"\n")
	print(binarySearchRotateArray(first, first.length, 20),"\n")
	print(countRotation(first, first.length),"\n")
	print(first[findRotationMax(first, first.length)],"\n")
end
# * 15 
# * 3 
# * 7
# * 7
def minAbsDiffAdjCircular( arr,  size)
	diff = 9999999
	if (size < 2)
		return -1
	end
	i = 0
	while (i < size)
		diff = [diff,(arr[i] - arr[(i + 1) % size]).abs].min
		i += 1
	end
	return diff
end
# Testing Code
def main36()
	arr = [5, 29, 18, 51, 11]
	print(minAbsDiffAdjCircular(arr, arr.length),"\n")
end
# * 6
def swapch( arr,  first,  second)
	temp = arr[first]
	arr[first] = arr[second]
	arr[second] = temp
end

def transformArrayAB1( arr,  size)
	_N = size / 2
	i = 1
	while (i < _N)
		j = 0
		while (j < i)
			swapch(arr, _N - i + 2 * j, _N - i + 2 * j + 1)
			j += 1
		end
		i += 1
	end
end
# Testing Code
def main37()
	str = "aaaabbbb".chars
	transformArrayAB1(str, str.length)
	print(str,"\n")
end
# * abababab
def checkPermutation( array1,  size1,  array2,  size2)
	if (size1 != size2)
		return false
	end
	array1.sort! {|a,b| a <=> b }
	array2.sort! {|a,b| a <=> b }
	i = 0
	while (i < size1)
		if (array1[i] != array2[i])
			return false
		end
		i += 1
	end
	return true
end

def checkPermutation2( arr1,  size1,  arr2,  size2)
	if (size1 != size2)
		return false
	end
	hm =  Hash.new
	i = 0
	while (i < size1)
		if (hm.key?(arr1[i]))
			hm[arr1[i]] = hm[arr1[i]] + 1
		else
			hm[arr1[i]] = 1
		end
		i += 1
	end
	i = 0
	while (i < size2)
		if (hm.key?(arr2[i]) && hm[arr2[i]] != 0)
			hm[arr2[i]] = hm[arr2[i]] - 1
		else
			return false
		end
		i += 1
	end
	return true
end

def checkPermutation3( array1,  size1,  array2,  size2)
	if (size1 != size2)
		return false
	end
	count = Array.new(256){0}
	i = 0
	while (i < size1)
		count[array1[i].ord] += 1
		count[array2[i].ord] -= 1
		i += 1
	end
	i = 0
	while (i < size1)
		if (count[i] != 0)
			return false
		end
		i += 1
	end
	return true
end
# Testing Code
def main38()
	str1 = "aaaabbbb".chars
	str2 = "bbaaaabb".chars
	print(checkPermutation(str1, str1.length, str2, str2.length),"\n")
	print(checkPermutation2(str1, str1.length, str2, str2.length),"\n")
	print(checkPermutation3(str1, str1.length, str2, str2.length),"\n")
end
# * true
# * true
# * true
def findElementIn2DArray( arr,  r,  c,  value)
	row = 0
	column = c - 1
	while (row < r && column >= 0)
		if (arr[row][column] == value)
			return true
		elsif (arr[row][column] > value)
			column -= 1
		else
			row += 1
		end
	end
	return false
end

def isAP( arr,  size)
	if (size <= 1)
		return true
	end
	arr.sort! {|a,b| a <=> b }
	diff = arr[1] - arr[0]
	i = 2
	while (i < size)
		if (arr[i] - arr[i - 1] != diff)
			return false
		end
		i += 1
	end
	return true
end

def isAP2( arr,  size)
	first = 9999999
	second = 9999999
	hs =  []
	i = 0
	while (i < size)
		if (arr[i] < first)
			second = first
			first = arr[i]
		elsif (arr[i] < second)
			second = arr[i]
		end
		i += 1
	end
	diff = second - first
	i = 0
	while (i < size)
		if (hs.include?(arr[i]))
			return false
		end
		hs.push(arr[i])
		i += 1
	end
	i = 0
	while (i < size)
		value = first + i * diff
		if (!hs.include?(value))
			return false
		end
		i += 1
	end
	return true
end

def isAP3( arr,  size)
	first = 9999999
	second = 9999999
	count = Array.new(size){0}
	index = -1
	i = 0
	while (i < size)
		if (arr[i] < first)
			second = first
			first = arr[i]
		elsif (arr[i] < second)
			second = arr[i]
		end
		i += 1
	end
	diff = second - first
	i = 0
	while (i < size)
		index = (arr[i] - first) / diff
		if (index > size - 1 || count[index] != 0)
			return false
		end
		count[index] = 1
		i += 1
	end
	i = 0
	while (i < size)
		if (count[i] != 1)
			return false
		end
		i += 1
	end
	return true
end
# Testing Code
def main39()
	arr = [20, 25, 15, 5, 0, 10, 35, 30]
	print(isAP(arr, arr.length),"\n")
	print(isAP2(arr, arr.length),"\n")
	print(isAP3(arr, arr.length),"\n")
end
# * true 
# * true 
# * true
def findBalancedPoint( arr,  size)
	first = 0
	second = 0
	i = 1
	while (i < size)
		second += arr[i]
		i += 1
	end
	i = 0
	while (i < size)
		if (first == second)
			return i
		end
		if (i < size - 1)
			first += arr[i]
			second -= arr[i + 1]
		end
		i += 1
	end
	return -1
end
# Testing Code
def main40()
	arr = [-7, 1, 5, 2, -4, 3, 0]
	print(findBalancedPoint(arr, arr.length),"\n")
end
# * 3
def findFloor( arr,  size,  value)
	start = 0
	stop = size - 1
	while (start <= stop)
		mid = (start + stop) / 2
		# 		 * search value is equal to arr[mid] value.. search value is greater than mid
		# 		 * index value and less than mid+1 index value. value is greater than
		# 		 * arr[size-1] then floor is arr[size-1]
		if (arr[mid] == value || (arr[mid] < value && (mid == size - 1 || arr[mid + 1] > value)))
			return arr[mid]
		elsif (arr[mid] < value)
			start = mid + 1
		else
			stop = mid - 1
		end
	end
	return -1
end

def findCeil( arr,  size,  value)
	start = 0
	stop = size - 1
	while (start <= stop)
		mid = (start + stop) / 2
		# 		 * search value is equal to arr[mid] value.. search value is less than mid index
		# 		 * value and greater than mid-1 index value. value is less than arr[0] then ceil
		# 		 * is arr[0]
		if (arr[mid] == value || (arr[mid] > value && (mid == 0 || arr[mid - 1] < value)))
			return arr[mid]
		elsif (arr[mid] < value)
			start = mid + 1
		else
			stop = mid - 1
		end
	end
	return -1
end
# Testing Code
def main41()
	arr = [2, 4, 8, 16]
	print("Floor :  " + findFloor(arr, arr.length, 5).to_s,"\n")
	print("Ceil :  " + findCeil(arr, arr.length, 5).to_s,"\n")
end
# Floor :  4
# Ceil :  8
def closestNumber( arr,  size,  num)
	start = 0
	stop = size - 1
	output = -1
	minDist = (2**(0.size*8-2))
	while (start <= stop)
		mid = (start + stop) / 2
		if (minDist > (arr[mid] - num).abs)
			minDist = (arr[mid] - num).abs
			output = arr[mid]
		end
		if (arr[mid] == num)
			break
		elsif (arr[mid] > num)
			stop = mid - 1
		else
			start = mid + 1
		end
	end
	return output
end
# Testing Code
def main42()
	arr = [2, 4, 8, 16]
	print(closestNumber(arr, arr.length, 9),"\n")
end
# * 8
def duplicateKDistance( arr,  size,  k)
	hm =  Hash.new
	i = 0
	while (i < size)
		if (hm.key?(arr[i]) && i - hm[arr[i]] <= k)
			print("Value:" + arr[i].to_s + " Index: " + hm[arr[i]].to_s + " & " + i.to_s,"\n")
			return true
		else
			hm[arr[i]] = i
		end
		i += 1
	end
	return false
end
# Testing Code
def main43()
	arr = [1, 2, 3, 1, 4, 5]
	duplicateKDistance(arr, arr.length, 3)
end
# * Value:1 Index: 0 & 3
def frequencyCounts( arr,  size)
	hm =  Hash.new
	i = 0
	while (i < size)
		if (hm.key?(arr[i]))
			hm[arr[i]] = hm[arr[i]] + 1
		else
			hm[arr[i]] = 1
		end
		i += 1
	end
	hm.each { |key,value|
	print("(" + key.to_s + " : " + hm[key].to_s + ") ")
	}
	print("\n")
end

def frequencyCounts2( arr,  size)
	arr.sort! {|a,b| a <=> b }
	count = 1
	i = 1
	while (i < size)
		if (arr[i] == arr[i - 1])
			count += 1
		else
			print("(" + arr[i - 1].to_s + " : " + count.to_s + ") ")
			count = 1
		end
		i += 1
	end
	print("(" + arr[size - 1].to_s + " : " + count.to_s + ") ")
	print("\n")
end

def frequencyCounts3( arr,  size)
	aux = Array.new(size + 1){0}
	i = 0
	while (i < size)
		aux[arr[i]] += 1
		i += 1
	end
	i = 0
	while (i < size + 1)
		if (aux[i] > 0)
			print("(" + i.to_s + " : " + aux[i].to_s + ") ")
		end
		i += 1
	end
	print("\n")
end

def frequencyCounts4( arr,  size)
	i = 0
	while (i < size)
		while (arr[i] > 0)
			index = arr[i] - 1
			if (arr[index] > 0)
				arr[i] = arr[index]
				arr[index] = -1
			else
				arr[index] -= 1
				arr[i] = 0
			end
		end
		i += 1
	end
	i = 0
	while (i < size)
		if (arr[i] != 0)
			print("(" + (i + 1).to_s + " : " + (arr[i]).abs.to_s + ") ")
		end
		i += 1
	end
	print("\n")
end
# Testing Code
def main44()
	arr = [1, 2, 2, 2, 1]
	frequencyCounts(arr, arr.length)
	frequencyCounts2(arr, arr.length)
	frequencyCounts3(arr, arr.length)
	frequencyCounts4(arr, arr.length)
end
# * (1 : 2) (2 : 3) 
# * (1 : 2) (2 : 3) 
# * (1 : 2) (2 : 3) 
# * (1 : 2) (2 : 3)
def kLargestElements( arrIn,  size,  k)
	arr = Array.new(size){0}
	i = 0
	while (i < size)
		arr[i] = arrIn[i]
		i += 1
	end
	arr.sort! {|a,b| a <=> b }
	i = 0
	while (i < size)
		if (arrIn[i] >= arr[size - k])
			print(arrIn[i].to_s + " ")
		end
		i += 1
	end
	print("\n")
end

def quickSelectUtil( arr,  lower,  upper,  k)
	if (upper <= lower)
		return
	end
	pivot = arr[lower]
	start = lower
	stop = upper
	while (lower < upper)
		while (arr[lower] <= pivot && lower < upper)
			lower += 1
		end
		while (arr[upper] > pivot && lower <= upper)
			upper -= 1
		end
		if (lower < upper)
			swap(arr, upper, lower)
		end
	end
	swap(arr, upper, start)
	# upper is the pivot position
	if (k < upper)
		quickSelectUtil(arr, start, upper - 1, k)
	end
	# pivot -1 is the upper for left sub array.
	if (k > upper)
		quickSelectUtil(arr, upper + 1, stop, k)
	end
end

def kLargestElements2( arrIn,  size,  k)
	arr = Array.new(size){0}
	i = 0
	while (i < size)
		arr[i] = arrIn[i]
		i += 1
	end
	quickSelectUtil(arr, 0, size - 1, size - k)
	i = 0
	while (i < size)
		if (arrIn[i] >= arr[size - k])
			print(arrIn[i].to_s + " ")
		end
		i += 1
	end
	print("\n")
end
# Testing Code
def main45()
	arr = [10, 50, 30, 60, 15]
	kLargestElements(arr, arr.length, 2)
	kLargestElements2(arr, arr.length, 2)
end
# * 50 60 
# * 50 60

# linear search method
def fixPoint( arr,  size)
	i = 0
	while (i < size)
		if (arr[i] == i)
			return i
		end
		i += 1
	end
	# fix point not found so return invalid index
	return -1
end
# Binary search method
def fixPoint2( arr,  size)
	low = 0
	high = size - 1
	while (low <= high)
		mid = (low + high) / 2
		if (arr[mid] == mid)
			return mid
		elsif (arr[mid] < mid)
			low = mid + 1
		else
			high = mid - 1
		end
	end
	# fix point not found so return invalid index
	return -1
end
# Testing Code
def main46()
	arr = [-10, -2, 0, 3, 11, 12, 35, 51, 200]
	print(fixPoint(arr, arr.length),"\n")
	print(fixPoint2(arr, arr.length),"\n")
end
# * 3 
# * 3
def subArraySums( arr,  size,  value)
	start = 0
	ed = 0
	sum = 0
	while (start < size && ed < size)
		if (sum < value)
			sum += arr[ed]
			ed += 1
		else
			sum -= arr[start]
			start += 1
		end
		if (sum == value)
			print("(" + start.to_s + " to " + (ed - 1).to_s + ") ")
		end
	end
end
# Testing Code
def main47()
	arr = [15, 5, 5, 20, 10, 5, 5, 20, 10, 10]
	subArraySums(arr, arr.length, 20)
	print("\n")
end
# (0 to 1) (3 to 3) (4 to 6) (7 to 7) (8 to 9)
def maxConSub( arr,  size)
	currMax = 0
	maximum = 0
	i = 0
	while (i < size)
		currMax += arr[i]
		if (currMax < 0)
			currMax = 0
		end
		if (maximum < currMax)
			maximum = currMax
		end
		i += 1
	end
	print(maximum,"\n")
	return maximum
end

def maxConSubArr( _A,  sizeA,  _B,  sizeB)
	currMax = 0
	maximum = 0
	hs =  []
	i = 0
	while (i < sizeB)
		hs.push(_B[i])
		i += 1
	end
	i = 0
	while (i < sizeA)
		if (hs.include?(_A[i]))
			currMax = 0
		else
			currMax = currMax + _A[i]
			if (currMax < 0)
				currMax = 0
			end
			if (maximum < currMax)
				maximum = currMax
			end
		end
		i += 1
	end
	print(maximum,"\n")
	return maximum
end

def maxConSubArr2( _A,  sizeA,  _B,  sizeB)
	_B.sort! {|a,b| a <=> b }
	currMax = 0
	maximum = 0
	i = 0
	while (i < sizeA)
		if (binarySearch(_B, sizeB, _A[i]))
			currMax = 0
		else
			currMax = currMax + _A[i]
			if (currMax < 0)
				currMax = 0
			end
			if (maximum < currMax)
				maximum = currMax
			end
		end
		i += 1
	end
	print(maximum,"\n")
	return maximum
end
# Testing Code
def main48()
	arr = [1, 2, -3, 4, 5, -10, 6, 7]
	maxConSub(arr, arr.length)
	arr2 = [1, 2, 3, 4, 5, -10, 6, 7, 3]
	arr3 = [1, 3]
	maxConSubArr(arr2, arr2.length, arr3, arr3.length)
	maxConSubArr2(arr2, arr2.length, arr3, arr3.length)
end
# * 13 
# * 13 
# * 13
def rainWater( arr,  size)
	leftHigh = Array.new(size){0}
	rightHigh = Array.new(size){0}
	max = arr[0]
	leftHigh[0] = arr[0]
	i = 1
	while (i < size)
		if (max < arr[i])
			max = arr[i]
		end
		leftHigh[i] = max
		i += 1
	end
	max = arr[size - 1]
	rightHigh[size - 1] = arr[size - 1]
	i = (size - 2)
	while (i >= 0)
		if (max < arr[i])
			max = arr[i]
		end
		rightHigh[i] = max
		i -= 1
	end
	water = 0
	i = 0
	while (i < size)
		water += [leftHigh[i],rightHigh[i]].min - arr[i]
		i += 1
	end
	print("Water : " + water.to_s,"\n")
	return water
end

def rainWater2( arr,  size)
	water = 0
	leftMax = 0
	rightMax = 0
	left = 0
	right = size - 1
	while (left <= right)
		if (arr[left] < arr[right])
			if (arr[left] > leftMax)
				leftMax = arr[left]
			else
				water += leftMax - arr[left]
			end
			left += 1
		else
			if (arr[right] > rightMax)
				rightMax = arr[right]
			else
				water += rightMax - arr[right]
			end
			right -= 1
		end
	end
	print("Water : " + water.to_s,"\n")
	return water
end
# Testing Code
def main49()
	arr = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
	rainWater(arr, arr.length)
	rainWater2(arr, arr.length)
end
# * Water : 6 
# * Water : 6
def separateEvenAndOdd( arr,  size)
	left = 0
	right = size - 1
	while (left < right)
		if (arr[left] % 2 == 0)
			left += 1
		elsif (arr[right] % 2 == 1)
			right -= 1
		else
			swap(arr, left, right)
			left += 1
			right -= 1
		end
	end
end
# Testing Code
def main50()
	first = [1, 5, 6, 6, 6, 6, 6, 6, 7, 8, 10, 13, 20, 30]
	separateEvenAndOdd(first, first.length)
	for val in first do
	print(val.to_s + " ")
	end
end
# * 30 20 6 6 6 6 6 6 10 8 7 13 5 1
def arrayIndexMaxDiff( arr,  size)
	maxDiff = -1
	i = 0
	while (i < size)
		j = size - 1
		while (i < j)
			if (arr[i] <= arr[j])
				maxDiff = [maxDiff, j - i].max
				break
			end
			j -= 1
		end
		i += 1
	end
	return maxDiff
end

def arrayIndexMaxDiff2( arr,  size)
	rightMax = Array.new(size){0}
	rightMax[size - 1] = arr[size - 1]
	i = size - 2
	while (i >= 0)
		rightMax[i] = [rightMax[i + 1], arr[i]].max
		i -= 1
	end
	maxDiff = -1
	i = 0
	j = 1
	while (i < size && j < size)
		if (arr[i] <= rightMax[j])
			if (i < j)
				maxDiff = [maxDiff,j - i].max
			end
			j = j + 1
		else
			i = i + 1
		end
	end
	return maxDiff
end
# Testing code
def main51()
	arr = [33, 9, 10, 3, 2, 60, 30, 33, 1]
	print("arrayIndexMaxDiff : " + arrayIndexMaxDiff(arr, arr.length).to_s,"\n")
	print("arrayIndexMaxDiff : " + arrayIndexMaxDiff2(arr, arr.length).to_s,"\n")
end
# arrayIndexMaxDiff : 7
# arrayIndexMaxDiff : 7
def maxPathSum( arr1,  size1,  arr2,  size2)
	i = 0
	j = 0
	result = 0
	sum1 = 0
	sum2 = 0
	while (i < size1 && j < size2)
		if (arr1[i] < arr2[j])
			sum1 += arr1[i]
			i += 1
		elsif (arr1[i] > arr2[j])
			sum2 += arr2[j]
			j += 1
		else
			result += [sum1,sum2].max
			result = result + arr1[i]
			sum1 = 0
			sum2 = 0
			i += 1
			j += 1
		end
	end
	while (i < size1)
		sum1 += arr1[i]
		i += 1
	end
	while (j < size2)
		sum2 += arr2[j]
		j += 1
	end
	result += [sum1,sum2].max
	return result
end
# Testing code
def main52()
	arr1 = [12, 13, 18, 20, 22, 26, 70]
	arr2 = [11, 15, 18, 19, 20, 26, 30, 31]
	print("Max Path Sum:: " + maxPathSum(arr1, arr1.length, arr2, arr2.length).to_s,"\n")
end
# Max Path Sum:: 201
def maxSubArraySum( a,  size)
	maxSoFar = 0
	maxEndingHere = 0
	i = 0
	while (i < size)
		maxEndingHere = maxEndingHere + a[i]
		if (maxEndingHere < 0)
			maxEndingHere = 0
		end
		if (maxSoFar < maxEndingHere)
			maxSoFar = maxEndingHere
		end
		i += 1
	end
	return maxSoFar
end
# Testing code
def main53()
	arr = [1, -2, 3, 4, -4, 6, -4, 3, 2]
	print("Max sub array sum :" + maxSubArraySum(arr, 9).to_s,"\n")
end
# Max sub array sum :10

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
main10A()
main11()
main12()
main13()
main14()
main15()
main16()
main17()
main18()
main19()
main20()
main21()
main22()
main23()
main24()
main25()
main26()
main27()
main28()
main29()
main30()
main31()
main32()
main33()
main34()
main35()
main36()
main37()
main38()
main39()
main40()
main41()
main42()
main43()
main44()
main45()
main46()
main47()
main48()
main49()
main50()
main51()
main52()
main53()
