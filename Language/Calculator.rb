class Calculator
    def initialize(val = 0)
        @value = val
    end

    def reset()
        @value = 0
    end

    def value
        return @value
    end

    def add(data)
        @value = @value + data
    end

    def increment()
        @value += 1
    end

    def subtract(data)
        @value = @value - data
    end

    def decrement()
        @value -= 1
    end
end

# Testing code
d = Calculator.new()
puts d.value()
d2 = Calculator.new(100)
puts d2.value()
d2.increment()
puts d2.value()
