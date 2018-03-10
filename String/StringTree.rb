class StringTree
  class Node
    attr_accessor :value, :count, :lChild, :rChild
    def initialize(v, left = nil, right = nil)
      @value = v
      @count = 1
      @lChild = left
      @rChild = right
    end
  end

  attr_accessor :root
  def initialize()
    @root = nil
  end

  def printTree(curr=@root) # pre order
    if curr != nil 
      print " value is ::" , curr.value
      print " count is :: " , curr.count
      self.printTree(curr.lChild)
      self.printTree(curr.rChild)
    end
  end

  def insert(value)
    @root=insertUtil(value, @root)
  end
  
  def insertUtil(value, curr)
    if curr == nil 
      curr = Node.new(value)
      curr.count = 1
    else
      
      compare = ( curr.value <=> value )
      if compare == 0 
        curr.count += 1
      elsif compare == 1 
        curr.lChild = self.insertUtil(value, curr.lChild)
      else
        curr.rChild = self.insertUtil(value, curr.rChild)
      end
    end
    return curr
  end

  def freeTree()
    root = nil
  end

  def find(value, curr=@root)
    if curr == nil 
      return false
    end
    compare = ( curr.value <=> value )
    if compare == 0 
      return true
    else
      if compare == 1 
        return self.find(value, curr.lChild)
      else
        return self.find(value, curr.rChild)
      end
    end
  end

  def frequency(value, curr=@root)
    if curr == nil 
      return 0
    end
    compare = ( curr.value <=> value )
    if compare == 0 
      return curr.count
    else
      if compare > 0 
        return self.frequency(value, curr.lChild)
      else
        return self.frequency(value, curr.rChild)
      end
    end
  end
end

# Testing code
tt = StringTree.new()
tt.insert("banana")
tt.insert("apple")
tt.insert("mango")
tt.insert("banana")
print ("\nSearch results for apple, banana, grapes and mango :\n")
puts tt.find("apple")
puts tt.find("banana")
puts tt.find("grapes")
puts tt.find("mango")
puts tt.find("banan")
puts tt.frequency("apple")
puts tt.frequency("banana")
puts tt.frequency("mango")


