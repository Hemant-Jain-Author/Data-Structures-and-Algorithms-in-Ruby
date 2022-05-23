class Queue
    attr_accessor :capacity,:front,:back,:count,:data
    def initialize(size = 100)
        self.capacity = size
        self.front = 0
        self.back = 0
        self.count = 0
        self.data = Array.new(size,0)
    end

    def add(value)
        if self.count >= self.capacity then
            raise StandardError, "QueueFullException"
        else
            self.count += 1
            self.data[self.back] = value
            self.back = (self.back += 1) % (self.capacity - 1)
        end
    end

    def remove()
        if self.count <= 0 then
            raise StandardError, "QueueEmptyException"
        else
            self.count -= 1
            value = self.data[self.front]
            self.front = (self.front += 1) % (self.capacity - 1)
        end
        return value
    end

    def empty()
        return self.count == 0
    end

    def size()
        return self.count
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
