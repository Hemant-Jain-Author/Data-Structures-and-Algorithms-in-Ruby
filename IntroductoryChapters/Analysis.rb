def fun1(n)
    m = 0
    i = 0
    while i < n
        m += 1
        i += 1
    end
    return m
end

def fun2(n)
    i = 0
    m = 0
    while i < n
        j = 0
        while j < n
            m += 1
            j += 1
        end
        i += 1
    end
    return m
end

def fun3(n)
    m = 0
    i = 0
    while i < n
        j = 0
        while j < n
            k = 0
            while k < n
                m += 1
                k += 1
            end
            j += 1
        end
        i += 1
    end
    return m
end

def fun4(n)
    m = 0
    i = 0
    while i < n
        j = i
        while j < n
            k = j + 1
            while k < n
                m += 1
                k += 1
            end
            j += 1
        end
        i += 1
    end
    return m
end

def fun5(n)
    m = 0
    i = 0
    while i < n
        j = 0
        while j < i
            m += 1
            j += 1
        end
        i += 1
    end
    return m
end

def fun6(n)
    m = 0
    i = 0
    while i < n
        j = i
        while j > 0
            m += 1
            j -= 1
        end
        i += 1
    end
    return m
end

def fun7(n)
    m = 0
    i = n
    while i > 0
        j = 0
        while j < i
            m += 1
            j += 1
        end
        i /= 2
    end
    return m
end

def fun8(n)
    m = 0
    i = 1
    while i <= n
        j = 0
        while j <= i
            m += 1
            j += 1
        end
        i *= 2
    end
    return m
end

def fun9(n)
    m = 0
    i = 1
    while i < n
        m += 1
        i = i * 2
    end
    return m
end

def fun10(n)
    m = 0
    i = n
    while i > 0
        m += 1
        i = i / 2
    end
    return m
end



def fun11(n)
    m = 0
    i = 0
    while i < n
        j = 0
        while j < n
            m += 1
            j += 1
        end
        i += 1
    end
    i = 0
    while i < n
        k = 0
        while k < n
            m += 1
            k += 1
        end
        i += 1
    end
    return m
end

def fun12(n)
    m = 0
    i = 0
    while i < n
        j = 0
        while j < Math.sqrt(n)
            m += 1
            j += 1
        end
        i += 1
    end
    return m
end

def fun13(n)
    m = 0
    i = 0
    j = 0
    while i < n
        while j < n
            m += 1
            j += 1
        end
        i += 1
    end
    return m
end


# Testing Code
print "N = 100, Number of instructions :: ", fun1(100), "\n"
print "N = 100, Number of instructions :: ", fun2(100), "\n"
print "N = 100, Number of instructions :: ", fun3(100), "\n"
print "N = 100, Number of instructions :: ", fun4(100), "\n"
print "N = 100, Number of instructions :: ", fun5(100), "\n"
print "N = 100, Number of instructions :: ", fun6(100), "\n"
print "N = 100, Number of instructions :: ", fun7(100), "\n"
print "N = 100, Number of instructions :: ", fun8(100), "\n"
print "N = 100, Number of instructions :: ", fun9(100), "\n"
print "N = 100, Number of instructions :: ", fun10(100), "\n"
print "N = 100, Number of instructions :: ", fun11(100), "\n"
print "N = 100, Number of instructions :: ", fun12(100), "\n"
print "N = 100, Number of instructions :: ", fun13(100), "\n"

"""
N = 100, Number of instructions :: 100
N = 100, Number of instructions :: 10000
N = 100, Number of instructions :: 1000000
N = 100, Number of instructions :: 166650
N = 100, Number of instructions :: 4950
N = 100, Number of instructions :: 4950
N = 100, Number of instructions :: 197
N = 100, Number of instructions :: 134
N = 100, Number of instructions :: 7
N = 100, Number of instructions :: 7
N = 100, Number of instructions :: 20000
N = 100, Number of instructions :: 1000
N = 100, Number of instructions :: 100
"""