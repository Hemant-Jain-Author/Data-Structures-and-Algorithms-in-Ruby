class LinkedList
    # Define the accessor of class LinkedList
    attr_accessor :head,:size

    class Node
        # Define the accessor of class Node
        attr_accessor :value,:next

        def initialize( v,  n)
            self.value = v
            self.next = n
        end
    end

    def initialize()
        self.head = nil
        self.size = 0
    end

    def count()
        return self.size
    end

    def isEmpty()
        return self.size == 0
    end

    # Other Methods.

    def peek()
        if (self.isEmpty())
            throw  raise StandardError, "EmptyListException"
        end
        return self.head.value
    end
    
    def addHead( value)
        self.head = Node.new(value, self.head)
        self.size += 1
    end

    def addTail( value)
        newNode = Node.new(value, nil)
        curr = self.head
        if (self.head == nil)
            self.head = newNode
        end
        while (curr.next != nil)
            curr = curr.next
        end
        curr.next = newNode
    end

    def removeHead() 
        if (self.isEmpty())
            throw  raise StandardError, "EmptyListException"
        end
        value = self.head.value
        self.head = self.head.next
        self.size -= 1
        return value
    end

    def search( data)
        temp = self.head
        while (temp != nil)
            if (temp.value == data)
                return true
            end
            temp = temp.next
        end
        return false
    end

    def deleteNode( delValue)
        temp = self.head
        if (self.isEmpty())
            return false
        end
        if (delValue == self.head.value)
            self.head = self.head.next
            self.size -= 1
            return true
        end
        while (temp.next != nil)
            if (temp.next.value == delValue)
                temp.next = temp.next.next
                self.size -= 1
                return true
            end
            temp = temp.next
        end
        return false
    end

    def deleteNodes( delValue)
        currNode = self.head
        found = false
        while (currNode != nil && currNode.value == delValue)
            # first node 
            self.head = currNode.next
            currNode = self.head
            found = true
        end
        while (currNode != nil)
            nextNode = currNode.next
            if (nextNode != nil && nextNode.value == delValue)
                currNode.next = nextNode.next
                found = true
            else
                currNode = nextNode
            end
        end
        return found
    end

    def reverseRecurseUtil( currentNode,  nextNode)
        if (currentNode == nil)
            return nil
        end
        if (currentNode.next == nil)
            currentNode.next = nextNode
            return currentNode
        end
        ret = self.reverseRecurseUtil(currentNode.next, currentNode)
        currentNode.next = nextNode
        return ret
    end

    def reverseRecurse()
        self.head = self.reverseRecurseUtil(self.head, nil)
    end

    def reverse()
        curr = self.head
        prev = nil
        nxt = nil
        while (curr != nil)
            nxt = curr.next
            curr.next = prev
            prev = curr
            curr = nxt
        end
        self.head = prev
    end

    def copyListReversed()
        tempNode = nil
        tempNode2 = nil
        curr = self.head
        while (curr != nil)
            tempNode2 = Node.new(curr.value, tempNode)
            curr = curr.next
            tempNode = tempNode2
        end
        ll2 = LinkedList.new()
        ll2.head = tempNode
        return ll2
    end

    def copyList()
        headNode = nil
        tailNode = nil
        tempNode = nil
        curr = self.head
        if (curr == nil)
            return nil
        end
        headNode = Node.new(curr.value, nil)
        tailNode = headNode
        curr = curr.next
        while (curr != nil)
            tempNode = Node.new(curr.value, nil)
            tailNode.next = tempNode
            tailNode = tempNode
            curr = curr.next
        end
        ll2 = LinkedList.new()
        ll2.head = headNode
        return ll2
    end

    def compareList( ll)
        return self.compareListUtil(self.head, ll.head)
    end

    def compareListUtil( head1,  head2)
        if (head1 == nil && head2 == nil)
            return true
        elsif ((head1 == nil) || (head2 == nil) || (head1.value != head2.value))
            return false
        else
            return self.compareListUtil(head1.next, head2.next)
        end
    end

    def compareList2( ll2)
        head1 = self.head
        head2 = ll2.head
        while (head1 != nil && head2 != nil)
            if (head1.value != head2.value)
                return false
            end
            head1 = head1.next
            head2 = head2.next
        end
        if (head1 == nil && head2 == nil)
            return true
        end
        return false
    end

    def findLength()
        curr = self.head
        count = 0
        while (curr != nil)
            count += 1
            curr = curr.next
        end
        return count
    end

    def nthNodeFromBeginning( index)
        if (index > self.size() || index < 1)
            return (2**(0.size*8-2))
        end
        count = 0
        curr = self.head
        while (curr != nil && count < index - 1)
            count += 1
            curr = curr.next
        end
        return curr.value
    end

    def nthNodeFromEnd( index)
        size = self.findLength()
        if (size != 0 && size < index)
            return (2**(0.size*8-2))
        end
        startIndex = size - index + 1
        return self.nthNodeFromBeginning(startIndex)
    end

    def nthNodeFromEnd2( index)
        count = 1
        forward = self.head
        curr = self.head
        while (forward != nil && count <= index)
            count += 1
            forward = forward.next
        end
        if (forward == nil)
            return (2**(0.size*8-2))
        end
        while (forward != nil)
            forward = forward.next
            curr = curr.next
        end
        return curr.value
    end

    def findIntersection( lst2)
        head2 = lst2.head
        l1 = 0
        l2 = 0
        tempHead = self.head
        tempHead2 = head2
        while (tempHead != nil)
            l1 += 1
            tempHead = tempHead.next
        end
        while (tempHead2 != nil)
            l2 += 1
            tempHead2 = tempHead2.next
        end
        tempHead = self.head
        tempHead2 = head2
        if (l1 < l2)
            temp = tempHead
            tempHead = tempHead2
            tempHead2 = temp
            diff = l2 - l1
        else
            diff = l1 - l2
        end
        while (diff > 0)
            tempHead = tempHead.next
            diff -= 1
        end
        while (tempHead != tempHead2)
            tempHead = tempHead.next
            tempHead2 = tempHead2.next
        end
        return tempHead
    end

    def deleteList()
        self.head = nil
        self.size = 0
    end

    def display()
        temp = self.head
        while (temp != nil)
            print(temp.value.to_s + " ")
            temp = temp.next
        end
        print("\n")
    end

    def sortedInsert( value)
        newNode = Node.new(value, nil)
        curr = self.head
        if (curr == nil || curr.value > value)
            newNode.next = self.head
            self.head = newNode
            return
        end
        while (curr.next != nil && curr.next.value < value)
            curr = curr.next
        end
        newNode.next = curr.next
        curr.next = newNode
    end

    def bubbleSort()
        ed = nil
        if (self.head == nil || self.head.next == nil)
            return
        end
        flag = true
        while (flag)
            flag = false
            curr = self.head
            while (curr.next != ed)
                if (curr.value > curr.next.value)
                    flag = true
                    temp = curr.value
                    curr.value = curr.next.value
                    curr.next.value = temp
                end
                curr = curr.next
            end
            ed = curr
        end
    end

    def selectionSort()
        ed = nil
        if (self.head == nil || self.head.next == nil)
            return
        end
        while (self.head != ed)
            curr = self.head
            max = curr.value
            maxNode = curr
            while (curr.next != ed)
                if (max < curr.next.value)
                    maxNode = curr.next
                    max = curr.next.value
                end
                curr = curr.next
            end
            ed = curr
            if (curr.value < max)
                temp = curr.value
                curr.value = max
                maxNode.value = temp
            end
        end
    end

    def insertionSort()
        if (self.head == nil || self.head.next == nil)
            return
        end
        stop = self.head.next
        while (stop != nil)
            curr = self.head
            while (curr != stop)
                if (curr.value > stop.value)
                    temp = curr.value
                    curr.value = stop.value
                    stop.value = temp
                end
                curr = curr.next
            end
            stop = stop.next
        end
    end

    def removeDuplicate()
        curr = self.head
        while (curr != nil)
            if (curr.next != nil && curr.value == curr.next.value)
                curr.next = curr.next.next
            else
                curr = curr.next
            end
        end
    end

    def makeLoop()
        temp = self.head
        while (temp != nil)
            if (temp.next == nil)
                temp.next = self.head
                return
            end
            temp = temp.next
        end
    end

    def loopDetect()
        curr = self.head
        hs =  []
        while (curr != nil)
            if (hs.include?(curr))
                print("loop found","\n")
                return true
            end
            hs.push(curr)
            curr = curr.next
        end
        print("loop not found","\n")
        return false
    end

    def loopDetect2()
        slowPtr = fastPtr = self.head
        while (fastPtr.next != nil && fastPtr.next.next != nil)
            slowPtr = slowPtr.next
            fastPtr = fastPtr.next.next
            if (slowPtr == fastPtr)
                print("loop found","\n")
                return true
            end
        end
        print("loop not found","\n")
        return false
    end

    def reverseListLoopDetect()
        tempHead = self.head
        self.reverse()
        if (tempHead == self.head)
            self.reverse()
            print("loop found","\n")
            return true
        else
            self.reverse()
            print("loop not found","\n")
            return false
        end
    end

    def loopTypeDetect()
        slowPtr = fastPtr = self.head
        while (fastPtr.next != nil && fastPtr.next.next != nil)
            if (self.head == fastPtr.next || self.head == fastPtr.next.next)
                print("circular list loop found","\n")
                return 2
            end
            slowPtr = slowPtr.next
            fastPtr = fastPtr.next.next
            if (slowPtr == fastPtr)
                print("loop found","\n")
                return 1
            end
        end
        print("loop not found","\n")
        return 0
    end

    def loopPointDetect()
        slowPtr = fastPtr = self.head
        while (fastPtr.next != nil && fastPtr.next.next != nil)
            slowPtr = slowPtr.next
            fastPtr = fastPtr.next.next
            if (slowPtr == fastPtr)
                return slowPtr
            end
        end
        return nil
    end

    def removeLoop()
        loopPoint = self.loopPointDetect()
        if (loopPoint == nil)
            return
        end
        firstPtr = self.head
        if (loopPoint == self.head)
            while (firstPtr.next != self.head) 
                firstPtr = firstPtr.next
            end
            firstPtr.next = nil
            return
        end
        secondPtr = loopPoint
        while (firstPtr.next != secondPtr.next)
            firstPtr = firstPtr.next
            secondPtr = secondPtr.next
        end
        secondPtr.next = nil
    end

    def self.main1()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        print("Size : " + ll.count().to_s,"\n")
        print("Size : " + ll.findLength().to_s,"\n")
        print("Is empty : " + ll.isEmpty().to_s,"\n")
        print("Peek : " + ll.peek().to_s,"\n")
        ll.addTail(4)
        ll.display()
    end
    # 3 2 1 
    # Size : 3
    # Size : 3
    # Is empty : false
    # Peek : 3
    # 3 2 1 4

    def self.main2()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        print("search : " + ll.search(2).to_s,"\n")
        ll.removeHead()
        ll.display()
    end
    # 3 2 1 
    # search : true
    # 2 1

    def self.main3()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(1)
        ll.addHead(3)
        ll.display()
        print("deleteNode : " + ll.deleteNode(2).to_s,"\n")
        ll.display()
        print("deleteNodes : " + ll.deleteNodes(1).to_s,"\n")
        ll.display()
    end
    # 3 1 2 1 2 1 
    # deleteNode : true
    # 3 1 1 2 1 
    # deleteNodes : true
    # 3 2

    def self.main4()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        ll.reverse()
        ll.display()
        ll.reverseRecurse()
        ll.display()
        l2 = ll.copyList()
        l2.display()
        l3 = ll.copyListReversed()
        l3.display()
    end
    # 3 2 1 
    # 1 2 3 
    # 3 2 1 
    # 3 2 1 
    # 1 2 3

    def self.main5()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        l2 = ll.copyList()
        l2.display()
        l3 = ll.copyListReversed()
        l3.display()
        print("compareList : " + ll.compareList(l2).to_s,"\n")
        print("compareList : " + ll.compareList2(l2).to_s,"\n")
        print("compareList : " + ll.compareList(l3).to_s,"\n")
        print("compareList : " + ll.compareList2(l3).to_s,"\n")
    end
    # 3 2 1 
    # 3 2 1 
    # 1 2 3 
    # compareList : true
    # compareList : true
    # compareList : false
    # compareList : false

    def self.main6()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.addHead(4)
        ll.display()
        print(ll.nthNodeFromBeginning(2),"\n")
        print(ll.nthNodeFromEnd(2),"\n")
        print(ll.nthNodeFromEnd2(2),"\n")
    end
    # 3 2 1 
    # 2
    # 2
    # 2

    def self.main7()
        ll = LinkedList.new()
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
    # 1 2 3 
    # 1 1 2 2 3 3 
    # 1 2 3

    def self.main8()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll.addHead(3)
        ll.display()
        ll.makeLoop()
        ll.loopDetect()
        ll.loopDetect2()
        ll.loopTypeDetect()
        ll.removeLoop()
        ll.loopDetect2()
    end
    # 3 2 1 
    # loop found
    # circular list loop found
    # loop not found

    def self.main9()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(2)
        ll2 = LinkedList.new()
        ll2.addHead(3)
        ll2.head.next = ll.head
        ll.addHead(4)
        ll2.addHead(5)
        ll.display()
        ll2.display()
        nd = ll.findIntersection(ll2)
        if (nd != nil)
            print("Intersection:: " + nd.value.to_s,"\n")
        end
    end
    # 4 2 1 
    # 5 3 2 1 
    # Intersection:: 2
    
    def self.main10()
        ll = LinkedList.new()
        ll.addHead(1)
        ll.addHead(10)
        ll.addHead(9)
        ll.addHead(7)
        ll.addHead(2)
        ll.addHead(3)
        ll.addHead(5)
        ll.addHead(4)
        ll.addHead(6)
        ll.addHead(8)
        ll.display()
        # ll.bubbleSort();
        # ll.selectionSort();
        ll.insertionSort()
        ll.display()
    end

    def self.main()
        self.main1()
        self.main2()
        self.main3()
        self.main4()
        self.main5()
        self.main6()
        self.main7()
        self.main8()
        self.main9()
        self.main10()
    end
end
LinkedList.main()