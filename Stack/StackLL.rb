class ListStack
  attr_accessor :head, :count
  def initialize()
    @head = nil
    @count = 0
  end

  class Node
    attr_accessor :value, :next
    def initialize(v, n = nil)
      @value = v
      @next = n
    end
  end

  def size()
    return @count
  end

  def empty
    return @count == 0
  end

  def peek()
    if self.empty then
      raise StandardError, "ListStackEmptyException"
    end
    return @head.value
  end

  def push(value)
    @head = Node.new(value, @head)
    @count += 1
  end

  def pop()
    if self.empty then
      raise StandardError, "ListStackEmptyException"
    end
    value = @head.value
    @head = @head.next
    @count -= 1
    return value
  end

  def insertAtBottom(value)
    if self.Empty then
      self.Push(value)
    else
      temp = self.Pop()
      self.insertAtBottom(value)
      self.Push(temp)
    end
  end

  def display()
    temp = @head
    while temp != nil
      print temp.value , " "
      temp = temp.next
    end
  end
end

# Testing code
s = ListStack.new()
s.push(1)
s.push(2)
s.push(3)
print s.pop()
print s.pop()

