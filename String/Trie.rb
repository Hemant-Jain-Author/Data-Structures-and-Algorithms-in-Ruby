class Trie
    attr_accessor :root

    class Node
        attr_accessor :child, :isLastChar
        def initialize(isLastChar = false)
            self.child = Array.new(26){nil}
            self.isLastChar = isLastChar
        end
    end

    #first node with dummy value.
    def insert(str)
        if str == nil 
            return self.root
        end
        self.root = self.insertUtil(self.root, str.downcase(), 0)
    end

    def insertUtil(curr, str, index)
        if curr == nil 
            curr = Node.new()
        end
        if str.size == index 
            curr.isLastChar = true
        else
            chIndex = str[index].ord() - 'a'.ord()
            curr.child[chIndex] = self.insertUtil(curr.child[chIndex], str, index + 1)
        end
        return curr
    end

    def remove(str)
        if str == nil 
            return
        end
        self.removeUtil(self.root, str.downcase(), 0)
    end

    def removeUtil(curr, str, index)
        if curr == nil 
            return
        end
        if str.size == index 
            if curr.isLastChar 
                curr.isLastChar = false
            end
            return
        end
        self.removeUtil(curr.child[str[index].ord() - 'a'.ord()], str, index + 1)
    end

    def find(str)
        if str == nil 
            return false
        end
        return self.findUtil(self.root, str.downcase(), 0)
    end

    def findUtil(curr, str, index)
        if curr == nil 
            return false
        end
        if str.size == index 
            return curr.isLastChar
        end
        return self.findUtil(curr.child[str[index].ord() - 'a'.ord()], str, index + 1)
    end
end

# Testing code
tt = Trie.new()
tt.insert("banana");
tt.insert("apple");
tt.insert("mango");
print("Apple Found : ", tt.find("apple"), "\n");
print("Banana Found : ", tt.find("banana"), "\n");
print("Grapes Found : ", tt.find("grapes"), "\n");
