class OuterClass
  class NestedClass
  end
end


class List
  class Node
    def initialize(value, nextp = nil)
      @value = value
      @nextp = nextp
    end
  end

  def initialize()
    @head = nil
  end
end




class Tree
  class Node
    attr_accessor :value, :lChild, :rChild
    def initialize(v, left = nil, right = nil)
      @value = v
      @lChild = left
      @rChild = right
    end
  end

  attr_accessor :root
  def initialize()
    @root = nil
  end
end