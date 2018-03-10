require "CounterMap"
require "set"

def isAnagram(str1, str2)
  size1 = str1.size
  size2 = str2.size
  if size1 != size2
    return false
  end
  cm = Counter.new()
  index = 0
  while index < size1
    ch = str1[index]
    cm.add(ch)
    index += 1
  end

  index = 0
  while index < size2
    ch = str2[index]
    if cm.containsKey(ch) then
      cm.remove(ch)
    else
      return false
    end
    index += 1
  end
  return (cm.size() == 0)
end

def removeDuplicate(str)
  hs = Set.new
  out = ""
  index = 0
  size = str.size
  while index < size
    ch = str[index]
    if hs.include?(ch) == false then
      out = out + ch
      hs.add(ch)
    end
    index += 1
  end
  return out
end

def findMissing(arr, start, end2)
  hs = Set.new
  index = 0
  size = arr.size
  while index < size
    i = arr[index]
    hs.add(i)
    index += 1
  end
  curr = start
  while curr <= end2
    if hs.include?(curr) == false then
      return curr
    end
    curr += 1
  end
  return start - 1
end

def printRepeating(arr)
  hs = Set.new
  print "\n Repeating elements are:"
  index = 0
  size = arr.size
  while index < size
    val = arr[index]
    if hs.include?(val)
      print "  " , val
    end
    hs.add(val)
    index += 1
  end
end

def printFirstRepeating(arr)
  size = arr.size
  hs = Counter.new()
  i = 0
  while i < size
    hs.add(arr[i])
    i += 1
  end
  i = 0
  while i < size
    hs.remove(arr[i])
    if hs.containsKey(arr[i]) then
      print "\n First Repeating number is : " , arr[i]
      return
    end
    i += 1
  end
end

def hornerHash(key, tableSize)
  size = key.size
  h = 0
  i = 0
  while i < size
    h = (32 * h + key[i]) % tableSize
    i += 1
  end
  return h
end


# Testing code
first = "hello"
second = "elloh"
third = "world"

print "\n isAnagram : " , isAnagram(first, second)
print "\n isAnagram : " , isAnagram(first, third)

print "\n", first
first = removeDuplicate(first)
print "\n ", first

arr = [1, 2, 3, 5, 6, 7, 8, 9, 10]
print "\n missing number : ", findMissing(arr, 1, 10)
arr1 = [1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 1]
printRepeating(arr1)
printFirstRepeating(arr1)