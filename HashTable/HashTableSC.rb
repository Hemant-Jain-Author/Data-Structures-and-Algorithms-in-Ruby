class HashTableSC
  class Node
    attr_accessor :value, :next
    def initialize(v, n = nil)
      @value = v
      @next = n
    end
  end #double pointer

  attr_accessor :tableSize, :listArray

  def initialize(tSize = 512)
    @tableSize = tSize
    @listArray = Array.new(tSize + 1, nil)
  end

  # Other methods.

  def ComputeHash(key) #division method
    return key % @tableSize
  end

  def resolverFun(i)
    return i
  end

  def resolverFun2(i)
    return i * i
  end

  def insert(value)
    index = self.ComputeHash(value)
    @listArray[index] = Node.new(value, @listArray[index])
  end

  def delete(value)
    index = self.ComputeHash(value)
    head = @listArray[index]
    if head != nil and head.value == value then
      @listArray[index] = head.next
      return true
    end
    while head != nil
      nextNode = head.next
      if nextNode != nil and nextNode.value == value then
        head.next = nextNode.next
        return true
      else
        head = nextNode
      end
    end
    return false
  end

  def display()
    i = 0
    while i < tableSize
      print "Printing for index value :: " + i + "List of value printing :: "
      head = @listArray[i]
      while head != nil
        print head.value
        head = head.next
      end
      i += 1
    end
  end

  def find(value)
    index = self.ComputeHash(value)
    head = @listArray[index]
    while head != nil
      if head.value == value then
        return true
      end
      head = head.next
    end
    return false
  end
end

# Testing code
ht = HashTableSC.new()
ht.insert(100)
print "\n search 100 :: " , ht.find(100)
print "\n remove 100 :: " , ht.delete(100)
print "\n search 100 :: " , ht.find(100)
print "\n remove 100 :: " , ht.delete(100)
