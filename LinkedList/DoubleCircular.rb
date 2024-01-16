class DoublyCircularLinkedList
    # Define the accessor of class DoublyCircularLinkedList
    attr_accessor :head,:tail,:size

    class Node
        # Define the accessor of class Node
        attr_accessor :value,:next,:prev
        
        def initialize( v,  nxt,  prv)
            self.value = v
            self.next = nxt
            self.prev = prv
        end
    end


    def initialize()
        self.head = nil
        self.tail = nil
        self.size = 0
    end

    def count()
        return self.size
    end

    def isEmpty()
        return self.size == 0
    end

    # Other methods
end
    def peekHead()
        if (self.isEmpty())
            throw  raise StandardError, "EmptyListException"
        end
        return self.head.value
    end

def addHead( value)
    newNode = Node.new(value, nil, nil)
    if (self.size == 0)
        self.tail = self.head = newNode
        newNode.next = newNode
        newNode.prev = newNode
    else
        newNode.next = self.head
        newNode.prev = self.head.prev
        self.head.prev = newNode
        newNode.prev.next = newNode
        self.head = newNode
    end
    self.size += 1
end

def addTail( value)
    newNode = Node.new(value, nil, nil)
    if (self.size == 0)
        self.head = self.tail = newNode
        newNode.next = newNode
        newNode.prev = newNode
    else
        newNode.next = self.tail.next
        newNode.prev = self.tail
        self.tail.next = newNode
        newNode.next.prev = newNode
        self.tail = newNode
    end
    self.size += 1
end

def removeHead()
    if (self.size == 0)
        throw  raise StandardError, "EmptyListException"
    end
    value = self.head.value
    self.size -= 1
    if (self.size == 0)
        self.head = nil
        self.tail = nil
        return value
    end
    nxt = self.head.next
    nxt.prev = self.tail
    self.tail.next = nxt
    self.head = nxt
    return value
end

def removeTail()
    if (self.size == 0)
        throw  raise StandardError, "EmptyListException"
    end
    value = self.tail.value
    self.size -= 1
    if (self.size == 0)
        self.head = nil
        self.tail = nil
        return value
    end
    prev = self.tail.prev
    prev.next = self.head
    self.head.prev = prev
    self.tail = prev
    return value
end

def search( key)
    temp = self.head
    if (self.head == nil)
        return false
    end
    loop do
        if (temp.value == key)
            return true
        end
        temp = temp.next
        if(!(temp != self.head))
            break
        end
    end
    return false
end

def deleteList()
    self.head = nil
    self.tail = nil
    self.size = 0
end

def display()
    if (self.isEmpty())
        print("Empty List.","\n")
        return
    end
    temp = self.head
    while (temp != self.tail)
        print(temp.value.to_s + " ")
        temp = temp.next
    end
    print(temp.value,"\n")
end

def self.main1()
ll = DoublyCircularLinkedList.new()
ll.addHead(1)
ll.addHead(2)
ll.addHead(3)
ll.display()
print(ll.count(),"\n")
print(ll.isEmpty(),"\n")
    print(ll.peekHead(),"\n")
    print(ll.search(3),"\n")
end
# 3 2 1
# 3
# false
# 3
# true

def self.main2()
ll = DoublyCircularLinkedList.new()
ll.addTail(1)
ll.addTail(2)
ll.addTail(3)
ll.display()
ll.removeHead()
ll.display()
ll.removeTail()
ll.display()
    ll.deleteList()
    ll.display()
end
# 1 2 3
# 2 3
# 2
# Empty List.

def self.main3()
    ll = DoublyCircularLinkedList.new()
    ll.addHead(1)
    ll.addHead(2)
    ll.addHead(3)
    ll.display()
    ll.removeHead()
    ll.display()
end
# 3 2 1
# 2 1

def self.main4()
    ll = DoublyCircularLinkedList.new()
    ll.addHead(1)
    ll.addHead(2)
    ll.addHead(3)
    ll.display()
    ll.removeTail()
    ll.display()
end
# 3 2 1
# 3 2

def self.main()
    self.main1()
    self.main2()
    self.main3()
    self.main4()
end
end
DoublyCircularLinkedList.main()