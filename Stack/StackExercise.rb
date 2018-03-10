def isBalancedParenthesis(expn)
  stk = []
  expn.split("").each  do |ch|
    case ch
    when '{', '[', '('
      stk.push(ch)
    when '}'
      if stk.pop() != '{' then
        return false
      end
    when ']'
      if stk.pop() != '[' then
        return false
      end
    when ')'
      if stk.pop() != '(' then
        return false
      end
    end
  end
  return stk.size == 0
end

# Testing code
expn = "{()}[]"
value = isBalancedParenthesis(expn)
puts "Given Expn: #{expn}"
puts "Result after isParenthesisMatched: #{value}"

def insertAtBottom(stk, value)
  if stk.size == 0 then
    stk.push(value)
  else
    popvalue = stk.pop()
    insertAtBottom(stk, value)
    stk.push(popvalue)
  end
end

def reverseStack(stk)
  if stk.size == 0 then
    return
  else
    value = stk.pop()
    reverseStack(stk)
    insertAtBottom(stk, value)
  end
end

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

# Testing code
expn = "6 5 2 3 + 8 * + 3 + *"
value = postfixEvaluate(expn)
puts "Given Postfix Expn: #{expn}"
puts "Result after Evaluation: #{value}"

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

# Testing code
expn = "10+((3))*5/(16-4)"
value = infixToPostfix(expn)
puts "Infix Expn: #{expn}"
puts "Postfix Expn: #{value}"

def infixToPrefix(expn)
  arr = expn.split("")
  reverseString(arr)
  replaceParanthesis(arr)
  arr = infixToPostfixUtil(arr)
  reverseString(arr)
  return arr
end

def replaceParanthesis(a)
  lower = 0
  upper = a.size - 1
  while lower <= upper
    if a[lower] == '(' then
      a[lower] = ')'
    elsif a[lower] == ')' then
      a[lower] = '('
    end
    lower += 1
  end
end

def reverseString(expn)
  lower = 0
  upper = expn.size - 1
  while lower < upper
    tempChar = expn[lower]
    expn[lower] = expn[upper]
    expn[upper] = tempChar
    lower += 1
    upper -= 1
  end
end

# Testing code
expn = "10+((3))*5/(16-4)"
value = infixToPrefix(expn)
puts "Infix Expn: #{expn}"
puts "Prefix Expn: #{value}"

def StockSpanRange(arr)
  sr = Array.new(arr.size)
  sr[0] = 1
  i = 1
  while i < arr.size
    sr[i] = 1
    j = i - 1
    while (j >= 0) and (arr[i] > arr[j])
      sr[i] += 1
      j -= 1
    end
    i += 1
  end
  return sr
end

def StockSpanRange2(arr)
  stk = []
  sr = Array.new(arr.size)
  stk.push(0)
  sr[0] = 1
  i = 1
  while i < arr.size
    while stk.size != 0 and arr[stk[stk.length() - 1]] < arr[i]
      stk.pop()
    end
    sr[i] = (stk.size == 0) ? (i + 1) : (i - stk[stk.length() - 1])
    stk.push(i)
    i += 1
  end
  return sr
end

# Testing code
arr = [8, 6, 5, 3, 2, 4, 6, 8, 9]
value = StockSpanRange(arr)
print "StockSpanRange: " , value
value = StockSpanRange2(arr)
print "StockSpanRange: " , value

def GetMaxArea(arr)
  size = arr.size
  maxArea = -1
  minHeight = 0
  i = 1
  while i < size
    minHeight = arr[i]
    j = i - 1
    while j >= 0
      if minHeight > arr[j] then
        minHeight = arr[j]
      end
      currArea = minHeight * (i - j + 1)
      if maxArea < currArea then
        maxArea = currArea
      end
      j -= 1
    end
    i += 1
  end
  return maxArea
end

# Testing code
def GetMaxArea2(arr)
  size = arr.size
  stk = []
  maxArea = 0
  i = 0
  while i < size
    while (i < size) and (stk.size == 0 or arr[stk[stk.length() - 1]] <= arr[i])
      stk.push(i)
      i += 1
    end
    while stk.size != 0 and (i == size or arr[stk[stk.length() - 1]] > arr[i])
      top = stk.pop()
      topArea = arr[top] * (stk.size == 0 ? i : i - stk[stk.length() - 1] - 1)
      if maxArea < topArea then
        maxArea = topArea
      end
    end
  end
  return maxArea
end
# Testing code
arr = [7, 6, 5, 4, 4, 1, 6, 3, 2]
value = GetMaxArea(arr)
print "GetMaxArea: " , value
value = GetMaxArea2(arr)
print "GetMaxArea: " , value

# Testing code