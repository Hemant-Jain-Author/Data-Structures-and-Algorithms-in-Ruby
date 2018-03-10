class Trie
  class Node
    attr_accessor :child, :isLastChar
    def initialize(isLastChar = false)
      @child = Array.new(26, Node)
      i = 0
      while i < 26
        @child[i] = nil
        i += 1
      end
      @isLastChar = isLastChar
    end
  end

  #first node with dummy value.
  def Insert(str)
    if str == nil 
      return @root
    end
    @root = self.InsertUtil(@root, str.downcase(), 0)
  end

  def InsertUtil(curr, str, index)
    if curr == nil 
      curr = Node.new()
    end
    if str.size == index 
      curr.isLastChar = true
    else
      chIndex = str[index].ord() - 'a'.ord()
      curr.child[chIndex] = self.InsertUtil(curr.child[chIndex], str, index + 1)
    end
    return curr
  end

  def Remove(str)
    if str == nil 
      return
    end
    str = str.downcase()
    self.RemoveUtil(@root, str, 0)
  end

  def RemoveUtil(curr, str, index)
    if curr == nil 
      return
    end
    if str.size == index 
      if curr.isLastChar 
        curr.isLastChar = false
      end
      return
    end
    self.RemoveUtil(curr.child[str[index].ord() - 'a'.ord()], str, index + 1)
  end

  def Find(str)
    if str == nil 
      return false
    end
    str = str.downcase()
    return self.FindUtil(@root, str, 0)
  end

  def FindUtil(curr, str, index)
    if curr == nil 
      return false
    end
    if str.size == index 
      return curr.isLastChar
    end
    return self.FindUtil(curr.child[str[index].ord() - 'a'.ord()], str, index + 1)
  end
end

# Testing code
t = Trie.new()
a = "apple"
b = "app"
c = "appletree"
d = "tree"
t.Insert(a)
t.Insert(d)
puts t.Find(a)
puts t.Find(b)
puts t.Find(c)
puts t.Find(d)
