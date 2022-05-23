class Queue
    attr_accessor :stk1, :stk2

    def initialize()
        self.stk1 = []
        self.stk2 = []
    end

    def add(value)
        self.stk1.push(value)
    end

    def remove()
        if self.stk2.size != 0 then
            return self.stk2.pop()
        end
        while self.stk1.size != 0
            value = self.stk1.pop()
            self.stk2.push(value)
        end
        return self.stk2.pop()
    end

    def size()
        return self.stk1.count + self.stk2.count
    end

    def empty()
        return (self.stk1.count + self.stk2.count) == 0
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
