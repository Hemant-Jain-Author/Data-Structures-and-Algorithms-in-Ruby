class Stack
    attr_accessor :que1,:que2,:size

    def initialize()
        self.que1 = Queue.new()
        self.que2 = Queue.new()
        self.size = 0
    end
    
    def push( value)
        self.que1.push(value)
        self.size += 1
    end
    
    def pop()
        value = 0
        s = self.size
        while (s > 0)
            value = self.que1.pop()
            if (s > 1)
                self.que2.push(value)
            end
            s -= 1
        end
        temp = self.que1
        self.que1 = self.que2
        self.que2 = temp
        self.size -= 1
        return value
    end

    def push2( value)
        self.que1.push(value)
        self.size += 1
    end

    def pop2()
        value = 0
        s = self.size
        while (s > 0)
            value = self.que1.pop()
            if (s > 1)
                self.que1.push(value)
            end
            s -= 1
        end
        self.size -= 1
        return value
    end
end

stk = Stack.new()
stk.push(1)
stk.push(2)
stk.push(3)
print("Stack pop : " + stk.pop().to_s,"\n")
print("Stack pop : " + stk.pop().to_s,"\n")