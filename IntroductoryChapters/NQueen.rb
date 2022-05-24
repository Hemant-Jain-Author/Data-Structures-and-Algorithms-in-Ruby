def isPrime(n)
    answer = (n > 1) ? true : false
    i = 2
    while i * i <= n
        if n % i == 0 then
            answer = true
            break
        end
        i += 1
    end
    return answer
end

def printQueens(queen, n)
    i = 0
    while i < n
        print " " , queen[i]
        i += 1
    end
    puts ""
end

def Feasible(queen, k)
    i = 0
    while i < k
        if queen[k] == queen[i] or    (queen[i] - queen[k]).abs == (i - k).abs then
            return false
        end
        i += 1
    end
    return true
end

def NQueens(queen, k, n)
    if k == n then
        printQueens(queen, n)
        return
    end
    i = 0
    while i < n
        queen[k] = i
        if Feasible(queen, k) then
            NQueens(queen, k + 1, n)
        end
        i += 1
    end
end

def TOHUtil(num, from, to, temp)
    if num < 1 then
        return
    end
    TOHUtil(num - 1, from, temp, to)
    print "Move disk " , num , " from peg " , from , " to peg " , to, "\n"
    TOHUtil(num - 1, temp, to, from)
end

def TowersOfHanoi(num)
    print "The sequence of moves involved in the Tower of Hanoi are : \n"
    TOHUtil(num, 'A', 'C', 'B')
end

queen = Array.new(8)
NQueens(queen, 0, 8)
TowersOfHanoi(3)