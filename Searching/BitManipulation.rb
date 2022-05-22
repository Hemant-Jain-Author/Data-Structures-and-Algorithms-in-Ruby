def andEx( a,  b)
    return a & b
end

def orEx( a,  b)
    return a | b
end

def xorEx( a,  b)
    return a ^ b
end

def leftShiftEx( a)
    return a << 1 # multiply by 2
end

def rightShiftEx( a)
    return a >> 1 # divide by 2
end

def bitReversalEx( a)
    return ~a
end

def twoComplementEx( a)
    return -a
end

def kthBitCheck( a,  k)
    return (a & 1 << (k - 1)) > 0
end

def kthBitSet( a,  k)
    return (a | 1 << (k - 1))
end

def kthBitReset( a,  k)
    return (a & ~(1 << (k - 1)))
end

def kthBitToggle( a,  k)
    return (a ^ (1 << (k - 1)))
end

def rightMostBit( a)
    return a & -a
end

def resetRightMostBit( a)
    return a & (a - 1)
end

def isPowerOf2( a)
    if ((a & (a - 1)) == 0)
        return true
    else
        return false
    end
end

def countBits( a)
    count = 0
    while (a > 0)
        count += 1
        a = a & (a - 1)
    end
    return count
end


a = 4
b = 8
print(andEx(a, b),"\n")
print(orEx(a, b),"\n")
print(xorEx(a, b),"\n")
print(leftShiftEx(a),"\n") # multiply by 2
print(rightShiftEx(a),"\n") # divide by 2
print(bitReversalEx(a),"\n")
print(twoComplementEx(a),"\n")
print(kthBitCheck(a, 3),"\n")
print(kthBitSet(a, 2),"\n")
print(kthBitReset(a, 3),"\n")
print(kthBitToggle(a, 3),"\n")
print(rightMostBit(a),"\n")
print(resetRightMostBit(a),"\n")
print(isPowerOf2(a),"\n")
i = 0
while (i < 10)
    print(i.to_s + " bit count : " + countBits(i).to_s,"\n")
    i += 1
end
