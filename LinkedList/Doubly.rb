class DoublyLinkedList
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

  def peek()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    return @head.value
  end

  def addHead(value)
    newNode = Node.new(value, nil, nil)
    if @count == 0 then
      @tail = @head = newNode
    else
      @head.prev = newNode
      newNode.next = @head
      @head = newNode
    end
    @count += 1
  end

  def addTail(value)
    newNode = Node.new(value, nil, nil)
    if @count == 0 then
      @head = @tail = newNode
    else
      newNode.prev = @tail
      @tail.next = newNode
      @tail = newNode
    end
    @count += 1
  end

  def isPresent(key)
    temp = @head
    while temp != nil
      if temp.value == key then
        return true
      end
      temp = temp.next
    end
    return false
  end



  def printList()
    temp = @head
    while temp != nil
      print temp.value , " "
      temp = temp.next
    end
    puts ""
  end
  def freeList()
    @head = nil
    @tail = nil
    @count = 0
  end
  # Reverse a doubly linked List iteratively
  def reverseList()
    curr = @head
    while curr != nil
      tempNode = curr.next
      curr.next = curr.prev
      curr.prev = tempNode
      if curr.prev == nil then
        @tail = head
        @head = curr
        return
      end
      curr = curr.prev
    end
    return
  end

  def copyListReversed()
    dll = DoublyLinkedList.new()
    curr = @head
    while curr != nil
      dll.addHead(curr.value)
      curr = curr.next
    end
    return dll
  end

  def copyList()
    dll = DoublyLinkedList.new()
    curr = @head
    while curr != nil
      dll.addTail(curr.value)
      curr = curr.next
    end
    return dll
  end

  #SORTED INSERT DECREASING
  def sortedInsert(value)
    temp = Node.new(value)
    curr = @head
    if curr == nil then #first element
      @head = temp
      @tail = temp
    end
    if @head.value <= value then #at the begining
      temp.next = @head
      @head.prev = temp
      @head = temp
    end
    while curr.next != nil and curr.next.value > value #treversal
      curr = curr.next
    end
    if curr.next == nil then #at the end
      @tail = temp
      temp.prev = curr
      curr.next = temp
    else # all other
      temp.next = curr.next
      temp.prev = curr
      curr.next = temp
      temp.next.prev = temp
    end
  end

  def removeHead()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    value = @head.value
    @head = @head.next
    if @head == nil then
      @tail = nil
    else
      @head.prev = nil
    end
    @count -= 1
    return @value
  end

  def removeNode(key)
    curr = @head
    if curr == nil then #empty list
      return false
    end
    if curr.value == key then #head is the node with value key.
      @head = @head.next
      @count -= 1
      if @head == nil then
        @tail = nil
      end # only one element in list.
      return true
    end
    while curr.next != nil
      if curr.next.value == key then
        curr.next = curr.next.next
        if curr.next == nil then #last element case.
          @tail = curr
        else
          curr.next = curr
        end
        @count -= 1
        return true
      end
      curr = curr.next
    end
    return false
  end

  # Remove Duplicate
  def removeDuplicate()
    curr = @head
    while curr != nil
      if (curr.next != nil) and curr.value == curr.next.value then
        deleteMe = curr.next
        curr.next = deleteMe.next
        curr.next.prev = curr
        if deleteMe == @tail then
          @tail = curr
        end
      else
        curr = curr.next
      end
    end
  end
end

# Testing code
ll = DoublyLinkedList.new()
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