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
que = Queue.new()
que.add(1)
que.add(2)
que.add(3)
print("isEmpty : ", que.empty(), "\n");
print("size : ", que.size(), "\n");
print("Queue remove : ", que.remove(), "\n");
print("Queue remove : ", que.remove(), "\n");

=begin 
isEmpty : false
size : 3
Queue remove : 1
Queue remove : 2
=end