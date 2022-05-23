def myStrcmp( a,  b)
    index = 0
    len1 = a.length
    len2 = b.length
    minlen = (len1 < len2) ? len1 : len2
    while (index < minlen && a[index] == b[index])
        index += 1
    end
    if (index == len1 && index == len2)
        return 0
    elsif (len1 == index)
        return -1
    elsif (len2 == index)
        return 1
    else
        return a[index].ord - b[index].ord
    end
end
# Testing Code
def main1()
    print(myStrcmp("apple", "appke"),"\n")
    print(myStrcmp("apple", "apple"),"\n")
    print(myStrcmp("apple", "appme"),"\n")
end
# 	1
# 	0
# 	-1

def matchPattern( source,  pattern)
    iSource = 0
    iPattern = 0
    sourceLen = source.length
    patternLen = pattern.length
    while (iSource < sourceLen)
        if (source[iSource] == pattern[iPattern])
            iPattern += 1
        end
        if (iPattern == patternLen)
            return true
        end
        iSource += 1
    end
    return false
end

# Testing Code
def main2()
    print(matchPattern("harrypottermustnotgotoschool", "potterschool"),"\n")
end
# true

def myStrdup( src)
    index = 0
    dst = Array.new(src.length){' '}
    for ch in src do
        dst[index] = ch
    end
    return dst
end

def isPrime( n)
    answer = (n > 1) ? true : false
    i = 2
    while (i * i <= n)
        if (n % i == 0)
            answer = false
            break
        end
        i += 1
    end
    return answer
end

def main3()
    print("Prime numbers under 10 :: ")
    i = 0
    while (i < 10)
        if (isPrime(i))
            print(i.to_s + " ")
        end
        i += 1
    end
    print("\n")
end
# Prime numbers under 10 :: 2 3 5 7

def myAtoi( str)
    value = 0
    size = str.length
    i = 0
    while (i < size)
        value = (value << 3) + (value << 1) + (str[i].ord - '0'.ord)
        i += 1
    end
    return value
end

def main4()
    print(myAtoi("1000"),"\n")
end
# 1000

def isUniqueChar( str)
    bitarr = Array.new(26){false}
    size = str.length
    i = 0
    while (i < size)
        c = str[i]
        if ('A' <= c && 'Z' >= c)
            index = (c.ord - 'A'.ord)
        elsif ('a' <= c && 'z' >= c)
            index = (c.ord - 'a'.ord)
        else
            print("Unknown Char!\n","\n")
            return false
        end
        if (bitarr[index])
            print("Duplicate detected!","\n")
            return false
        end
        bitarr[index] = true
        i += 1
    end
    print("No duplicate detected!","\n")
    return true
end

def main5()
    isUniqueChar("aple")
    isUniqueChar("apple")
end
# 	No duplicate detected!
# 	Duplicate detected!

def toUpper( s)
    if (s.ord >= 97 && s.ord <= (97 + 25))
        s = ((s.ord - 32)).chr
    end
    return s
end

def toLower( s)
    if (s.ord >= 65 && s.ord <= (65 + 25))
        s = ((s.ord + 32)).chr
    end
    return s
end

def lowerUpper( s)
    if (s.ord >= 97 && s.ord <= (97 + 25))
        s = ((s.ord - 32)).chr
    elsif (s.ord >= 65 && s.ord <= (65 + 25))
        s = ((s.ord + 32)).chr
    end
    return s
end

def main6()
    print(toLower('A'),"\n")
    print(toUpper('a'),"\n")
    print(lowerUpper('s'),"\n")
    print(lowerUpper('S'),"\n")
end
# 	a
# 	A
# 	S
# 	s

def isPermutation( s1,  s2)
    count = Array.new(256){0}
    length = s1.length
    if (s2.length != length)
        print("is permutation return false","\n")
        return false
    end
    i = 0
    while (i < length)
        ch = s1[i]
        count[ch.ord] += 1
        ch = s2[i]
        count[ch.ord] -= 1
        i += 1
    end
    i = 0
    while (i < length)
        if (count[i] != 0)
            print("Strings are not permutation.","\n")
            return false
        end
        i += 1
    end
    print("Strings are permutation.","\n")
    return true
end

def main7()
    print(isPermutation("apple", "plepa"),"\n")
end

# 	Strings are permutation.
# 	true

def isPalindrome( str)
    i = 0
    j = str.length - 1
    while i < j && str[i] == str[j]
        i += 1
        j -= 1
    end
    if i < j
        print("String is not a Palindrome","\n")
        return false
    else
        print("String is a Palindrome","\n")
        return true
    end
end

def main8()
    isPalindrome("hello")
    isPalindrome("oyo")
end

# 	String is not a Palindrome
# 	String is a Palindrome

def pow( x,  n)
    if (n == 0)
        return (1)
    elsif (n % 2 == 0)
        value = pow(x, n / 2)
        return (value * value)
    else
        value = pow(x, n / 2)
        return (x * value * value)
    end
end

def main9()
    print(pow(5, 2),"\n")
end
# 25

def reverseString( str)
    a = str.chars
    lower = 0
    upper = a.length - 1
    reverseStringUtil(a, lower,  upper)
    return a.join('')
end

def reverseStringUtil( a,  lower,  upper)
    while (lower < upper)
        tempChar = a[lower]
        a[lower] = a[upper]
        a[upper] = tempChar
        lower += 1
        upper -= 1
    end
end

def reverseWords( str)
    a = str.chars
    length = a.length
    lower = 0
    upper = -1
    i = 0
    while (i <= length)
        if (i == length || a[i] == ' ')
            reverseStringUtil(a, lower, upper)
            lower = i + 1
            upper = i
        else
            upper += 1
        end
        i += 1
    end
    reverseStringUtil(a, 0, length - 1)
    return a.join('')
end

def main11()
    print(reverseString("apple"),"\n")
    print(reverseWords("hello world"),"\n")
end

# 	elppa
# 	world hello

def printAnagram( str)
    printAnagramUtil(str.chars, 0, str.length)
end

def printAnagramUtil( arr,  i,  length)
    if (length == i)
        print(arr.join(''), "\n")
        return
    end
    j = i
    while (j < length)
        swap(arr, i, j)
        printAnagramUtil(arr, i + 1, length)
        swap(arr, i, j)
        j += 1
    end
    return
end

def swap( arr,  i,  j)
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
end

def main12()
    printAnagram("123")
end

# 	123
# 	132
# 	213
# 	231
# 	321
# 	312

def shuffle( str)
    ar = str.chars
    n = ar.length / 2
    count = 0
    k = 1
    i = 1
    while (i < n)
        temp = ar[i]
        k = i
        loop do
            k = (2 * k) % (2 * n - 1)
            temp2 = temp
            temp = ar[k]
            ar[k] = temp2
            count += 1
            if(!(i != k))
                break
            end
        end
        if (count == (2 * n - 2))
            break
        end
        i = i + 2
    end
    print(ar.join(''),"\n")
end

def main13()
    shuffle("ABCDE12345")
end

# A1B2C3D4E5

def addBinary( st1,  st2)
    str1 = st1.chars
    str2 = st2.chars
    size1 = str1.length
    size2 = str2.length
    max = (size1 > size2) ? size1 : size2
    total = Array.new(max + 1){' '}
    first = 0
    second = 0
    sum = 0
    carry = 0
    index = max
    while (index > 0)
        first = (size1 <= 0) ? 0 : str1[size1 - 1].ord - '0'.ord
        second = (size2 <= 0) ? 0 : str2[size2 - 1].ord - '0'.ord
        sum = first + second + carry
        carry = sum >> 1
        sum = sum & 1
        total[index] = (sum == 0) ? '0' : '1'
        index -= 1
        size1 -= 1
        size2 -= 1
    end
    total[0] = (carry == 0) ? '0' : '1'
    return  total.join('')
end

def main14()
    print(addBinary("1000", "11111111"),"\n")
end

# 100000111

def matchExp( src,  ptn)
    return matchExpUtil(src, ptn, 0, 0)
end

def matchExpUtil( exp,  str,  i,  j)
    if (i == exp.length && j == str.length)
        return true
    end
    if ((i == exp.length && j != str.length) || (i != exp.length && j == str.length))
        return false
    end
    if (exp[i] == '?' || exp[i] == str[j])
        return matchExpUtil(exp, str, i + 1, j + 1)
    end
    if (exp[i] == '*')
        return matchExpUtil(exp, str, i + 1, j) || matchExpUtil(exp, str, i, j + 1) || matchExpUtil(exp, str, i + 1, j + 1)
    end
    return false
end

def main10()
    print(matchExp("*llo,?World?", "Hello, World!"),"\n")
end
# true

main1()
main2()
main3()
main4()
main5()
main6()
main7()
main8()
main9()
main11()
main12()
main13()
main14()
main10()
