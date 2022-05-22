class HashTableLP
    # Define the accessor and reader of class HashTableLP
    attr_accessor :EMPTY_VALUE,:DELETED_VALUE,:FILLED_VALUE,:tableSize,:Key,:Value,:Flag
    
	def initialize( tSize)
		self.EMPTY_VALUE = 0
		self.DELETED_VALUE = 1
		self.FILLED_VALUE = 2
        self.tableSize = tSize
        self.Key = Array.new(tSize + 1){0}
        self.Value = Array.new(tSize + 1){0}
        self.Flag = Array.new(tSize + 1){self.EMPTY_VALUE}
    end

    # Other Methods
    def computeHash( key)
        return key % self.tableSize
    end

    def resolverFun( index)
        return index
    end

    def resolverFun2( index)
        return index * index
    end

    def add( key,  value)
        hashValue = self.computeHash(key)
        i = 0
        while (i < self.tableSize)
            if (self.Flag[hashValue] == self.EMPTY_VALUE || self.Flag[hashValue] == self.DELETED_VALUE)
                self.Key[hashValue] = key
                self.Value[hashValue] = value
                self.Flag[hashValue] = self.FILLED_VALUE
                return true
            end
            hashValue += self.resolverFun(i)
            hashValue %= self.tableSize
            i += 1
        end
        return false
    end

    def add2( value)
        return self.add(value, value)
    end

    def find( key)
        hashValue = self.computeHash(key)
        i = 0
        while (i < self.tableSize)
            if (self.Flag[hashValue] == self.EMPTY_VALUE)
                return false
            end
            if (self.Flag[hashValue] == self.FILLED_VALUE && self.Key[hashValue] == key)
                return true
            end
            hashValue += self.resolverFun(i)
            hashValue %= self.tableSize
            i += 1
        end
        return false
    end

    def get( key)
        hashValue = self.computeHash(key)
        i = 0
        while (i < self.tableSize)
            if (self.Flag[hashValue] == self.EMPTY_VALUE)
                return -1
            end
            if (self.Flag[hashValue] == self.FILLED_VALUE && self.Key[hashValue] == key)
                return self.Value[hashValue]
            end
            hashValue += self.resolverFun(i)
            hashValue %= self.tableSize
            i += 1
        end
        return -1
    end

    def remove( key)
        hashValue = self.computeHash(key)
        i = 0
        while (i < self.tableSize)
            if (self.Flag[hashValue] == self.EMPTY_VALUE)
                return false
            end
            if (self.Flag[hashValue] == self.FILLED_VALUE && self.Key[hashValue] == key)
                self.Flag[hashValue] = self.DELETED_VALUE
                return true
            end
            hashValue += self.resolverFun(i)
            hashValue %= self.tableSize
            i += 1
        end
        return false
    end

    def printHash()
        print("Hash Table contains ::")
        i = 0
        while (i < self.tableSize)
            if (self.Flag[i] == self.FILLED_VALUE)
                print("(" + self.Key[i].to_s + "=>" + self.Value[i].to_s + ") ")
            end
            i += 1
        end
        print("\n")
    end
end

ht = HashTableLP.new(1000)
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
