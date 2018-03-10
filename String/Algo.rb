def BruteForceSearch(text, pattern)
  i = 0
  j = 0
  n = text.size
  m = pattern.size
  while i <= n - m
    j = 0
    while j < m and pattern[j] == text[i + j]
      j += 1
    end
    if j == m
      return (i)
    end
    i += 1
  end
  return -1
end

def RobinKarp(text, pattern)
  n = text.size
  m = pattern.size
  prime = 101
  powm = 1
  textHash = 0
  patternHash = 0
  if m == 0 or m > n
    return -1
  end
  i = 0
  while i < m - 1
    powm = (powm << 1) % prime
    i += 1
  end
  i = 0
  while i < m
    patternHash = ((patternHash << 1) + pattern[i].to_i) % prime
    textHash = ((textHash << 1) + text[i].to_i) % prime
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
    textHash = (((textHash - text[i].to_i * powm) << 1) + text[i + m].to_i) % prime
    if textHash < 0
      textHash = (textHash + prime)
    end
    i += 1
  end
  return -1
end

def KMPPreprocess(pattern, shiftArr)
  m = pattern.size
  i = 0
  j = -1
  shiftArr[i] = -1
  while i < m
    while j >= 0 and pattern[i] != pattern[j]
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
  n = text.size
  m = pattern.size
  shiftArr = Array.new(m + 1)
  KMPPreprocess(pattern, shiftArr)
  while i < n
    while j >= 0 and text[i] != pattern[j]
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

def KMPFindCount(text, pattern)
  i = 0
  j = 0
  count = 0
  n = text.size
  m = pattern.size
  shiftArr = Array.CreateInstance(System::Int32, m + 1)
  self.KMPPreprocess(pattern, shiftArr)
  while i < n
    while j >= 0 and text[i] != pattern[j]
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
print "BruteForceSearch return : " , BruteForceSearch(st1, st2), "\n"
print "RobinKarp return : " , RobinKarp(st1, st2), "\n"
print "KMP return : " , KMP(st1, st2), "\n"
