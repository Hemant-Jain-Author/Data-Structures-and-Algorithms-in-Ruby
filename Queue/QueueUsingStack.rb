class QueueUsingStack
  attr_accessor :stk1, :stk2

  def initialize()
    self.stk1 = []
    self.stk2 = []
  end

  def add(value)
    self.stk1.push(value)
  end

  def remove()
    if self.stk2.size != 0 then
      return self.stk2.pop()
    end
    while self.stk1.size != 0
      value = self.stk1.pop()
      self.stk2.push(value)
    end
    return self.stk2.pop()
  end
end

# Testing code
que = QueueUsingStack.new()
que.add(1)
que.add(2)
que.add(3)
puts que.remove()
puts que.remove()
puts que.remove()
