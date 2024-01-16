class AVLTree
    # Define the accessor of class AVLTree
    attr_accessor :root

    class Node
        # Define the accessor of class Node
        attr_accessor :data,:left,:right,:height

        def initialize( d,  l,  r)
            self.data = d
            self.left = l
            self.right = r
            self.height = 0
        end
    end

    def initialize()
        self.root = nil
    end

    def height( n)
        if (n == nil)
            return -1
        end
        return n.height
    end

    def getBalance( node)
        return (node == nil) ? 0 : self.height(node.left) - self.height(node.right)
    end

    def printTree()
        self.printTreeUtil(self.root, "", false)
        print("\n")
    end

    def printTreeUtil( node,  indent,  isLeft)
        if (node == nil)
            return
        end
        if (isLeft)
            print(indent + "L:")
            indent += "|  "
        else
            print(indent + "R:")
            indent += "   "
        end
        print(node.data.to_s + "(" + node.height.to_s + ")","\n")
        self.printTreeUtil(node.left, indent, true)
        self.printTreeUtil(node.right, indent, false)
    end

    def insert( data)
        self.root = self.insertUtil(self.root, data)
    end

    def insertUtil( node,  data)
        if (node == nil)
            return Node.new(data, nil, nil)
        end

        if (node.data > data)
            node.left = self.insertUtil(node.left, data)
        elsif (node.data < data)
            node.right = self.insertUtil(node.right, data)
        else
            return node # Duplicate data not allowed
        end

        node.height = self.max(self.height(node.left), self.height(node.right)) + 1
        balance = self.getBalance(node)

        if (balance > 1)
            if (data < node.left.data) # Left Left Case
                return self.rightRotate(node)
            end
            if (data > node.left.data) # Left Right Case
                return self.leftRightRotate(node)
            end
        end

        if (balance < -1)
            if (data > node.right.data) # Right Right Case
                return self.leftRotate(node)
            end
            if (data < node.right.data) # Right Left Case
                return self.rightLeftRotate(node)
            end
        end
        return node
    end

    # Function to right rotate subtree rooted with x
    def rightRotate( x)
        y = x.left
        t = y.right
        # Rotation
        y.right = x
        x.left = t
        # Update heights
        x.height = self.max(self.height(x.left), self.height(x.right)) + 1
        y.height = self.max(self.height(y.left), self.height(y.right)) + 1
        # Return new root
        return y
    end

    # Function to left rotate subtree rooted with x
    def leftRotate( x)
        y = x.right
        t = y.left
        # Rotation
        y.left = x
        x.right = t
        # Update heights
        x.height = self.max(self.height(x.left), self.height(x.right)) + 1
        y.height = self.max(self.height(y.left), self.height(y.right)) + 1
        # Return new root
        return y
    end

    # Function to right then left rotate subtree rooted with x
    def rightLeftRotate( x)
        x.right = self.rightRotate(x.right)
        return self.leftRotate(x)
    end

    # Function to left then right rotate subtree rooted with x
    def leftRightRotate( x)
        x.left = self.leftRotate(x.left)
        return self.rightRotate(x)
    end

    def delete( data)
        self.root = self.deleteUtil(self.root, data)
    end

    def deleteUtil( node,  data)
        if (node == nil)
            return nil
        end
        if (node.data == data)
            if (node.left == nil && node.right == nil)
                return nil
            elsif (node.left == nil)
                return node.right
            elsif (node.right == nil)
                return node.left
            else
                minNode = self.findMin(node.right)
                node.data = minNode.data
                node.right = self.deleteUtil(node.right, minNode.data)
            end
        else
            if (node.data > data)
                node.left = self.deleteUtil(node.left, data)
            else
                node.right = self.deleteUtil(node.right, data)
            end
        end
        node.height = self.max(self.height(node.left), self.height(node.right)) + 1
        balance = self.getBalance(node)
        if (balance > 1)
            if (data >= node.left.data) # Left Left Case
                return self.rightRotate(node)
            end
            if (data < node.left.data) # Left Right Case
                return self.leftRightRotate(node)
            end
        end
        if (balance < -1)
            if (data <= node.right.data) # Right Right Case
                return self.leftRotate(node)
            end
            if (data > node.right.data) # Right Left Case
                return self.rightLeftRotate(node)
            end
        end
        return node
    end

    def findMin( curr)
        node = curr
        if (node == nil)
            return nil
        end
        while (node.left != nil)
            node = node.left
        end
        return node
    end

    def max( a,  b)
        return (a > b) ? a : b
    end
end


t = AVLTree.new()
t.insert(1)
t.insert(2)
t.insert(3)
t.insert(4)
t.insert(5)
t.insert(6)
t.insert(7)
t.insert(8)
t.printTree()

=begin 
R:4(3)
   L:2(1)
   |  L:1(0)
   |  R:3(0)
   R:6(2)
      L:5(0)
      R:7(1)
         R:8(0) 
=end

t.delete(5)
t.printTree()

=begin 
R:4(2)
   L:2(1)
   |  L:1(0)
   |  R:3(0)
   R:7(1)
      L:6(0)
      R:8(0) 
=end

t.delete(1)
t.printTree()

=begin 
R:4(2)
   L:2(1)
   |  R:3(0)
   R:7(1)
      L:6(0)
      R:8(0)
=end

t.delete(2)
t.printTree()

=begin 
R:4(2)
   L:3(0)
   R:7(1)
      L:6(0)
      R:8(0)
=end