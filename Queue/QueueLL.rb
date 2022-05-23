class Queue
    attr_accessor :head, :tail, :count

    def initialize()
        self.head = nil
        self.tail = nil
        self.count = 0
    end

    class Node
        attr_accessor :value, :next
        
        def initialize(v, n = nil)
            self.value = v
            self.next = n
        end
    end

    def size()
        return self.count
    end

    def empty()
        return self.count == 0
    end

    def peek()
        if self.Empty then
            raise StandardError, "QueueEmptyException"
        end
        return self.head.value
    end

    def add(value)
        temp = Node.new(value)
        if self.head == nil then
            self.head = self.tail = temp
        else
            self.tail.next = temp
            self.tail = temp
        end
        self.count += 1
    end

    def remove()
        if self.empty
            raise StandardError, "QueueEmptyException"
        end
        value = self.head.value
        self.head = self.head.next
        self.count -= 1
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
size = q.size()
i = 0
while i < size
    print "Dequeue : " , q.remove(), "\n"
    i += 1
end
