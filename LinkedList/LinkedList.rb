class LinkedList
  attr_accessor :head, :count
  def initialize()
    @head = nil
    @count = 0
  end

  class Node
    attr_accessor :value, :next
    def initialize(v, p = nil)
      @value = v
      @next = p
    end
  end

  #Other Methods.

  def size()
    return count
  end

  def Empty
    return count == 0
  end

  #Other Methods.
  def peek()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    return head.value
  end

  def addHead(value)
    @head = Node.new(value, @head)
    @count += 1
  end

  def addTail(value)
    newNode = Node.new(value, nil)
    curr = @head
    if @head == nil then
      @head = newNode
    end
    while curr.next != nil
      curr = curr.next
    end
    curr.next = newNode
    @count += 1
  end

  def removeHead()
    if self.Empty then
      raise StandardError, "EmptyListException"
    end
    value = @head.value
    @head = @head.next
    @count -= 1
    return value
  end

  def printList()
    temp = @head
    while temp != nil
      print temp.value , " "
      temp = temp.next
    end
  end

  def sortedInsert(value)
    newNode = Node.new(value, nil)
    curr = @head
    if curr == nil or curr.value > value then
      newNode.next = head
      head = newNode
      return
    end
    while curr.next != nil and curr.next.value < value
      curr = curr.next
    end
    newNode.next = curr.next
    curr.next = newNode
  end

  def isPresent(data)
    temp = @head
    while temp != nil
      if temp.value == data then
        return true
      end
      temp = temp.next
    end
    return false
  end

  def deleteNode(delValue)
    temp = @head
    if self.Empty then
      return false
    end
    if delValue == @head.value then
      @head = @head.next
      @count -= 1
      return true
    end
    while temp.next != nil
      if temp.next.value == delValue then
        temp.next = temp.next.next
        count -= 1
        return true
      end
      temp = temp.next
    end
    return false
  end

  def deleteNodes(delValue)
    currNode = @head
    while currNode != nil and currNode.value == delValue #first node
      @head = currNode.next
      currNode = @head
    end
    while currNode != nil
      nextNode = currNode.next
      if nextNode != nil and nextNode.value == delValue then
        currNode.next = nextNode.next
      else
        currNode = nextNode
      end
    end
  end

  def freeList()
    head = nil
    count = 0
  end

  def reverse()
    curr = @head
    prev = nil
    next1 = nil
    while curr != nil
      next1 = curr.next
      curr.next = prev
      prev = curr
      curr = next1
    end
    @head = prev
  end

  def reverseRecurseUtil(currentNode, nextNode)
    if currentNode == nil then
      return nil
    end
    if currentNode.next == nil then
      currentNode.next = nextNode
      return currentNode
    end
    ret = self.reverseRecurseUtil(currentNode.next, currentNode)
    currentNode.next = nextNode
    return ret
  end

  def reverseRecurse()
    @head = self.reverseRecurseUtil(@head, nil)
  end

  def removeDuplicate()
    curr = @head
    while curr != nil
      if curr.next != nil and curr.value == curr.next.value then
        curr.next = curr.next.next
      else
        curr = curr.next
      end
    end
  end

  def copyListReversed()
    ll = LinkedList.new()
    tempNode = nil
    tempNode2 = nil
    curr = @head
    while curr != nil
      tempNode2 = Node.new(curr.value, tempNode)
      curr = curr.next
      tempNode = tempNode2
    end
    ll.head = tempNode
    return ll
  end

  def copyList()
    ll = LinkedList.new()
    headNode = nil
    tailNode = nil
    tempNode = nil
    curr = @head
    if curr == nil then
      return nil
    end
    headNode = Node.new(curr.value, nil)
    tailNode = headNode
    curr = curr.next
    while curr != nil
      tempNode = Node.new(curr.value, nil)
      tailNode.next = tempNode
      tailNode = tempNode
      curr = curr.next
    end
    ll.head = headNode
    return ll
  end

  def compareList(ll)
    return self.compareListUtil(@head, ll.head)
  end

  def compareListUtil(head1, head2)
    if head1 == nil and head2 == nil then
      return true
    elsif (head1 == nil) or (head2 == nil) or (head1.value != head2.value) then
      return false
    else
      return self.compareListUtil(head1.next, head2.next)
    end
  end

  def findLength()
    curr = @head
    count = 0
    while curr != nil
      count += 1
      curr = curr.next
    end
    return count
  end

  def nthNodeFromBegining(index)
    count = 0
    curr = @head
    while curr != nil and count < index - 1
      count += 1
      curr = curr.next
    end
    if curr == nil then
      raise StandardError, "null element"
    end
    return curr.value
  end

  def nthNodeFromEnd(index)
    size = self.findLength()
    if size != 0 and size < index then
      raise StandardError, "null element"
    end
    startIndex = size - index + 1
    return self.nthNodeFromBegining(startIndex)
  end

  def nthNodeFromEnd2(index)
    count = 0
    forward = @head
    curr = head
    while forward != nil and count < index - 1
      count += 1
      forward = forward.next
    end
    if forward == nil then
      raise StandardError, "null element"
    end
    while forward != nil
      forward = forward.next
      curr = curr.next
    end
    return curr.value
  end

  def makeLoop()
    temp = @head
    while temp != nil
      if temp.next == nil then
        temp.next = @head
        return
      end
      temp = temp.next
    end
  end

  def loopDetect()
    slowPtr = fastPtr = @head
    while fastPtr.next != nil and fastPtr.next.next != nil
      slowPtr = slowPtr.next
      fastPtr = fastPtr.next.next
      if slowPtr == fastPtr then
        puts "loop found"
        return true
      end
    end
    puts "loop not found"
    return false
  end

  def reverseListLoopDetect()
    tempHead = @head
    self.reverse()
    if tempHead == @head then
      self.reverse()
      puts "loop found"
      return true
    else
      self.reverse()
      puts "loop not found"
      return false
    end
  end

  def loopTypeDetect()
    slowPtr = fastPtr = @head
    while fastPtr.next != nil and fastPtr.next.next != nil
      if @head == fastPtr.next or head == fastPtr.next.next then
        print "circular list loop found"
        return 2
      end
      slowPtr = slowPtr.next
      fastPtr = fastPtr.next.next
      if slowPtr == fastPtr then
        print "loop found"
        return 1
      end
    end
    print "loop not found"
    return 0
  end

  def loopPointDetect()
    slowPtr = fastPtr = @head
    while fastPtr.next != nil and fastPtr.next.next != nil
      slowPtr = slowPtr.next
      fastPtr = fastPtr.next.next
      if slowPtr == fastPtr then
        return slowPtr
      end
    end
    return nil
  end

  def removeLoop()
    loopPoint = self.loopPointDetect()
    if loopPoint != nil then
      return
    end
    firstPtr = @head
    if loopPoint == @head then
      while firstPtr.next != head
        firstPtr = firstPtr.next
      end
      firstPtr.next = nil
      return
    end
    secondPtr = loopPoint
    while firstPtr.next != secondPtr.next
      firstPtr = firstPtr.next
      secondPtr = secondPtr.next
    end
    secondPtr.next = nil
  end

  def findIntersection(list2)
    l1 = 0
    l2 = 0
    tempHead = @head
    tempHead2 = list2.head
    while tempHead != nil
      l1 += 1
      tempHead = tempHead.next
    end
    while tempHead2 != nil
      l2 += 1
      tempHead2 = tempHead2.next
    end
    if l1 < 12 then
      temp = head
      head = head2
      head2 = temp
      diff = l2 - l1
    else
      diff = l1 - l2
    end
    while diff > 0
      head = head.next
      diff -= 1
    end
    while head != head2
      head = head.next
      head2 = head2.next
    end
    return head
  end
end

ll = LinkedList.new()
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll2 = LinkedList.new()
ll2.addHead(1)
ll2.addHead(2)
ll2.addHead(3)
ll.printList()
print ll.compareList(ll2)
