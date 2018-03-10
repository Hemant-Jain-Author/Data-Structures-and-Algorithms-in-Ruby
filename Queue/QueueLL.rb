class Queue
  attr_accessor :head, :tail, :count
  def initialize()
    @head = nil
    @tail = nil
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

  def Empty
    return @count == 0
  end

  def peek()
    if self.Empty then
      raise StandardError, "QueueEmptyException"
    end
    return @head.value
  end

  def add(value)
    temp = Node.new(value)
    if @head == nil then
      @head = @tail = temp
    else
      @tail.next = temp
      @tail = temp
    end
    @count += 1
  end

  def remove()
    if self.Empty then
      raise StandardError, "QueueEmptyException"
    end
    value = @head.value
    @head = @head.next
    @count -= 1
    return value
  end

  def display()
    temp = head
    while temp != nil
      print temp.value , " "
      temp = temp.next
    end
  end
end

# Testing code
q = Queue.new()
q.add(1)
q.add(2)
q.add(3)
print q.remove()
print q.remove()
