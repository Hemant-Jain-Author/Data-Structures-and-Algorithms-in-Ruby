def matchExp(exp, str)
  return matchExpUtil(exp, str, 0, 0)
end

def matchExpUtil(exp, str, i, j)
  if i == exp.size and j == str.size
    return true
  end
  if (i == exp.size and j != str.size) or (i != exp.size and j == str.size)
    return false
  end
  if exp[i] == '?' or exp[i] == str[j]
    return matchExpUtil(exp, str, i + 1, j + 1)
  end
  if exp[i] == '*'
    return (matchExpUtil(exp, str, i + 1, j) or
    matchExpUtil(exp, str, i, j + 1) or
    matchExpUtil(exp, str, i + 1, j + 1))
  end
  return false
end

puts matchExp("*world?", "hello worldi")

def match(source, pattern)
  iSource = 0
  iPattern = 0
  sourceLen = source.size
  patternLen = pattern.size
  iSource = 0
  while iSource < sourceLen
    if source[iSource] == pattern[iPattern]
      iPattern += 1
    end
    if iPattern == patternLen
      return 1
    end
    iSource += 1
  end
  return 0
end

puts match("my name is hemant jain", "hemant")

#def myStrdup(src)
#  index = 0
#  dst = Array.new( src.size)
#  src.each  do |ch|
#    dst[index] = ch
#  end
#  return dst
#end

def isPrime(n)
  answer = (n > 1) ? true : false
  i = 2
  while i * i <= n
    if n % i == 0
      answer = false
      break
    end
    i += 1
  end
  return answer
end

print 6, isPrime(6),"\n"
print 7, isPrime(7),"\n"

#def myAtoi(str)
#  value = 0
#  size = str.size
#  i = 0
#  while i < size
#    ch = str[i]
#    value = (value << 3) + (value << 1) + (ch - '0')
#    i += 1
#  end
#  return value
#end

def isUniqueChar(str)
  bitarr = Array.new(26)
  i = 0
  while i < 26
    bitarr[i] = 0
    i += 1
  end
  size = str.size
  i = 0
  while i < size
    c = str[i].ord
    if 'A'.ord  <= c and 'Z'.ord  >= c
      c = (c - 'A'.ord )
    elsif 'a'.ord  <= c and 'z'.ord  >= c
      c = (c - 'a'.ord )
    else
      print "Unknown Char!\n"
      return false
    end
    if bitarr[c] != 0
      print "Duplicate detected!\n"
      return false
    end
    bitarr[c] += 1
    i += 1
  end
  print "No duplicate detected!\n"
  return true
end

puts isUniqueChar("aplpe")

def ToUpper(s)
  s = s.ord
  if s >= 97 and s <= (97 + 25)
    s = (s - 32)
  end
  return s.chr
end

def ToLower(s)
  s.ord
  if s >= 65 and s <= (65 + 25)
    s = (s + 32)
  end
  return s.chr
end

def LowerUpper(s)
  s.ord
  if s >= 97 and s <= (97 + 25)
    s = (s - 32)
  elsif s >= 65 and s <= (65 + 25)
    s = (s + 32)
  end
  return s.chr
end

def isPermutation(s1, s2)
  count = Array.new( 256)
  length = s1.size
  if s2.size != length
    return false
  end
  i = 0
  while i < 256
    count[i] = 0
    i += 1
  end
  i = 0
  while i < length
    ch = s1[i].ord
    count[ch] += 1
    ch = s2[i].ord
    count[ch] -= 1
    i += 1
  end
  i = 0
  while i < 256
    if count[i] != 0
      return false
    end
    i += 1
  end
  return true
end

puts "isPermutation return ", isPermutation("apllpa", "pllpaa")
puts "isPermutation return ", isPermutation("apllpa", "apllp")

def isPalindrome(str)
  i = 0
  j = str.size - 1
  while i < j and str[i] == str[j]
    i += 1
    j -= 1
  end
  if i < j
    print "String is not a Palindrome"
    return false
  else
    print "String is a Palindrome"
    return true
  end
end

puts isPalindrome("aplelpa")
puts isPalindrome("applppe")
puts isPalindrome("apllpa")

def pow(x, n)
  if n == 0
    return (1)
  elsif n % 2 == 0
    value = pow(x, n / 2)
    return (value * value)
  else
    value = pow(x, n / 2)
    return (x * value * value)
  end
end

puts pow(2, 10)

def strcmp(a, b)
  index = 0
  len1 = a.size
  len2 = b.size
  minlen = len1
  if len1 > len2
    minlen = len2
  end
  while index < minlen and a[index] == b[index]
    index += 1
  end
  if index == len1 and index == len2
    return 0
  elsif len1 == index
    return -1
  elsif len2 == index
    return 1
  else
    return a[index].ord  - b[index].ord
  end
end

puts strcmp("a", "b")
puts strcmp("b", "a")
puts strcmp("a", "a")
puts strcmp("ba", "baaa")
puts strcmp("bad", "bae")
puts strcmp("bad", "baa")

def reverseString1(a)
  lower = 0
  upper = a.size - 1
  while lower < upper
    tempChar = a[lower]
    a[lower] = a[upper]
    a[upper] = tempChar
    lower += 1
    upper -= 1
  end
end

def reverseString(a, lower, upper)
  while lower < upper
    tempChar = a[lower]
    a[lower] = a[upper]
    a[upper] = tempChar
    lower += 1
    upper -= 1
  end
end

def reverseWords(a)
  length = a.size
  upper = -1
  lower = 0
  i = 0
  while i <= length
    if a[i] == ' ' or i == length
      reverseString(a, lower, upper)
      lower = i + 1
      upper = i
    else
      upper += 1
    end
    i += 1
  end
  reverseString(a, 0, length - 1)
  return a
  # -1 because we do not want to reverse \0
end

str = "my name is hemant jain"
puts str
puts reverseWords(str)

def printAnagram(a)
  n = a.size
  printAnagramUtil(a, n, n)
end

def printAnagramUtil(a, max, n)
  if max == 1
    print a,"\n"
  end
  i = -1
  while i < max - 1
    if i != -1
      temp = a[i]
      a[i] = a[max - 1]
      a[max - 1] = temp
    end
    printAnagramUtil(a, max - 1, n)
    if i != -1
      temp = a[i]
      a[i] = a[max - 1]
      a[max - 1] = temp
    end
    i += 1
  end
end

# printAnagram("12345")
