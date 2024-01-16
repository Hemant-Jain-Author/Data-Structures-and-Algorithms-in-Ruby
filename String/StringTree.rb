class StringTree
    class Node
        attr_accessor :value, :count, :lChild, :rChild
        def initialize(v, left = nil, right = nil)
            self.value = v
            self.lChild = left
            self.rChild = right
        end
    end

    attr_accessor :root
    def initialize()
        self.root = nil
    end

    def printTree(curr = self.root) # pre order
        if curr != nil 
            print " value is ::" , curr.value
            self.printTree(curr.lChild)
            self.printTree(curr.rChild)
        end
    end

    def insert(value)
        self.root=insertUtil(value, self.root)
    end
    
    def insertUtil(value, curr)
        if curr == nil 
            return Node.new(value)
        end
            
        if curr.value < value
            curr.rChild = self.insertUtil(value, curr.rChild)
        elsif curr.value > value
            curr.lChild = self.insertUtil(value, curr.lChild)
        end

        return curr
    end

    def freeTree()
        root = nil
    end

    def find(value, curr = self.root)
        if curr == nil 
            return false
        end
        
        if curr.value == value
            return true
        elsif curr.value > value
            return self.find(value, curr.lChild)
        else
            return self.find(value, curr.rChild)
        end
        
    end
end

# Testing code
tt = StringTree.new()
tt.insert("banana");
tt.insert("apple");
tt.insert("mango");
print("Apple Found : ", tt.find("apple"), "\n");
print("Banana Found : ", tt.find("banana"), "\n");
print("Grapes Found : ", tt.find("grapes"), "\n");




