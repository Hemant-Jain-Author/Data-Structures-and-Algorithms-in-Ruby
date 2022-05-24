class Set
    attr_accessor :hm
    def initialize()
        self.hm = {}
    end

    def add(key)
            self.hm[key] = 1
    end

    def delete(key)
                self.hm.delete(key)
    end

    def has(key)
        return self.hm.key?(key)
    end

    def size()
        return self.hm.size
    end

    def display()
        self.hm.each do |key, value|
            puts key
        end
    end

end

# Testing Code
hs = Set.new()
hs.add("Banana")
hs.add("Apple")
hs.add("Mango")

#traverse
hs.display()

print "Apple present : " , hs.has("Apple"), "\n"
print "Grapes present : " , hs.has("Grapes"), "\n"
hs.delete("Apple")
print "Apple present : " , hs.has("Apple"), "\n"

"""
Banana
Apple
Mango
Apple present : true
Grapes present : false
Apple present : false
"""