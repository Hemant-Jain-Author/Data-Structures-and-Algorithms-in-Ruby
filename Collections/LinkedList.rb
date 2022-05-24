class List
    class Node
        attr_accessor :value, :next
        def initialize(v, n = nil)
            @value = v
            @next = n
        end
    end

    attr_accessor :head
    def initialize()
        @head = nil
    end
end
