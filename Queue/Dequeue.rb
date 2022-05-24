class Dequeue
    attr_accessor :deq

    def initialize()
        self.deq = []
    end

    def size()
        return self.deq.size
    end

    def empty
        return self.deq.size == 0
    end

    def add(value)
        self.deq.append(value)
    end

    def first()
        self.deq[0]
    end

    def last()
        self.deq[-1]
    end

    def removeFirst()
        self.deq.shift()
    end

    def removeLast()
        self.deq.pop()
    end

    def display()
        print self.deq, "\n"
    end
end

# Testing code
deq = Dequeue.new()
deq.add(1)
deq.add(2)
deq.add(3) 
deq.display
print deq.last, "\n"
print deq.first, "\n"
print deq.removeLast, "\n"
print deq.removeFirst, "\n"


