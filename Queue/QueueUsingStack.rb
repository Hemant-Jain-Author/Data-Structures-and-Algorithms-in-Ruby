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
que = Queue.new()
que.add(1)
que.add(2)
que.add(3)
print("isEmpty : ", que.empty(), "\n");
print("size : ", que.size(), "\n");
print("Queue remove : ", que.remove(), "\n");
print("Queue remove : ", que.remove(), "\n");
