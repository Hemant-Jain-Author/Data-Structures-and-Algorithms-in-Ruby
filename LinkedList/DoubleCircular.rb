class DoublyCircularLinkedList
  
  attr_accessor :head, :tail, :count
  def initialize()
    @head = nil
    @tail = nil
    @count = 0
  end

  class Node
    attr_accessor :value, :next, :prev
    def initialize(v, n = nil, p = nil)
      @value = v
      @next = n
      @prev = p
    end
  end
  
  def size()
    return @count
  end

  def Empty
    return @count == 0
  end

  def peekHead()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    return @head.value
  end

  def addHead(value)
    newNode = Node.new(value)
    if @count == 0 then
      @tail = @head = newNode
      newNode.next = newNode
      newNode.prev = newNode
    else
      newNode.next = @head
      newNode.prev = @head.prev
      @head.prev = newNode
      newNode.prev.next = newNode
      @head = newNode
    end
    @count += 1
  end

  def addTail(value)
    newNode = Node.new(value)
    if @count == 0 then
      @head = @tail = newNode
      newNode.next = newNode
      newNode.prev = newNode
    else
      newNode.next = @tail.next
      newNode.prev = @tail
      @tail.next = newNode
      @head.prev = newNode
      @tail = newNode
    end
    @count += 1
  end

  def removeHead()
    if @count == 0 then
      raise StandardError, "EmptyListException"
    end
    value = @head.value
    @count -= 1
    if @count == 0 then
      @head = nil
      @tail = nil
      return value
    end
    nextNode = @head.next
    nextNode.prev = @tail
    @tail.next = nextNode
    @head = nextNode
    return value
  end

  def removeTail()
    if count == 0 then
      raise StandardError, "EmptyListException"
    end
    value = @tail.value
    @count -= 1
    if @count == 0 then
      @head = nil
      @tail = nil
      return value
    end
    prev = @tail.prev
    prev.next = @head
    @head.prev = prev
    @tail = prev
    return value
  end

  def isPresent(key)
    temp = @head
    if @head == nil then
      return false
    end
    begin
      if temp.value == key then
        return true
      end
      temp = temp.next
    end while temp != @head
    return false
  end

  def freeList()
    @head = nil
    @tail = nil
    @count = 0
  end

  def printList()
    if self.Empty then
      print "empty list"
      return
    end
    temp = @head
    begin
      print temp.value , " "
      temp = temp.next
    end while temp != @head
  end
end 

ll = DoublyCircularLinkedList.new()
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.addHead(4)
ll.addHead(5)
ll.addHead(6)
ll.printList()
ll.removeHead()
ll.printList()
ll.freeList()
ll.printList()
ll.addHead(11)
ll.addHead(21)
ll.printList()