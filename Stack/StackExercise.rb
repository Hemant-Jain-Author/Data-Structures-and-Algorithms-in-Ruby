def function2()
    print("fun2 line 1","\n")
end

def function1()
    print("fun1 line 1","\n")
    function2()
    print("fun1 line 2","\n")
end

# Testing code
def main1()
    print("main line 1","\n")
    function1()
    print("main line 2","\n")
end
# main line 1
# fun1 line 1
# fun2 line 1
# fun1 line 2
# main line 2

def isBalancedParenthesis( expn)
    stk = []
    for ch in expn.chars do
    if (ch=='{' || ch=='[' || ch=='(')
    stk.push(ch)
    elsif(ch=='}')
    if (stk.pop() != '{'.ord)
            return false
        end
    elsif(ch==']')
    if (stk.pop() != '['.ord)
            return false
        end
    elsif(ch==')')
    if (stk.pop() != '('.ord)
            return false
        end
    end
    end
    return (stk.length == 0)
end

def main2()
    expn = "{()}[]"
    value = isBalancedParenthesis(expn)
    print("isBalancedParenthesis: " + value.to_s,"\n")
end
# isBalancedParenthesis: true


def postfixEvaluate(expn)
  stk = []
  expn.split(" ").each  do |token|
    if "+-*/".include?(token) then
      num1 = stk.pop()
      num2 = stk.pop()
      case token
      when "+"
        stk.push(num1 + num2)
      when "-"
        stk.push(num1 - num2)
      when "*"
        stk.push(num1 * num2)
      when "/"
        stk.push(num1 / num2)
      end
    else
      stk.push(token.to_i)
    end
  end
  return stk.pop()
end

def main3()
    expn = "6 5 2 3 + 8 * + 3 + *"
    value = postfixEvaluate(expn)
    print("Result after Evaluation: " + value.to_s,"\n")
end
# Result after Evaluation: 288

def precedence(x)
  if x == '(' then
    return (0)
  end
  if x == '+' or x == '-' then
    return (1)
  end
  if x == '*' or x == '/' or x == '%' then
    return (2)
  end
  if x == '^' then
    return (3)
  end
  return (4)
end

def infixToPostfix(expIn)
  expn = expIn.split("")
  return infixToPostfixUtil(expn)
end

def infixToPostfixUtil(expn)
  stk = []
  output = ""
  expn.each  do |ch|
    if ch <= '9' and ch >= '0' then
      output = output + ch
    else
      case ch
      when '+', '-', '*', '/', '%', '^'
        while stk.size != 0 and precedence(ch) <= precedence(stk[stk.size - 1])
          temp = stk.pop()
          output = output + " " + temp
        end
        stk.push(ch)
        output = output + " "
      when '('
        stk.push(ch)
      when ')'
        while stk.size != 0 and (temp = stk.pop()) != '('
          output = output + " " + temp + " "
        end
      end
    end
  end
  while stk.size != 0
    temp = stk.pop()
    output = output + temp + " "
  end
  return output
end

def main4()
    expn = "10+((3))*5/(16-4)"
    value = infixToPostfix(expn)
    print("Infix Expn: " + expn,"\n")
    print("Postfix Expn: " + value,"\n")
end
# Infix Expn: 10+((3))*5/(16-4)
# Postfix Expn: 10 3 5 * 16 4 - / +

def infixToPrefix(expn)
  arr = expn.split("")
  reverseString(arr)
  replaceParenthesis(arr)
  arr = infixToPostfixUtil(arr)
  reverseString(arr)
  return arr
end

def replaceParenthesis( a)
    lower = 0
    upper = a.length - 1
    while (lower <= upper)
        if (a[lower] == '(')
            a[lower] = ')'
        elsif (a[lower] == ')')
            a[lower] = '('
        end
        lower += 1
    end
end

def reverseString( expn)
    lower = 0
    upper = expn.length - 1
    while (lower < upper)
        tempChar = expn[lower]
        expn[lower] = expn[upper]
        expn[upper] = tempChar
        lower += 1
        upper -= 1
    end
end

def main5()
    expn = "10+((3))*5/(16-4)"
    value = infixToPrefix(expn)
    print("Infix Expn: " + expn,"\n")
    print("Prefix Expn: " + value,"\n")
end
# Infix Expn: 10+((3))*5/(16-4)
# Prefix Expn:  +10 * 3 / 5  - 16 4

def stockSpanRange( arr)
    _SR = Array.new(arr.length){0}
    _SR[0] = 1
    i = 1
    while (i < arr.length)
        _SR[i] = 1
        j = i - 1
        while ((j >= 0) && (arr[i] >= arr[j]))
            _SR[i] += 1
            j -= 1
        end
        i += 1
    end
    return _SR
end

def stockSpanRange2( arr)
    stk = []
    _SR = Array.new(arr.length){0}
    stk.push(0)
    _SR[0] = 1
    i = 1
    while (i < arr.length)
        while (!(stk.length == 0) && arr[stk.last] <= arr[i])
            stk.pop()
        end
        _SR[i] = ((stk.length == 0)) ? (i + 1) : (i - stk.last)
        stk.push(i)
        i += 1
    end
    return _SR
end

def main6()
    arr = [6, 5, 4, 3, 2, 4, 5, 7, 9]
    value = stockSpanRange(arr)
    print("stockSpanRange : ")
    for val in value do
      print(val.to_s + " ")
    end
    print("\n")
    value = stockSpanRange2(arr)
    print("stockSpanRange : ")
    for val in value do
      print(val.to_s + " ")
    end
    print("\n")
end
# stockSpanRange : 1 1 1 1 1 4 6 8 9 
# stockSpanRange : 1 1 1 1 1 4 6 8 9

def getMaxArea( arr)
    size = arr.length
    maxArea = -1
    minHeight = 0
    i = 1
    while (i < size)
        minHeight = arr[i]
        j = i - 1
        while (j >= 0)
            if (minHeight > arr[j])
                minHeight = arr[j]
            end
            currArea = minHeight * (i - j + 1)
            if (maxArea < currArea)
                maxArea = currArea
            end
            j -= 1
        end
        i += 1
    end
    return maxArea
end

def getMaxArea2( arr)
    size = arr.length
    stk = []
    maxArea = 0
    i = 0
    while (i < size)
        while ((i < size) && ((stk.length == 0) || arr[stk.last] <= arr[i]))
            stk.push(i)
            i += 1
        end
        while (!(stk.length == 0) && (i == size || arr[stk.last] > arr[i]))
            top = stk.last
            stk.pop()
            topArea = arr[top] * ((stk.length == 0) ? i : i - stk.last - 1)
            if (maxArea < topArea)
                maxArea = topArea
            end
        end
    end
    return maxArea
end

def main7()
    arr = [7, 6, 5, 4, 4, 1, 6, 3, 1]
    value = getMaxArea(arr)
    print("getMaxArea :: " + value.to_s,"\n")
    value = getMaxArea2(arr)
    print("getMaxArea :: " + value.to_s,"\n")
end
# getMaxArea :: 20
# getMaxArea :: 20

def stockAnalystAdd( stk,  value)
    while (!(stk.length == 0) && stk.last <= value) 
      stk.pop()
    end
    stk.push(value)
end

def main7a()
    arr = [20, 19, 10, 21, 40, 35, 39, 50, 45, 42]
    stk = []
    i = arr.length - 1
    while (i >= 0)
        stockAnalystAdd(stk, arr[i])
        i -= 1
    end
    print(stk,"\n")
end

def sortedInsert( stk,  element)
    if ((stk.length == 0) || element > stk.last)
        stk.push(element)
    else
        temp = stk.pop()
        sortedInsert(stk, element)
        stk.push(temp)
    end
end

def main8()
    stk = []
    stk.push(1)
    stk.push(3)
    stk.push(4)
    print(stk,"\n")
    sortedInsert(stk, 2)
    print(stk,"\n")
end
# [1, 3, 4]
# [1, 2, 3, 4]
def sortStack( stk)
    if ((stk.length == 0) == false)
        temp = stk.pop()
        sortStack(stk)
        sortedInsert(stk, temp)
    end
end

def sortStack2( stk)
    stk2 = []
    while ((stk.length == 0) == false)
        temp = stk.pop()
        while (((stk2.length == 0) == false) && (stk2.last < temp)) 
          stk.push(stk2.pop())
        end
        stk2.push(temp)
    end
    while ((stk2.length == 0) == false) 
      stk.push(stk2.pop())
    end
end

def main9()
    stk = []
    stk.push(3)
    stk.push(1)
    stk.push(4)
    stk.push(2)
    print(stk,"\n")
    sortStack(stk)
    print(stk,"\n")
    stk = []
    stk.push(3)
    stk.push(1)
    stk.push(4)
    stk.push(2)
    print(stk,"\n")
    sortStack2(stk)
    print(stk,"\n")
end
# [3, 1, 4, 2]
# [1, 2, 3, 4]
# [3, 1, 4, 2]
# [1, 2, 3, 4]
def bottomInsert( stk,  element)
    if ((stk.length == 0))
        stk.push(element)
    else
        temp = stk.pop()
        bottomInsert(stk, element)
        stk.push(temp)
    end
end

def main10()
    stk = []
    stk.push(1)
    stk.push(2)
    stk.push(3)
    print(stk,"\n")
    bottomInsert(stk, 4)
    print(stk,"\n")
end
# [1, 2, 3]
# [4, 1, 2, 3]
def bottomInsert( stk,  value)
    if ((stk.length == 0))
        stk.push(value)
    else
        out = stk.pop()
        bottomInsert(stk, value)
        stk.push(out)
    end
end

def reverseStack( stk)
    if ((stk.length == 0))
        return
    else
        value = stk.pop()
        reverseStack(stk)
        bottomInsert(stk, value)
    end
end

def reverseStack2( stk)
    que = Queue.new()
    while ((stk.length == 0) == false) 
      que.push(stk.pop())
    end
    while (que.empty? == false) 
      stk.push(que.pop())
    end
end

def reverseKElementInStack( stk,  k)
    que = Queue.new()
    i = 0
    while ((stk.length == 0) == false && i < k)
        que.push(stk.pop())
        i += 1
    end
    while (que.empty? == false) 
      stk.push(que.pop())
    end
end

def reverseQueue( que)
    stk = []
    while (que.empty? == false) 
      stk.push(que.pop())
    end
    while ((stk.length == 0) == false) 
      que.push(stk.pop())
    end
end

def reverseKElementInQueue( que,  k)
    stk = []
    i = 0
    while (que.empty? == false && i < k)
        stk.push(que.pop())
        i += 1
    end
    while ((stk.length == 0) == false)
        que.push(stk.pop())
    end
    diff = que.size() - k
    while (diff > 0)
        temp = que.pop()
        que.push(temp)
        diff -= 1
    end
end

def main11()
    stk = []
    stk.push(1)
    stk.push(2)
    stk.push(3)
    print(stk,"\n")
end
# [1, 2, 3]
def main12()
    stk = []
    stk.push(1)
    stk.push(2)
    stk.push(3)
    stk.push(4)
    print(stk,"\n")
    reverseStack(stk)
    print(stk,"\n")
    reverseStack2(stk)
    print(stk,"\n")
    reverseKElementInStack(stk, 2)
    print(stk,"\n")
    print("\n")
end
# [1, 2, 3, 4]
# [4, 3, 2, 1]
# [1, 2, 3, 4]
# [1, 2, 4, 3]

def main13()
    que = Queue.new()
    que.push(1)
    que.push(2)
    que.push(3)
    reverseQueue(que)
    print(que.pop(),"\n")
    que = Queue.new()
    que.push(1)
    que.push(2)
    que.push(3)
    reverseKElementInQueue(que, 2)
    print(que.pop(),"\n")
end

# 3
# 2

def maxDepthParenthesis( expn,  size)
    stk = []
    maxDepth = 0
    depth = 0
    i = 0
    while (i < size)
        ch = expn[i]
        if (ch == '(')
            stk.push(ch)
            depth += 1
        elsif (ch == ')')
            stk.pop()
            depth -= 1
        end
        if (depth > maxDepth)
            maxDepth = depth
        end
        i += 1
    end
    return maxDepth
end

def maxDepthParenthesis2( expn,  size)
    maxDepth = 0
    depth = 0
    i = 0
    while (i < size)
        ch = expn[i]
        if (ch == '(')
            depth += 1
        elsif (ch == ')')
            depth -= 1
        end
        if (depth > maxDepth)
            maxDepth = depth
        end
        i += 1
    end
    return maxDepth
end

def main14()
    expn = "((((A)))((((BBB()))))()()()())"
    size = expn.length
    print("Max depth parenthesis is " + maxDepthParenthesis(expn, size).to_s,"\n")
    print("Max depth parenthesis is " + maxDepthParenthesis2(expn, size).to_s,"\n")
end
# Max depth parenthesis is 6
# Max depth parenthesis is 6

def longestContBalParen( string,  size)
    stk = []
    stk.push(-1)
    length = 0
    i = 0
    while (i < size)
        if (string[i] == '(')
            stk.push(i)
        else
            stk.pop()
            if (stk.length != 0)
                length = [length,i - stk.last].max
            else
                stk.push(i)
            end
        end
        i += 1
    end
    return length
end

def longestContBalParen2( string,  size)
    stk = []
    length = 0
    i = 0
    while (i < size)
        if (string[i] == '(')
            stk.push(i)
        else
            # string[i] == ')'
            if (stk.length != 0)
                length = [length,i - stk.last + 1].max
                stk.pop()
            end
        end
        i += 1
    end
    return length
end

def main15()
    expn = "())((()))(())()(()"
    size = expn.length
    print("longestContBalParen " + longestContBalParen(expn, size).to_s,"\n")
    print("longestContBalParen " + longestContBalParen2(expn, size).to_s,"\n")
end
# longestContBalParen 12

def reverseParenthesis( expn,  size)
    stk = []
    openCount = 0
    closeCount = 0
    if (size % 2 == 1)
        print("Invalid odd length " + size.to_s,"\n")
        return -1
    end
    i = 0
    while (i < size)
        ch = expn[i]
        if (ch == '(')
            stk.push(ch)
        elsif (ch == ')')
            if (stk.length != 0 && stk.last == '('.ord)
                stk.pop()
            else
                stk.push(')')
            end
        end
        i += 1
    end
    while (stk.length != 0)
        if (stk.pop() == '('.ord)
            openCount += 1
        else
            closeCount += 1
        end
    end
    reversal = (openCount / 2.0).ceil.to_i + (closeCount / 2.0).ceil.to_i
    return reversal
end

def main16()
    expn2 = ")(())((("
    size = expn2.length
    value = reverseParenthesis(expn2, size)
    print("reverse Parenthesis is : " + value.to_s,"\n")
end
# reverse Parenthesis is : 3
def findDuplicateParenthesis( expn,  size)
    stk = []
    i = 0
    while (i < size)
        ch = expn[i]
        if (ch == ')')
            count = 0
            while (stk.length != 0 && stk.last != '('.ord)
                stk.pop()
                count += 1
            end
            if (count <= 1)
                return true
            end
        else
            stk.push(ch)
        end
        i += 1
    end
    return false
end

def main17()
    expn = "(((a+b))+c)"
    size = expn.length
    value = findDuplicateParenthesis(expn, size)
    print("Duplicate Found : " + value.to_s,"\n")
end
# Duplicate Found : true

def printParenthesisNumber( expn,  size)
    stk = []
    output = ""
    count = 1
    i = 0
    while (i < size)
        ch = expn[i]
        if (ch == '(')
            stk.push(count)
            output += count.to_s
            output += " "
            count += 1
        elsif (ch == ')')
            output += stk.pop().to_s
            output += " "
        end
        i += 1
    end
    print("Parenthesis Count :: " + output,"\n")
end

def main18()
    expn1 = "(((a+(b))+(c+d)))"
    expn2 = "(((a+b))+c)((("
    printParenthesisNumber(expn1, expn1.length)
    printParenthesisNumber(expn2, expn2.length)
end
# Parenthesis Count :: 1 2 3 4 4 3 5 5 2 1 
# Parenthesis Count :: 1 2 3 3 2 1 4 5 6

def nextLargerElement( arr,  size)
    output = Array.new(size){0}
    outIndex = 0
    i = 0
    while (i < size)
        nxt = -1
        j = i + 1
        while (j < size)
            if (arr[i] < arr[j])
                nxt = arr[j]
                break
            end
            j += 1
        end
        output[outIndex += 1] = nxt
        i += 1
    end
    for val in output do
      print(val.to_s + " ")
    end
    print("\n")
end

def nextLargerElement2( arr,  size)
    stk = []
    output = Array.new(size){0}
    index = 0
    i = 0
    while (i < size)
        curr = arr[i]
        # stack always have values in decreasing order.
        while ((stk.length == 0) == false && arr[stk.last] <= curr)
            index = stk.pop()
            output[index] = curr
        end
        stk.push(i)
        i += 1
    end
    # index which dont have any next Larger.
    while ((stk.length == 0) == false)
        index = stk.pop()
        output[index] = -1
    end
    for val in output do
      print(val.to_s + " ")
    end
    print("\n")
end

def nextSmallerElement( arr,  size)
    output = Array.new(size){-1}
    i = 0
    while (i < size)
        j = i + 1
        while (j < size)
            if (arr[j] < arr[i])
                output[i] = arr[j]
                break
            end
            j += 1
        end
        i += 1
    end
    for val in output do
      print(val.to_s + " ")
    end
    print("\n")
end

def nextSmallerElement2( arr,  size)
    stk = []
    output = Array.new(size){0}
    i = 0
    while (i < size)
        curr = arr[i]
        # stack always have values in increasing order.
        while ((stk.length == 0) == false && arr[stk.last] > curr)
            index = stk.pop()
            output[index] = curr
        end
        stk.push(i)
        i += 1
    end
    # index which dont have any next Smaller.
    while ((stk.length == 0) == false)
        index = stk.pop()
        output[index] = -1
    end
    for val in output do
      print(val.to_s + " ")
    end
    print("\n")
end

def main19()
    arr = [13, 21, 3, 6, 20, 3]
    size = arr.length
    nextLargerElement(arr, size)
    nextLargerElement2(arr, size)
    nextSmallerElement(arr, size)
    nextSmallerElement2(arr, size)
end
# 21 -1 6 20 -1 -1 
# 21 -1 6 20 -1 -1 
# 3 3 -1 3 3 -1

def nextLargerElementCircular( arr,  size)
    output = Array.new(size){-1}

    i = 0
    while (i < size)
        j = 1
        while (j < size)
            if (arr[i] < arr[(i + j) % size])
                output[i] = arr[(i + j) % size]
                break
            end
            j += 1
        end
        i += 1
    end
    for val in output do
      print(val.to_s + " ")
    end
    print("\n")
end

def nextLargerElementCircular2( arr,  size)
    stk = []
    output = Array.new(size){0}
    i = 0
    while (i < (2 * size - 1))
        curr = arr[i % size]
        # stack always have values in decreasing order.
        while ((stk.length == 0) == false && arr[stk.last] <= curr)
            index = stk.pop()
            output[index] = curr
        end
        stk.push(i % size)
        i += 1
    end
    # index which dont have any next Larger.
    while ((stk.length == 0) == false)
        index = stk.pop()
        output[index] = -1
    end
    for val in output do
      print(val.to_s + " ")
    end
    print("\n")
end

def main20()
    arr = [6, 3, 9, 8, 10, 2, 1, 15, 7]
    nextLargerElementCircular(arr, arr.length)
    nextLargerElementCircular2(arr, arr.length)
end
# 9 9 10 10 15 15 15 -1 9

def isKnown( relation,  a,  b)
    if (relation[a][b] == 1)
        return true
    end
    return false
end

def findCelebrity( relation,  count)
    cel = true
    i = 0
    while (i < count)
        cel = true
        j = 0
        while (j < count)
            if (i != j && (!isKnown(relation, j, i) || isKnown(relation, i, j)))
                cel = false
                break
            end
            j += 1
        end
        if (cel == true)
            return i
        end
        i += 1
    end
    return -1
end

def findCelebrity2( relation,  count)
    stk = []
    first = 0
    second = 0
    i = 0
    while (i < count)
        stk.push(i)
        i += 1
    end
    first = stk.pop()
    while (stk.length != 0)
        second = stk.pop()
        if (isKnown(relation, first, second))
            first = second
        end
    end
    i = 0
    while (i < count)
        if (first != i && isKnown(relation, first, i))
            return -1
        end
        if (first != i && isKnown(relation, i, first) == false)
            return -1
        end
        i += 1
    end
    return first
end

def findCelebrity3( relation,  count)
    first = 0
    second = 1
    i = 0
    while (i < (count - 1))
        if (isKnown(relation, first, second))
            first = second
        end
        second = second + 1
        i += 1
    end
    i = 0
    while (i < count)
        if (first != i && isKnown(relation, first, i))
            return -1
        end
        if (first != i && isKnown(relation, i, first) == false)
            return -1
        end
        i += 1
    end
    return first
end

def main21()
    arr = [
    [1, 0, 1, 1, 0],
    [1, 0, 0, 1, 0],
    [0, 0, 1, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 1, 0, 1, 1]]
    print("Celebrity : " + findCelebrity3(arr, 5).to_s,"\n")
    print("Celebrity : " + findCelebrity(arr, 5).to_s,"\n")
    print("Celebrity : " + findCelebrity2(arr, 5).to_s,"\n")
end
# Celebrity : 3
# Celebrity : 3

def isMinHeap( arr,  size)
    i = 0
    while (i <= (size - 2) / 2)
        if (2 * i + 1 < size)
            if (arr[i] > arr[2 * i + 1])
                return 0
            end
        end
        if (2 * i + 2 < size)
            if (arr[i] > arr[2 * i + 2])
                return 0
            end
        end
        i += 1
    end
    return 1
end

def isMaxHeap( arr,  size)
    i = 0
    while (i <= (size - 2) / 2)
        if (2 * i + 1 < size)
            if (arr[i] < arr[2 * i + 1])
                return 0
            end
        end
        if (2 * i + 2 < size)
            if (arr[i] < arr[2 * i + 2])
                return 0
            end
        end
        i += 1
    end
    return 1
end

main1()
main2()
#main3()
main4()
main5()
main6()
main7()
main7a()
main8()
main9()
main10()
main11()
main12()
main13()
main14()
main15()
main16()
main17()
main18()
main19()
main20()
main21()
