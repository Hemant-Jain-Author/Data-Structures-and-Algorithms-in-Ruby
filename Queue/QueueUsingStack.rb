class QueueUsingStack
  def initialize()
    @stk1 = []
    @stk2 = []
  end

  def add(value)
    @stk1.push(value)
  end

  def remove()
    if @stk2.size != 0 then
      return @stk2.pop()
    end
    while @stk1.size != 0
      value = @stk1.pop()
      @stk2.push(value)
    end
    return @stk2.pop()
  end
end

# Testing code
que = QueueUsingStack.new()
que.add(1)
puts que.remove()
que.add(2)
que.add(21)
que.add(211)
puts que.remove()
puts que.remove()
puts que.remove()
puts que.remove()
puts que.remove()
