class Stack
    attr_accessor :head, :count
    def initialize()
        self.head = nil
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

    def empty
        return self.count == 0
    end

    def peek()
        if self.empty then
            raise StandardError, "StackEmptyException"
        end
        return self.head.value
    end

    def push(value)
        self.head = Node.new(value, self.head)
        self.count += 1
    end

    def pop()
        if self.empty then
            raise StandardError, "StackEmptyException"
        end
        value = self.head.value
        self.head = self.head.next
        self.count -= 1
        return value
    end

    def display()
        temp = self.head
        while temp != nil
            print temp.value , " "
            temp = temp.next
        end
        print "\n"
    end
end

# Testing code
s = Stack.new()
s.push(1)
s.push(2)
s.push(3)
s.display
print s.pop(), " "

