class Stack
  def initialize(capacity=1000)
    @capacity = capacity
    @top = -1
    @data = Array.new(@capacity,0)
  end

  def size()
    return (@top + 1)
  end

  def empty
    return (@top == -1)
  end

  def push(value)
    if self.size() == @data.size then
      raise StandardError, "StackOvarflowException"
    end
    @top += 1
    @data[@top] = value
  end

  def peek()
    if self.empty then
      raise StandardError, "StackEmptyException"
    end
    return @data[@top]
  end

  def pop()
    if self.empty then
      raise StandardError, "StackEmptyException"
    end
    topVal = @data[@top]
    @top -= 1
    return topVal
  end

  def display()
    i = @top
    while i > -1
      print " " , @data[i]
      i -= 1
    end
    puts ""
  end
end

# Testing code
s = Stack.new(1000)
s.push(1)
s.push(2)
s.push(3) 
print s.pop()


