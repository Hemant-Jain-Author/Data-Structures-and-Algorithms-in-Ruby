class DoublyLinkedList
    # Define the accessor and reader of class DoublyLinkedList
    attr_accessor :head,:tail,:size
    class Node
        # Define the accessor and reader of class Node
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

    # Other methods
    def count()
        return self.size
    end
    def isEmpty()
        return self.size == 0
    end
    def display()
        temp = self.head
        while (temp != nil)
            print(temp.value.to_s + " ")
            temp = temp.next
        end
        print("","\n")
    end
    def peek()
        if (self.isEmpty())
            throw  raise StandardError, "EmptyListException"
        end
        return self.head.value
    end
    def addHead( value)
        newNode = Node.new(value, nil, nil)
        if (self.size == 0)
            self.tail = self.head = newNode
        else
            self.head.prev = newNode
            newNode.next = self.head
            self.head = newNode
        end
        self.size += 1
    end
    def addTail( value)
        newNode = Node.new(value, nil, nil)
        if (self.size == 0)
            self.head = self.tail = newNode
        else
            newNode.prev = self.tail
            self.tail.next = newNode
            self.tail = newNode
        end
        self.size += 1
    end
    def removeHead()
        if (self.isEmpty())
            throw  raise StandardError, "EmptyListException"
        end
        value = self.head.value
        self.head = self.head.next
        if (self.head == nil)
            self.tail = nil
        else
            self.head.prev = nil
        end
        self.size -= 1
        return value
    end
    def removeNode( key)
        curr = self.head
        if (curr == nil)
            # empty list
            return false
        end
        if (curr.value == key)
            # head is the node with value key.
            self.head = self.head.next
            self.size -= 1
            if (self.head != nil)
                self.head.prev = nil
            else
                self.tail = nil
            end
            # only one element in list.
            return true
        end
        while (curr.next != nil)
            if (curr.next.value == key)
                curr.next = curr.next.next
                if (curr.next == nil)
                    # last element case.
                    self.tail = curr
                else
                    curr.next.prev = curr
                end
                self.size -= 1
                return true
            end
            curr = curr.next
        end
        return false
    end
    def search( key)
        temp = self.head
        while (temp != nil)
            if (temp.value == key)
                return true
            end
            temp = temp.next
        end
        return false
    end
    def deleteList()
        self.head = nil
        self.tail = nil
        self.size = 0
    end
    # Sorted insert increasing
    def sortedInsert( value)
        temp = Node.new(value, nil, nil)
        curr = self.head
        if (curr == nil)
            # first element
            self.head = temp
            self.tail = temp
            return
        end
        if (self.head.value > value)
            # at the beginning
            temp.next = self.head
            self.head.prev = temp
            self.head = temp
            return
        end
        while (curr.next != nil && curr.next.value < value)
            # traversal
            curr = curr.next
        end
        if (curr.next == nil)
            # at the end
            self.tail = temp
            temp.prev = curr
            curr.next = temp
        else
            # / all other
            temp.next = curr.next
            temp.prev = curr
            curr.next = temp
            temp.next.prev = temp
        end
    end
    # 	 * Reverse a doubly linked List iteratively
    def reverseList()
        curr = self.head
        while (curr != nil)
            tempNode = curr.next
            curr.next = curr.prev
            curr.prev = tempNode
            if (curr.prev == nil)
                self.tail = self.head
                self.head = curr
                return
            end
            curr = curr.prev
        end
        return
    end
    def removeDuplicate()
        curr = self.head
        while (curr != nil)
            if ((curr.next != nil) && curr.value == curr.next.value)
                curr.next = curr.next.next
                if (curr.next != nil)
                    curr.next.prev = curr
                else
                    self.tail = curr
                end
            else
                curr = curr.next
            end
        end
    end
    def copyListReversed()
        dll = DoublyLinkedList.new()
        curr = self.head
        while (curr != nil)
            dll.addHead(curr.value)
            curr = curr.next
        end
        return dll
    end
    def copyList()
        dll = DoublyLinkedList.new()
        curr = self.head
        while (curr != nil)
            dll.addTail(curr.value)
            curr = curr.next
        end
        return dll
    end
    # Testing code.
    def self.main1()
        ll = DoublyLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        print("size : " + ll.count().to_s,"\n")
        print("isEmpty : " + ll.isEmpty().to_s,"\n")
        ll.removeHead()
        ll.display()
        print(ll.search(2),"\n")
    end
    # 3 2 1 
    # size : 3
    # isEmpty : false
    # 2 1 
    # true
    def self.main2()
        ll = DoublyLinkedList.new()
        ll.sortedInsert(1)
        ll.sortedInsert(2)
        ll.sortedInsert(3)
        ll.display()
        ll.sortedInsert(1)
        ll.sortedInsert(2)
        ll.sortedInsert(3)
        ll.display()
        ll.removeDuplicate()
        ll.display()
    end
    # 	1 2 3 
    # 	1 1 2 2 3 3 
    # 	1 2 3
    def self.main3()
        ll = DoublyLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        l2 = ll.copyList()
        l2.display()
        l3 = ll.copyListReversed()
        l3.display()
    end
    # 	3 2 1 
    # 	3 2 1 
    # 	1 2 3
    def self.main4()
        ll = DoublyLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        ll.removeNode(2)
        ll.display()
    end
    # 	3 2 1 
    # 	3 1
    def self.main5()
        ll = DoublyLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        ll.reverseList()
        ll.display()
    end
    # 	3 2 1
    # 	1 2 3
    def self.main()
        self.main1()
        self.main2()
        self.main3()
        self.main4()
        self.main5()
    end
end
DoublyLinkedList.main()