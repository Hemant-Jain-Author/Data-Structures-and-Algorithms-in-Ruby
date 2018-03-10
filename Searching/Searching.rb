require 'set'

def linearSearchUnsorted(arr, value)
  i = 0
  size = arr.size
  while i < size
    if value == arr[i]
      return true
    end
    i += 1
  end
  return false
end

def linearSearchSorted(arr, value)
  i = 0
  size = arr.size
  while i < size
    if value == arr[i]
      return true
    elsif value < arr[i]
      return false
    end
    i += 1
  end
  return false
end

# Binary Search Algorithm : Iterative Way
def Binarysearch(arr, value)
  low = 0
  high = arr.size - 1
  while low <= high
    mid = low + (high - low) / 2 # To avoid the overflow
    if arr[mid] == value
      return true
    elsif arr[mid] < value
      low = mid + 1
    else
      high = mid - 1
    end
  end
  return false
end

# Binary Search Algorithm : Recursive Way
def BinarySearchRecursive(arr, value)
  return BinarySearchRecursiveUtil(arr, 0, arr.size - 1, value)
end

def BinarySearchRecursiveUtil(arr, low, high, value)
  if low > high
    return false
  end
  mid = low + (high - low) / 2 # To avoid the overflow
  if arr[mid] == value
    return true
  elsif arr[mid] < value
    return BinarySearchRecursiveUtil(arr, mid + 1, high, value)
  else
    return BinarySearchRecursiveUtil(arr, low, mid - 1, value)
  end
end


arr = [1, 3, 5, 7, 9, 25, 30]
print "\n linearSearchUnsorted : ", linearSearchUnsorted(arr, 7)
print "\n linearSearchUnsorted : ", linearSearchUnsorted(arr, 8)
print "\n linearSearchSorted : ", linearSearchUnsorted(arr, 7)
print "\n linearSearchSorted : ", linearSearchUnsorted(arr, 8)
print "\n Binarysearch : ", linearSearchUnsorted(arr, 7)
print "\n Binarysearch : ", linearSearchUnsorted(arr, 8)
print "\n BinarySearchRecursive : ", linearSearchUnsorted(arr, 7)
print "\n BinarySearchRecursive : ", linearSearchUnsorted(arr, 8)

def printRepeating(arr)
  size = arr.size
  print " Repeating elements are "
  i = 0
  while i < size
    j = i + 1
    while j < size
      if arr[i] == arr[j]
        print " " , arr[i]
      end
      j += 1
    end
    i += 1
  end
end

def printRepeating2(arr)
  size = arr.size
  arr = arr.sort()
  print " Repeating elements are "
  i = 1
  while i < size
    if arr[i] == arr[i - 1]
      print " " , arr[i]
    end
    i += 1
  end
end

def printRepeating3(arr)
  size = arr.size
  set = Set.new
  print " Repeating elements are "
  i = 0
  while i < size
    if set.include?(arr[i])
      print " " , arr[i]
    else
      set.add(arr[i])
    end
    i += 1
  end
end

def printRepeating4(arr,range)
  size = arr.size
  count = Array.new(range + 1, 0)
  print " Repeating elements are "
  i = 0
  while i < size
    if count[arr[i]] == 1
      print " " , arr[i]
    else
      count[arr[i]] = count[arr[i]] + 1
    end
    i += 1
  end
end

arr = [1, 3, 5, 7, 3, 9, 25, 5, 30, 5, 7, 7]
puts ""
printRepeating(arr)
puts ""
printRepeating2(arr)
puts ""
printRepeating3(arr)
puts ""
printRepeating4(arr,30)
puts ""


def getMaxCount(arr)
  size = arr.size
  max = 0
  count = 0
  maxCount = 0
  i = 0
  while i < size
    j = i + 1
    while j < size
      if arr[i] == arr[j]
        count += 1
      end
      j += 1
    end
    if count > maxCount
      max = arr[i]
      maxCount = count
    end
    count = 0
    i += 1
  end
  return max
end

def getMaxCount2(arr)
  size = arr.size
  max = arr[0]
  maxCount = 1
  curr = arr[0]
  currCount = 1
  arr = arr.sort()
  i = 1
  while i < size
    if arr[i] == arr[i - 1]
      currCount += 1
    else
      currCount = 1
      curr = arr[i]
    end
    if currCount > maxCount
      maxCount = currCount
      max = curr
    end
    i += 1
  end
  return max
end

def getMaxCount3(arr, range)
  size = arr.size
  max = arr[0]
  maxCount = 1
  count = Array.new( range+1, 0)
  i = 0
  while i < size
    count[arr[i]] += 1
    if count[arr[i]] > maxCount
      maxCount = count[arr[i]]
      max = arr[i]
    end
    i += 1
  end
  return max
end

def Main3()
  arr = [1, 3, 5, 7, 3, 9, 25, 5, 30, 5, 7, 7, 5]
  puts getMaxCount(arr)
  puts getMaxCount2(arr)
  puts getMaxCount3(arr,30)
end

#Main3()

def getMajority(arr)
  size = arr.size
  max = 0
  count = 1
  maxCount = 0
  i = 0
  while i < size
    j = i + 1
    while j < size
      if arr[i] == arr[j]
        count += 1
      end
      j += 1
    end
    if count > size / 2
      return arr[i]
    end
    count = 1
    i += 1
  end
  print "no majority found"
  return -1
end

def getMajority2(arr)
  size = arr.size
  majIndex = size / 2
  count = 1
  arr = arr.sort()
  candidate = arr[majIndex]
  count = 0
  i = 0
  while i < size
    if arr[i] == candidate
      count += 1
    end
    i += 1
  end
  if count > size / 2
    return arr[majIndex]
  else
    print "no majority found"
    return -1
  end
end

def getMajority3(arr)
  size = arr.size
  majIndex = 0
  count = 1
  i = 1
  while i < size
    if arr[majIndex] == arr[i]
      count += 1
    else
      count -= 1
    end
    if count == 0
      majIndex = i
      count = 1
    end
    i += 1
  end
  candidate = arr[majIndex]
  count = 0
  i = 0
  while i < size
    if arr[i] == candidate
      count += 1
    end
    i += 1
  end
  if count > size / 2
    return arr[majIndex]
  else
    print "no majority found"
    return -1
  end
end

def Main4()
  arr = [1, 5, 5, 7, 5, 3, 9, 5, 25, 5, 30,5, 6, 5, 7, 5, 7, 5,5]
  puts getMajority(arr)
  puts getMajority2(arr)
  puts getMajority3(arr)
end

#Main4()

def findMissingNumber(arr, range)
  found = 0
  i = 1
  size = arr.size
  while i <= range
    found = 0
    j = 0
    while j < size
      if arr[j] == i
        found = 1
        break
      end
      j += 1
    end
    if found == 0
      return i
    end
    i += 1
  end
  print "missing number not found"
  return -1
end

def findMissingNumber2(arr, range)
  size = arr.size
  xorSum = 0
  #get the XOR of all the numbers from 1 to range
  i = 1
  while i <= range
    xorSum ^= i
    i += 1
  end
  #loop through the array and get the XOR of elements
  i = 0
  while i < size
    xorSum ^= arr[i]
    i += 1
  end
  return xorSum
end

def Main5()
  arr = [1, 3, 5, 7, 8, 9, 2, 4]
  puts findMissingNumber(arr,9)
  puts findMissingNumber2(arr,9)
end

#Main5()

def FindPair(arr, value)
  size = arr.size
  i = 0
  while i < size
    j = i + 1
    while j < size
      if (arr[i] + arr[j]) == value
        puts "The pair is : #{ arr[i]}, #{arr[j]}"
        return 1
      end
      j += 1
    end
    i += 1
  end
  return 0
end

def FindPair2(arr, value)
  size = arr.size
  first = 0
  second = size - 1
  arr = arr.sort()
  while first < second
    curr = arr[first] + arr[second]
    if curr == value
      puts "The pair is : #{ arr[first]}, #{arr[second]}"
      return 1
    elsif curr < value
      first += 1
    else
      second -= 1
    end
  end
  return 0
end

def FindPair3(arr, value)
  size = arr.size
  set = Set.new
  i = 0
  while i < size
    if set.include?(value - arr[i])
      puts "The pair is : #{ arr[i]}, #{value - arr[i]}"
      return 1
    end
    set.add(arr[i])
    i += 1
  end
  return 0
end

def Main6()
  arr = [1, 3, 5, 7, 8, 9, 2, 4]
  FindPair(arr,9)
  FindPair2(arr,9)
  FindPair3(arr,9)
end

#Main6()

def minAbsSumPair(arr)
  size = arr.size
  # Array should have at least two elements
  if size < 2
    print "Invalid Input"
    return
  end
  # Initialization of values
  minFirst = 0
  minSecond = 1
  minSum = (arr[0] + arr[1]).abs
  l = 0
  while l < size - 1
    r = l + 1
    while r < size
      sum = (arr[l] + arr[r]).abs
      if sum < minSum
        minSum = sum
        minFirst = l
        minSecond = r
      end
      r += 1
    end
    l += 1
  end
  puts "The two elements with minimum sum are : #{arr[minFirst]},#{arr[minSecond]}"
end

def minAbsSumPair2(arr)
  size = arr.size
  # Array should have at least two elements
  if size < 2
    print "Invalid Input"
    return
  end
  arr = arr.sort()
  # Initialization of values
  minFirst = 0
  minSecond = size - 1
  minSum = (arr[minFirst] + arr[minSecond]).abs
  l = 0
  r = size - 1
  while l < r
    sum = (arr[l] + arr[r])
    if (sum).abs < minSum
      minSum = sum
      minFirst = l
      minSecond = r
    end
    if sum < 0
      l += 1
    elsif sum > 0
      r -= 1
    else
      break
    end
  end
  puts "The two elements with minimum sum are : #{arr[minFirst]},#{arr[minSecond]}"
end

def Main8()
  arr = [1, -3, 5, 7, -8, 99, 22, 44]
  minAbsSumPair(arr)
  minAbsSumPair2(arr)
end

#Main8()

def SearchBotinicArrayMax(arr)
  size = arr.size
  start = 0
  end2 = size - 1
  mid = (start + end2) / 2
  maximaFound = 0
  if size < 3
    print "error"
    return 0
  end
  while start <= end2
    mid = (start + end2) / 2
    if arr[mid - 1] < arr[mid] and arr[mid + 1] < arr[mid]  #maxima
      maximaFound = 1
      break
    elsif arr[mid - 1] < arr[mid] and arr[mid] < arr[mid + 1]  #increasing
      start = mid + 1
    elsif arr[mid - 1] > arr[mid] and arr[mid] > arr[mid + 1]  #decreasing
      end2 = mid - 1
    else
      break
    end
  end
  if maximaFound == 0
    print "error"
    return 0
  end
  return arr[mid]
end

def Main9()
  arr = [6, 8, 11, 12, 0, 2, 4, 5]
  puts SearchBotinicArrayMax(arr)
end

#Main9()

def SearchBitonicArray(arr, key)
  size = arr.size
  max = FindMaxBitonicArray(arr, size)
  #puts max
  k = BinarySearch(arr, 0, max, key, true)
  if k != -1
    return k
  else
    return BinarySearch(arr, max + 1, size - 1, key, false)
  end
end

def FindMaxBitonicArray(arr, size)
  start = 0
  end2 = size - 1
  if size < 3
    print "error"
    return 0
  end
  while start <= end2
    mid = (start + end2) / 2
    if arr[mid - 1] < arr[mid] and arr[mid + 1] < arr[mid]  #maxima
      return mid
    elsif arr[mid - 1] < arr[mid] and arr[mid] < arr[mid + 1]  #increasing
      start = mid + 1
    elsif arr[mid - 1] > arr[mid] and arr[mid] > arr[mid + 1]  #increasing
      end2 = mid - 1
    else
      break
    end
  end
  print "error"
  return 0
end

def BinarySearch(arr, start, end2, key, isInc)
  if end2 < start
    return -1
  end
  mid = (start + end2) / 2
  #puts "mid is #{mid}"
  if key == arr[mid]
    return mid
  end
  if (isInc == true and key < arr[mid] )or (isInc == false and key > arr[mid])
    return BinarySearch(arr, start, mid - 1, key, isInc)
  else
    return BinarySearch(arr, mid + 1, end2, key, isInc)
  end
end

def Main10()
  arr = [6, 8, 11, 12, 5, 4, 2 ,0]
  #  puts ""
  #  puts ""
  for i in arr
    puts SearchBitonicArray(arr, i)
  end
end

#Main10()

def findKeyCount(arr, key)
  size = arr.size
  count = 0
  i = 0
  while i < size
    if arr[i] == key
      count += 1
    end
    i += 1
  end
  return count
end

def findFirstIndex(arr, start, end2, key)
  if end2 < start
    return -1
  end
  mid = (start + end2) / 2
  if key == arr[mid] and (mid == start or arr[mid - 1] != key)
    return mid
  end
  if key <= arr[mid]  # <= is us the number.t in sorted array.
    return findFirstIndex(arr, start, mid - 1, key)
  else
    return findFirstIndex(arr, mid + 1, end2, key)
  end
end

def findLastIndex(arr, start, end2, key)
  if end2 < start
    return -1
  end
  mid = (start + end2) / 2
  if key == arr[mid] and (mid == end2 or arr[mid + 1] != key)
    return mid
  end
  if key < arr[mid]  # <
    return findLastIndex(arr, start, mid - 1, key)
  else
    return findLastIndex(arr, mid + 1, end2, key)
  end
end

def findKeyCount2(arr, key)
  size = arr.size
  firstIndex = findFirstIndex(arr, 0, size - 1, key)
  lastIndex = findLastIndex(arr, 0, size - 1, key)
  return (lastIndex - firstIndex + 1)
end

def Main11()
  arr = [6, 8, 11, 6, 4 , 12, 5, 4, 2 ,0]
  #  puts ""
  puts ""
  for i in arr
    puts findKeyCount2(arr, i)
  end
  puts "*"
end

#Main11()

def swap(arr, first, second)
  temp = arr[first]
  arr[first] = arr[second]
  arr[second] = temp
end

def seperateEvenAndOdd(arr)
  size = arr.size
  left = 0
  right = size - 1
  while left < right
    if arr[left] % 2 == 0
      left += 1
    elsif arr[right] % 2 == 1
      right -= 1
    else
      swap(arr, left, right)
      left += 1
      right -= 1
    end
  end
end

def main12()
  a = [1,2,3,4,5,6,7,8,9]
  seperateEvenAndOdd(a)
  print a
end

#main12()

def maxProfit(stocks)
  size = stocks.size
  buy = 0
  sell = 0
  curMin = 0
  currProfit = 0
  maxProfit = 0
  i = 0
  while i < size
    if stocks[i] < stocks[curMin]
      curMin = i
    end
    currProfit = stocks[i] - stocks[curMin]
    if currProfit > maxProfit
      buy = curMin
      sell = i
      maxProfit = currProfit
    end
    i += 1
  end
  puts "Purchase day is-  , #{buy} ,  at price  , #{stocks[buy]}"
  puts "Sell day is-  , #{sell} ,  at price  , #{stocks[sell]}"
  return ( stocks[sell] - stocks[buy])
end

def main13()
  a = [10,6,12,5,14,13,6,15,9]
  print a
  puts maxProfit(a)
end

#main13()

def getMedian(arr)
  size = arr.size
  arr = arr.sort()
  return arr[size / 2]
end

def findMedian(arrFirst, arrSecond)
  sizeFirst = arrFirst.size
  sizeSecond = arrSecond.size
  medianIndex = ((sizeFirst + sizeSecond) + (sizeFirst + sizeSecond) % 2) / 2 #cealing function.
  i = 0
  j = 0
  count = 0
  while count < medianIndex - 1
    if i < sizeFirst - 1 and arrFirst[i] < arrSecond[j]
      i += 1
    else
      j += 1
    end
    count += 1
  end
  if arrFirst[i] < arrSecond[j]
    return arrFirst[i]
  else
    return arrSecond[j]
  end
end

def main14()
  a = [10,6,12,5,14,13,6,15,9]
  puts getMedian(a)
  b = [10,6,12,5,14,13,6,1,9]
  puts findMedian(a.sort(),b.sort())
end

#main14()

def min(a, b)
  return a > b ? b : a
end

def max(a, b)
  return a < b ? b : a
end

def BinarySearch01(arr)
  size = arr.size
  if size == 1 and arr[0] == 1
    return 0
  end
  return BinarySearch01Util(arr, 0, size - 1)
end

def BinarySearch01Util(arr, start, end2)
  if end2 < start
    return -1
  end
  mid = (start + end2) / 2
  if 1 == arr[mid] and 0 == arr[mid - 1]
    return mid
  end
  if 0 == arr[mid]
    return BinarySearch01Util(arr, mid + 1, end2)
  else
    return BinarySearch01Util(arr, start, mid - 1)
  end
end

def main15()
  a = [0,0,0,0,0,0,0,1,1]
  puts BinarySearch01(a)
end

#main15()

def BinarySearchRotateArrayUtil(arr, start, end2, key)
  if end2 < start
    return -1
  end
  mid = (start + end2) / 2
  if key == arr[mid]
    return mid
  end
  if arr[mid] > arr[start]
    if arr[start] <= key and key < arr[mid]
      return BinarySearchRotateArrayUtil(arr, start, mid - 1, key)
    else
      return BinarySearchRotateArrayUtil(arr, mid + 1, end2, key)
    end
  else
    if arr[mid] < key and key <= arr[end2]
      return BinarySearchRotateArrayUtil(arr, mid + 1, end2, key)
    else
      return BinarySearchRotateArrayUtil(arr, start, mid - 1, key)
    end
  end
end

def BinarySearchRotateArray(arr, key)
  size = arr.size
  return BinarySearchRotateArrayUtil(arr, 0, size - 1, key)
end

def main16()
  a = [10,11,12,15,1,3,6,8,9]
  puts BinarySearchRotateArray(a,6)
  puts BinarySearchRotateArray(a,11)
  puts BinarySearchRotateArray(a,13)
  puts BinarySearchRotateArray(a,7)
end

#main16()

def FirstRepeated(arr)
  size = arr.size
  i = 0
  while i < size
    j = i + 1
    while j < size
      if arr[i] == arr[j]
        return arr[i]
      end
      j += 1
    end
    i += 1
  end
  return 0
end

def main17()
  a = [10,1,12,15,1,6,6,8,9]
  puts FirstRepeated(a)
end

#main17()

def transformArrayAB1(arr)
  size = arr.size
  n = size / 2
  i = 1
  while i < n
    j = 0
    while j < i
      swap(arr, n - i + 2 * j, n - i + 2 * j + 1)
      j += 1
    end
    i += 1
  end
end

def main18()
  a = ['a','a','a','a','b','b','b','b']
  transformArrayAB1(a)
  print a
end

#main18()

def checkPermutation(array1, array2)
  size1 = array1.size
  size2 = array2.size
  if size1 != size2
    return false
  end
  array1 = array1.sort()
  array2 = array2.sort()
  i = 0
  while i < size1
    if array1[i] != array2[i]
      return false
    end
    i += 1
  end
  return true
end

def checkPermutation2(array1, array2, range)
  size1 = array1.size
  size2 = array2.size
  if size1 != size2
    return false
  end
  count = Array.new(range + 1, 0)
  i = 0
  while i < size1
    count[array1[i]] += 1
    i += 1
  end
  i = 0
  while i < size2
    if count[array2[i]] == 0
      return false
    end
    count[array2[i]] -= 1
    i += 1
  end
  return true
end

def main19()
  a = [9,1,2,8,7,3,6,4,5]
  b = [1,2,3,4,5,6,7,8,9]
  puts checkPermutation(a,b)
  puts checkPermutation2(a,b,20)
end

#main19()

def removeDuplicates(arr)
  size = arr.size
  if size == 0
    return 0
  end
  j = 0
  arr = arr.sort()
  i = 1
  while i < size
    if arr[i] != arr[j]
      j += 1
      arr[j] = arr[i]
    end
    i += 1
  end
  puts j
  return arr[0..j+1]
end

def main18()
  
  a = [10,1,12,15,1,6,6,8,9]
  a = removeDuplicates(a)
  print a
end

#main18()

def FindElementIn2DArray(arr, r, c, value)
  row = 0
  column = c - 1
  while row < r and column >= 0
    if arr[row][column] == value
      return 1
    elsif arr[row][column] > value
      column -= 1
    else
      row += 1
    end
  end
  return 0
end
