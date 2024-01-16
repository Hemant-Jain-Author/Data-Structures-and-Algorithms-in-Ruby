class Stack
    attr_accessor :stk

    def initialize()
        self.stk = []
    end
    # Other methods


def size()
    return self.stk.size
end

def empty
    return self.stk.size == 0
end

def push(value)
    self.stk.push(value)
end

def top()
    self.stk[stk.size -1]
end

def pop()
    self.stk.pop()
end

def display()
    print self.stk, "\n"
end
end

# Testing code
s = Stack.new()
s.push(1)
s.push(2)
s.push(3) 
s.display
p s.pop()
s.display

=begin 
[1, 2, 3]
3
[1, 2]
=end