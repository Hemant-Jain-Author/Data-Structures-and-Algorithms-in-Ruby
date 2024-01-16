class HashTableSC
    # Define the accessor and reader of class HashTableSC
    attr_accessor :tableSize,:arrayList

    class Node
        # Define the accessor and reader of class Node
        attr_accessor :key,:value
        def initialize( k,  v)
            self.key = k
            self.value = v
        end
    end

    def initialize()
        self.tableSize = 512
        self.arrayList = Array.new(self.tableSize){Array.new()}
    end

    def computeHash( key) # division method
        return key % self.tableSize
    end

    def add( key,  value)
        arrIndex = self.computeHash(key)
        self.arrayList[arrIndex].append(Node.new(key, value))
    end

    def add2( value)
        self.add(value, value)
    end

    def remove(key)
        index = self.computeHash(key)
        for nd in self.arrayList[index] 
            if nd.key == key
                self.arrayList[index].delete(nd)
                return
            end
        end
    end 

    def printHash()
        print("Hash Table contains ::")
        i = 0
        while (i < self.tableSize)
            for nd in self.arrayList[i] 
                print("(" + nd.key.to_s + "=>" + nd.value.to_s + ") ")
            end
            i += 1
        end
        print("\n")
    end

    def find( key)
        index = self.computeHash(key)
        for nd in self.arrayList[index] 
            if nd.key == key
                return true
            end
        end
        return false
    end

    def get( key)
        index = self.computeHash(key)
        for nd in self.arrayList[index] 
            if nd.key == key
                return nd.value
            end
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