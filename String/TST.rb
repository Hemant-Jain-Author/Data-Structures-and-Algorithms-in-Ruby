class TST
    attr_accessor :root
    def initialize()
    end

    class Node
        attr_accessor :data, :isLastChar, :left, :equal, :right
        def initialize(d)
            self.data = d
            self.isLastChar = false
            self.left = self.equal = self.right = nil
        end
    end

    def insert(word)
        self.root = self.insertUtil(self.root, word, 0)
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

    def findUtil(curr, word, wordIndex)
        if curr == nil 
            return false
        end
        if word[wordIndex] < curr.data 
            return self.findUtil(curr.left, word, wordIndex)
        elsif word[wordIndex] > curr.data 
            return self.findUtil(curr.right, word, wordIndex)
        else
            if wordIndex == word.size - 1 
                return curr.isLastChar
            end
            return self.findUtil(curr.equal, word, wordIndex + 1)
        end
    end

    def find(word)
        return self.findUtil(self.root, word, 0)
    end
end

# Testing code
tt = TST.new()
tt.insert("banana");
tt.insert("apple");
tt.insert("mango");
print("Apple Found : ", tt.find("apple"), "\n");
print("Banana Found : ", tt.find("banana"), "\n");
print("Grapes Found : ", tt.find("grapes"), "\n");
