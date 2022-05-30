def increment(var)
    var += 1
end

def Main1()
    x = 10
    print "\n Value of i before increment is :    " , x
    increment(x)
    print "\n Value of i after increment is :    " , x
end

#Main1()

class MyInt
    attr_accessor :value
    def initialize

    end
end

def increment2(value)
    value.value += 1
end

def Main2()
    x = MyInt.new()
    x.value = 10
    print "\n Value of i before increment is :    " , x.value
    increment2(x)
    print "\n Value of i after increment is :    " , x.value
end

#Main2()

def printArray(arr)
    i = 0
    while i < arr.size
        print arr[i], " "
        i += 1
    end
    puts ""
end

def swap(arr, x, y)
    temp = arr[x]
    arr[x] = arr[y]
    arr[y] = temp
    return
end

def permutation(arr, i, length)
    if length == i
        printArray(arr)
        return
    end
    j = i
    j = i
    while j < length
        swap(arr, i, j)
        permutation(arr, i + 1, length)
        swap(arr, i, j)
        j += 1
    end
    return
end

arr = [1,2,3,4,5]
permutation(arr, 0, 5)

def GCD(m, n)
    if n == 0
        return m
    end
    if m == 0
        return n
    end
    return GCD(n, m % n)
end

print "GCD : " ,GCD(5, 2)
#puts ""

def towerOfHanoi(num, src, dst, temp)
    if num < 1
        return
    end
    towerOfHanoi(num - 1, src, temp, dst)
    print "\n Move " , num , " disk from peg " , src , " to peg " , dst
    towerOfHanoi(num - 1, temp, dst, src)
end

num = 4
print "The sequence of moves involved in the Tower of Hanoi are :"
towerOfHanoi(num, 'A', 'C', 'B')

#Main4()

def function2()
    puts "fun2 line 1"
end

def function1()
    puts "fun1 line 1"
    function2()
    puts "fun1 line 2"
end

def main7()
    puts "main line 1"
    function1()
    puts "main line 2"
end

main7()

def maxSubArraySum(a)
    size = a.length()
    maxSoFar = 0
    maxEndingHere = 0
    i = 0
    while i < size
        maxEndingHere = maxEndingHere + a[i]
        if maxEndingHere < 0
            maxEndingHere = 0
        end
        if maxSoFar < maxEndingHere
            maxSoFar = maxEndingHere
        end
        i += 1
    end
    return maxSoFar
end

# Testing code
arr = [1, -2, 3, 4, -4, 6, -4, 8, 2]
print maxSubArraySum(arr)

def variableExample()
    var1 = "hello"
    var1 = 100
    var2 = 200
    var3 = var1 + var2
    print "Adding " , var1 , " and ", var2 , " will give " , var3
end

variableExample()


arr = Array.new(10)
i = 0
while i < 10
    arr[i] = i
    i += 1
end
print arr



def SequentialSearch(arr, value)
    size = arr.size
    i = 0
    while i < size
        if value == arr[i]
            return true
        end
        i += 1
    end
    return false
end

# Binary Search Algorithm , Iterative Way
def BinarySearch(arr, value)
    size = arr.size
    low = 0
    high = size - 1
    while low <= high
        mid = low + (high - low) / 2 # To avoid the overflow
        if arr[mid] == value then
            return true
        elsif arr[mid] < value then
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return false
end

# Binary Search Algorithm - Recursive Way
def BinarySearchRecursive(arr, value)
    return BinarySearcheUtil(arr, 0, arr.size, value)
end

def BinarySearcheUtil(arr, low, high, value)
    if low > high
        return false
    end
    mid = low + (high - low) / 2 # To avoid the overflow
    if arr[mid] == value then
        return true
    elsif arr[mid] < value then
        return BinarySearcheUtil(arr, mid + 1, high, value)
    else
        return BinarySearcheUtil(arr, low, mid - 1, value)
    end
end

# Testing Code
arr = [1,3,5,6,8,9,11,14,17,18]
puts SequentialSearch(arr, 9)
puts SequentialSearch(arr, 7)
puts BinarySearch(arr, 9)
puts BinarySearch(arr, 7)
puts BinarySearchRecursive(arr, 9)
puts BinarySearchRecursive(arr, 7)


def reverseArray(a, start, end1)
    i = start
    j = end1
    while i < j
        temp = a[i]
        a[i] = a[j]
        a[j] = temp
        i += 1
        j -= 1
    end
end

def rotateArray(a,    k)
    n = a.length()
    reverseArray(a, 0, k - 1)
    reverseArray(a, k, n - 1)
    reverseArray(a, 0, n - 1)
end

# Testing code
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
rotateArray(arr, 6)
print arr

def reverseArray(a)
    start = 0
    end1 = a.Length - 1
    i = start
    j = end1
    while i < j
        temp = a[i]
        a[i] = a[j]
        a[j] = temp
        i += 1
        j -= 1
    end
end

class Coord
    attr_accessor :x, :y
    def initialize(xval = 0, yval = 0)
        @x = xval
        @y = yval
    end
end

def main2()
    point = Coord.new()
    point.x = 10
    point.y = 10
    print "\n X axis coord value is : " , point.x
    print "\n Y axis coord value is : " , point.y
    return 0
end

#main2()

class Student
    attr_accessor :firstName, :lastName, :rollNo
    def initialize()
    end
end

def main3()
    stud = Student.new()
    refStud = stud
    refStud.rollNo = 1
    refStud.firstName = "john"
    refStud.lastName = "smith"
    print "Roll No:    ", refStud.rollNo , " Student Name:    " , refStud.firstName , refStud.lastName
    return 0
end

#main3()

# function returning the sum of two numbers
def sum(num1, num2)
    # local variable declaration
    result = num1 + num2
    return result
end

# function declaration
def main4()
    # local variable definition
    x = 10
    y = 20
    # calling a function to find sum
    result = sum(x, y)
    print "Sum is : " , result, "\n"
    return 0
end

#main4()

def factorial(i)
    # Termination Condition
    if i <= 1 then
        return 1
    end
    # Body, Recursive Expansion
    return i * factorial(i - 1)
end

# Testing code
puts factorial(10)

def printInt1(number)
    digit = (number % 10 + '0')
    number = number / 10
    if number != 0 then
        printInt1(number / 10)
    end
    print digit
end

def printInt2(number, baseValue)
    conversion = "0123456789ABCDEF"
    digit = (number % baseValue)
    number = number / baseValue
    if number != 0 then
        printInt2(number, baseValue)
    end
    print conversion[digit]
end

# Testing code
print printInt2(500, 16)

def fibonacci(n)
    if n <= 1 then
        return n
    end
    return fibonacci(n - 1) + fibonacci(n - 2)
end

# Testing code
puts fibonacci(10)

