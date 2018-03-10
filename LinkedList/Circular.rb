class CircularLinkedList
  attr_accessor :tail, :count
  def initialize()
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

  #Other Methods
  def size()
    return @count
  end

  def Empty
    return @count == 0
  end

  def peek()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    return tail.next.value
  end

  def addTail(value)
    temp = Node.new(value, nil)
    if self.Empty then
      @tail = temp
      temp.next = temp
    else
      temp.next = @tail.next
      @tail.next = temp
      @tail = temp
    end
    @count += 1
  end

  def addHead(value)
    temp = Node.new(value)
    if self.Empty then
      @tail = temp
      temp.next = temp
    else
      temp.next = @tail.next
      @tail.next = temp
    end
    @count += 1
  end

  def removeHead()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    value = @tail.next.value
    if @tail == @tail.next then
      @tail = nil
    else
      @tail.next = @tail.next.next
    end
    @count -= 1
    return @value
  end

  def removeNode(key)
    if self.Empty then
      return false
    end
    prev = @tail
    curr = @tail.next
    head = @tail.next
    if curr.value == key then #head and single node case.
      if curr == curr.next then #single node case
        @tail = nil
      else # head case
        @tail.next = @tail.next.next
      end
      @count -= 1
      return true
    end
    prev = curr
    curr = curr.next
    while curr != head
      if curr.value == key then
        if curr == @tail then
          @tail = prev
        end
        prev.next = curr.next
        @count -= 1
        return true
      end
      prev = curr
      curr = curr.next
    end
    return false
  end

  def copyListReversed()
    cl = CircularLinkedList.new()
    curr = @tail.next
    head = curr
    if curr != nil then
      cl.addHead(curr.value)
      curr = curr.next
    end
    while curr != head
      cl.addHead(curr.value)
      curr = curr.next
    end
  end

  def copyList()
    cl = CircularLinkedList.new()
    curr = @tail.next
    head = curr
    if curr != nil then
      cl.addTail(curr.value)
      curr = curr.next
    end
    while curr != head
      cl.addTail(curr.value)
      curr = curr.next
    end
  end

  def isPresent(data)
    temp = @tail
    i = 0
    while i < count
      if temp.value == data then
        return true
      end
      temp = temp.next
      i += 1
    end
    return false
  end

  def freeList()
    @tail = nil
    count = 0
  end

  def printList()
    if self.Empty then
      return
    end
    temp = @tail.next
    while temp != @tail
      print temp.value , " "
      temp = temp.next
    end
    print temp.value
  end
end

ll = CircularLinkedList.new()
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.printList()
ll.removeHead()
puts ""
ll.removeNode(3)
ll.removeNode(3)
ll.printList()