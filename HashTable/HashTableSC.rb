class HashTableSC
    # Define the accessor and reader of class HashTableSC
    attr_accessor :tableSize,:listArray

    class Node
        # Define the accessor and reader of class Node
        attr_accessor :key,:value,:next
        def initialize( k,  v,  n)
            self.key = k
            self.value = v
            self.next = n
        end
    end

    def initialize()
        self.tableSize = 512
        self.listArray = Array.new(self.tableSize){nil}
    end

    def computeHash( key)
        # division method
        hashValue = key
        return hashValue % self.tableSize
    end

    def add( key,  value)
        index = self.computeHash(key)
        self.listArray[index] = Node.new(key, value, self.listArray[index])
    end

    def add2( value)
        self.add(value, value)
    end

    def remove( key)
        index = self.computeHash(key)
        head = self.listArray[index]
        if (head != nil && head.key == key)
            self.listArray[index] = head.next
            return true
        end
        while (head != nil)
            nextNode = head.next
            if (nextNode != nil && nextNode.key == key)
                head.next = nextNode.next
                return true
            else
                head = nextNode
            end
        end
        return false
    end

    def printHash()
        print("Hash Table contains ::")
        i = 0
        while (i < self.tableSize)
            head = self.listArray[i]
            while (head != nil)
                print("(" + head.key.to_s + "=>" + head.value.to_s + ") ")
                head = head.next
            end
            i += 1
        end
        print("\n")
    end

    def find( key)
        index = self.computeHash(key)
        head = self.listArray[index]
        while (head != nil)
            if (head.key == key)
                return true
            end
            head = head.next
        end
        return false
    end

    def get( key)
        index = self.computeHash(key)
        head = self.listArray[index]
        while (head != nil)
            if (head.key == key)
                return head.value
            end
            head = head.next
        end
        return -1
    end
end

ht = HashTableSC.new()
ht.add(1, 10)
ht.add(2, 20)
ht.add(3, 30)
ht.printHash()
print("Find key 2 : " + ht.find(2).to_s,"\n")
print("Value at  key 2 : " + ht.get(2).to_s,"\n")
ht.remove(2)
print("Find key 2 : " + ht.find(2).to_s,"\n")

=begin
Hash Table contains ::(1=>10) (2=>20) (3=>30) 
Find key 2 : true
Value at  key 2 : 20
Find key 2 : false
=end