class HashTable
  def initialize(tSize)
    @EMPTY_NODE = -1
    @LAZY_deleteD = -2
    @FILLED_NODE = 0
    @tableSize = tSize
    @Arr = Array.new(tSize + 1)
    @Flag = Array.new( tSize + 1)
    i = 0
    while i <= tSize
      @Flag[i] = @EMPTY_NODE
      i += 1
    end
  end
  # Other methods.

  def computeHash(key)
    return key % @tableSize
  end

  def resolverFun(index)
    return index
  end

  def insert(value)
    hashValue = self.computeHash(value)
    i = 0
    while i < @tableSize
      if @Flag[hashValue] == @EMPTY_NODE or @Flag[hashValue] == @LAZY_deleteD then
        @Arr[hashValue] = value
        @Flag[hashValue] = @FILLED_NODE
        return true
      end
      hashValue += self.resolverFun(i)
      hashValue %= @tableSize
      i += 1
    end
    return false
  end

  def find(value)
    hashValue = self.computeHash(value)
    i = 0
    while i < @tableSize
      if @Flag[hashValue] == @EMPTY_NODE then
        return false
      end
      if @Flag[hashValue] == @FILLED_NODE and @Arr[hashValue] == value then
        return true
      end
      hashValue += self.resolverFun(i)
      hashValue %= @tableSize
      i += 1
    end
    return false
  end

  def delete(value)
    hashValue = self.computeHash(value)
    i = 0
    while i < @tableSize
      if @Flag[hashValue] == @EMPTY_NODE then
        return false
      end
      if @Flag[hashValue] == @FILLED_NODE and @Arr[hashValue] == value then
        @Flag[hashValue] = @LAZY_deleteD
        return true
      end
      hashValue += self.resolverFun(i)
      hashValue %= @tableSize
      i += 1
    end
    return false
  end

  def display()
    i = 0
    while i < @tableSize
      if @Flag[i] == @FILLED_NODE then
        print "\n Node at index [" , i , " ] :: " , @Arr[i]
      end
      i += 1
    end
  end
end

# Testing code
ht = HashTable.new(1000)
ht.insert(100)
print "\n search 100 :: " , ht.find(100)
print "\n remove 100 :: " , ht.delete(100)
print "\n search 100 :: " , ht.find(100)
print "\n remove 100 :: " , ht.delete(100)