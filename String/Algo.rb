def bruteForceSearch(text, pattern)
    i = 0
    j = 0
    n = text.length
    m = pattern.length
    while (i <= n - m)
        j = 0
        while (j < m && pattern[j] == text[i + j])
            j += 1
        end
        if (j == m)
            return (i)
        end
        i += 1
    end
    return -1
end

def robinKarp(text, pattern)
    n = text.length
    m = pattern.length
    prime = 101
    powm = 1
    textHash = 0
    patternHash = 0
    if m == 0 || m > n
        return -1
    end
    i = 0
    while i < m - 1
        powm = (powm << 1) % prime
        i += 1
    end
    i = 0
    while i < m
        patternHash = ((patternHash << 1) + pattern[i].ord) % prime
        textHash = ((textHash << 1) + text[i].ord) % prime
        i += 1
    end
    i = 0
    while i <= (n - m)
        if textHash == patternHash
            j = 0
            while j < m
                if text[i + j] != pattern[j]
                    break
                end
                j += 1
            end
            if j == m
                return i
            end
        end
        if (i < n - m)
            textHash = (((textHash - text[i].ord * powm) << 1) + text[i + m].ord) % prime
        end
        if (textHash < 0)
            textHash = (textHash + prime)
        end
        i += 1
    end
    return -1
end

def KMPPreprocess(pattern, shiftArr)
    m = pattern.length
    i = 0
    j = -1
    shiftArr[i] = -1
    while i < m
        while j >= 0 && pattern[i] != pattern[j]
            j = shiftArr[j]
        end
        i += 1
        j += 1
        shiftArr[i] = j
    end
end

def KMP(text, pattern)
    i = 0
    j = 0
    n = text.length
    m = pattern.length
    shiftArr = Array.new(m + 1){0}
    KMPPreprocess(pattern, shiftArr)
    while i < n
        while j >= 0 && text[i] != pattern[j] 
            j = shiftArr[j]
        end
        i += 1
        j += 1
        if j == m
            return (i - m)
        end
    end
    return -1
end

def KMPFindCount( text,  pattern)
    i = 0
    j = 0
    count = 0
    n = text.length
    m = pattern.length
    shiftArr = Array.new(m + 1){0}
    KMPPreprocess(pattern, shiftArr)
    while i < n
        while j >= 0 && text[i] != pattern[j]
            j = shiftArr[j]
        end
        i += 1
        j += 1
        if j == m
            count += 1
            j = shiftArr[j]
        end
    end
    return count
end

st1 = "hello, world!"
st2 = "world"
print("BruteForceSearch return : " + bruteForceSearch(st1, st2).to_s,"\n")
print("RobinKarp return : " + robinKarp(st1, st2).to_s,"\n")
print("KMP return : " + KMP(st1, st2).to_s,"\n")
str3 = "Only time will tell if we stand the test of time"
print("Frequency of \'time\' is: " + KMPFindCount(str3, "time").to_s,"\n")
