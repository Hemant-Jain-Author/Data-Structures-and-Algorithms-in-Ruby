def isAnagram( str1,  str2)
	if (str1.length != str2.length)
		return false
	end

	hm =  Hash.new
	for ch in str1 do
		if (hm.key?(ch))
			hm[ch] = hm[ch] + 1
		else
			hm[ch] = 1
		end
	end

	for ch in str2 do
		if (hm.key?(ch) == false || hm[ch] == 0)
			return false
		else
			hm[ch] = hm[ch] - 1
		end
	end
	return true
end

# Testing code.
def main1()
	first = "hello".chars
	second = "elloh".chars
	third = "world".chars
	print("isAnagram : " + isAnagram(first, second).to_s,"\n")
	print("isAnagram : " + isAnagram(first, third).to_s,"\n")
end

# 	isAnagram : true
# 	isAnagram : false

def removeDuplicate( str)
	hs =  []
	out =  ""
	for ch in str do
		if (hs.include?(ch) == false)
			out += ch
			hs.push(ch)
		end
	end
	return out
end

# Testing code.
def main2()
	first = "hello".chars
	print(removeDuplicate(first),"\n")
end
# 	helo

def findMissing( arr,  start,  ed)
	hs =  []
	for i in arr do
		hs.push(i)
	end
	curr = start
	while (curr <= ed)
		if (hs.include?(curr) == false)
			return curr
		end
		curr += 1
	end
	return 99999
end

# Testing code.
def main3()
	arr = [1, 2, 3, 5, 6, 7, 8, 9, 10]
	print(findMissing(arr, 1, 10),"\n")
end
# 	4

def printRepeating( arr)
	hs =  []
	out = "Repeating elements are : "
	for val in arr do
		if (hs.include?(val))
			out += val.to_s + " "
		else
			hs.push(val)
		end
	end
	print(out,"\n")
end

# Testing code.
def main4()
	arr1 = [1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 1]
	printRepeating(arr1)
end
# 	Repeating elements are : 4 1 

def printFirstRepeating( arr)
	size = arr.length
	hs =  []
	firstRepeating = 99999
	i = size - 1
	while (i >= 0)
		if (hs.include?(arr[i]))
			firstRepeating = arr[i]
		end
		hs.push(arr[i])
		i -= 1
	end
	print("First Repeating number is : " + firstRepeating.to_s,"\n")
end

# Testing code.
def main5()
	arr1 = [1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 1]
	printFirstRepeating(arr1)
end
# First Repeating number is : 1

def hornerHash( key,  tableSize)
	size = key.length
	h = 0
	i = 0
	while (i < size)
		h = (32 * h + key[i].ord) % tableSize
		i += 1
	end
	return h
end

main1()
main2()
main3()
main4()
main5()
