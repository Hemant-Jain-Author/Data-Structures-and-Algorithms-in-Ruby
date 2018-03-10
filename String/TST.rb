class TST
  def initialize()
  end

  class Node
    attr_accessor :data, :isLastChar, :left, :equal, :right
    def initialize(d)
      @data = d
      @isLastChar = false
      @left = @equal = @right = nil
    end
  end

  def insert(word)
    @root = self.insertUtil(@root, word, 0)
  end

  def insertUtil(curr, word, wordIndex)
    if curr == nil 
      curr = Node.new(word[wordIndex])
    end
    if word[wordIndex] < curr.data 
      curr.left = self.insertUtil(curr.left, word, wordIndex)
    elsif word[wordIndex] > curr.data 
      curr.right = self.insertUtil(curr.right, word, wordIndex)
    else
      if wordIndex < word.size - 1 
        curr.equal = self.insertUtil(curr.equal, word, wordIndex + 1)
      else
        curr.isLastChar = true
      end
    end
    return curr
  end

  def find(curr, word, wordIndex)
    if curr == nil 
      return false
    end
    if word[wordIndex] < curr.data 
      return self.find(curr.left, word, wordIndex)
    elsif word[wordIndex] > curr.data 
      return self.find(curr.right, word, wordIndex)
    else
      if wordIndex == word.size - 1 
        return curr.isLastChar
      end
      return self.find(curr.equal, word, wordIndex + 1)
    end
  end

  def findWrapper(word)
    ret = self.find(@root, word, 0)
    print (word + " :: ")
    if ret 
      print " Found \n"
    else
      print "Not Found \n"
    end
    return ret
  end
end

# Testing code
tt = TST.new()
tt.insert("banana")
tt.insert("apple")
tt.insert("mango")
tt.findWrapper("apple")
tt.findWrapper("banana")
tt.findWrapper("mango")
tt.findWrapper("grapes")
