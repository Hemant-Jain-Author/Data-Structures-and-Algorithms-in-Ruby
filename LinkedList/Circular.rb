class CircularLinkedList
    # Define the accessor and reader of class CircularLinkedList
    attr_accessor :tail,:size

    class Node
        # Define the accessor and reader of class Node
        attr_accessor :value,:next
        def initialize( v,  n)
            self.value = v
            self.next = n
        end
    end

    def initialize()
        self.tail = nil
        self.size = 0
    end

    def count()
        return self.size
    end

    def isEmpty()
        return self.size == 0
    end

    def peek()
        if (self.isEmpty())
            raise StandardError, "EmptyListException"
        end
        return self.tail.next.value
    end

    # Other methods
    def addTail( value)
        temp = Node.new(value, nil)
        if (self.isEmpty())
            self.tail = temp
            temp.next = temp
        else
            temp.next = self.tail.next
            self.tail.next = temp
            self.tail = temp
        end
        self.size += 1
    end

    def addHead( value)
        temp = Node.new(value, nil)
        if (self.isEmpty())
            self.tail = temp
            temp.next = temp
        else
            temp.next = self.tail.next
            self.tail.next = temp
        end
        self.size += 1
    end

    def removeHead()
        if (self.isEmpty())
            raise StandardError, "EmptyListException"
        end
        value = self.tail.next.value
        if (self.tail == self.tail.next)
            self.tail = nil
        else
            self.tail.next = self.tail.next.next
        end
        self.size -= 1
        return value
    end

    def removeNode( key)
        if (self.isEmpty())
            return false
        end
        prev = self.tail
        curr = self.tail.next
        head = self.tail.next
        if (curr.value == key)
            # head and single node case.
            if (curr == curr.next)
                # single node case
                self.tail = nil
            else
                # head case
                self.tail.next = self.tail.next.next
            end
            return true
        end
        prev = curr
        curr = curr.next
        while (curr != head)
            if (curr.value == key)
                if (curr == self.tail)
                    self.tail = prev
                end
                prev.next = curr.next
                return true
            end
            prev = curr
            curr = curr.next
        end
        return false
    end

    def copyListReversed()
        cl = CircularLinkedList.new()
        if (self.tail == nil)
            return cl
        end
        curr = self.tail.next
        head = curr
        if (curr != nil)
            cl.addHead(curr.value)
            curr = curr.next
        end
        while (curr != head)
            cl.addHead(curr.value)
            curr = curr.next
        end
        return cl
    end

    def copyList()
        cl = CircularLinkedList.new()
        if (self.tail == nil)
            return cl
        end
        curr = self.tail.next
        head = curr
        if (curr != nil)
            cl.addTail(curr.value)
            curr = curr.next
        end
        while (curr != head)
            cl.addTail(curr.value)
            curr = curr.next
        end
        return cl
    end

    def search( data)
        temp = self.tail
        i = 0
        while (i < self.size)
            if (temp.value == data)
                return true
            end
            temp = temp.next
            i += 1
        end
        return false
    end

    def deleteList()
        self.tail = nil
        self.size = 0
    end

    def printList()
        if (self.isEmpty())
            print("Empty List.","\n")
            return
        end
        temp = self.tail.next
        while (temp != self.tail)
            print(temp.value.to_s + " ")
            temp = temp.next
        end
        print(temp.value,"\n")
    end

    def self.main1()
        ll = CircularLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.printList()
        print(ll.count(),"\n")
        print(ll.isEmpty(),"\n")
        print(ll.peek(),"\n")
        print(ll.search(3),"\n")
    end
    # 3 2 1
    # 3
    # false
    # 3
    # true
    def self.main2()
        ll = CircularLinkedList.new()
        ll.addTail(1)
        ll.addTail(2)
        ll.addTail(3)
        ll.printList()
    end
    # 1 2 3
    def self.main3()
        ll = CircularLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.printList()
        ll.removeHead()
        ll.printList()
        ll.removeNode(2)
        ll.printList()
        ll.deleteList()
        ll.printList()
    end
    # 3 2 1
    # 2 1
    # 1
    # Empty List.
    def self.main4()
        ll = CircularLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.printList()
        ll2 = ll.copyList()
        ll2.printList()
        ll3 = ll.copyListReversed()
        ll3.printList()
    end
    # 3 2 1
    # 3 2 1
    # 1 2 3
    def self.main5()
        ll = CircularLinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.printList()
        ll.removeNode(2)
        ll.printList()
    end
    # 3 2 1
    # 3 1
    def self.main()
        self.main1()
        self.main2()
        self.main3()
        self.main4()
        self.main5()
    end
end
CircularLinkedList.main()