class SPLAYTree
    # Define the accessor of class SPLAYTree
    attr_accessor :root

    class Node
        # Define the accessor of class Node
        attr_reader :data,:left,:right,:parent
        attr_accessor :data,:left,:right,:parent
        def initialize( d,  l,  r)
            self.data = d
            self.left = l
            self.right = r
            self.parent = nil
        end
    end

    def initialize()
        self.root = nil
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
        print(node.data,"\n")
        self.printTreeUtil(node.left, indent, true)
        self.printTreeUtil(node.right, indent, false)
    end

    # Function to right rotate subtree rooted with x
    def rightRotate( x)
        y = x.left
        t = y.right
        # Rotation
        y.parent = x.parent
        y.right = x
        x.parent = y
        x.left = t
        if (t != nil)
            t.parent = x
        end
        if (y.parent != nil && y.parent.left == x)
            y.parent.left = y
        elsif (y.parent != nil && y.parent.right == x)
            y.parent.right = y
        end
        # Return new root
        return y
    end

    # Function to left rotate subtree rooted with x
    def leftRotate( x)
        y = x.right
        t = y.left
        # Rotation
        y.parent = x.parent
        y.left = x
        x.parent = y
        x.right = t
        if (t != nil)
            t.parent = x
        end
        if (y.parent != nil && y.parent.left == x)
            y.parent.left = y
        elsif (y.parent != nil && y.parent.right == x)
            y.parent.right = y
        end
        # Return new root
        return y
    end

    def parent( node)
        if (node == nil || node.parent == nil)
            return nil
        end
        return node.parent
    end

    def splay( node)
        while (node != self.root)
            parent = self.parent(node)
            grand = self.parent(parent)
            if (parent == nil)
                # rotations had created new root, always last condition.
                self.root = node
            elsif (grand == nil)
                # single rotation case.
                if (parent.left == node)
                    node = self.rightRotate(parent)
                else
                    node = self.leftRotate(parent)
                end
            elsif (grand.left == parent && parent.left == node)  # Zig Zig case.
                self.rightRotate(grand)
                node = self.rightRotate(parent)
            elsif (grand.right == parent && parent.right == node) # Zag Zag case.
                self.leftRotate(grand)
                node = self.leftRotate(parent)
            elsif (grand.left == parent && parent.right == node)  # Zig Zag case.
                self.leftRotate(parent)
                node = self.rightRotate(grand)
            elsif (grand.right == parent && parent.left == node)  # Zag Zig case.
                self.rightRotate(parent)
                node = self.leftRotate(grand)
            end
        end
    end

    def find( data)
        curr = self.root
        while (curr != nil)
            if (curr.data == data)
                self.splay(curr)
                return true
            elsif (curr.data > data)
                curr = curr.left
            else
                curr = curr.right
            end
        end
        return false
    end

    def insert( data)
        newNode = Node.new(data, nil, nil)
        if (self.root == nil)
            self.root = newNode
            return
        end
        node = self.root
        parent = nil
        while (node != nil)
            parent = node
            if (node.data > data)
                node = node.left
            elsif (node.data < data)
                node = node.right
            else
                self.splay(node)
                return
            end
        end
        newNode.parent = parent
        if (parent.data > data)
            parent.left = newNode
        else
            parent.right = newNode
        end
        self.splay(newNode)
    end

    def findMinNode( curr)
        node = curr
        if (node == nil)
            return nil
        end
        while (node.left != nil)
            node = node.left
        end
        return node
    end

    def delete( data)
        node = self.root
        parent = nil
        nxt = nil
        while (node != nil)
            if (node.data == data)
                parent = node.parent
                if (node.left == nil && node.right == nil)
                    nxt = nil
                elsif (node.left == nil)
                    nxt = node.right
                elsif (node.right == nil)
                    nxt = node.left
                end

                if (node.left == nil || node.right == nil)
                    if (node == self.root)
                        self.root = nxt
                        return
                    end
                    if (parent.left == node)
                        parent.left = nxt
                    else
                        parent.right = nxt
                    end
                    if (nxt != nil)
                        nxt.parent = parent
                    end
                    break
                end
                minNode = self.findMinNode(node.right)
                data = minNode.data
                node.data = data
                node = node.right
            elsif (node.data > data)
                parent = node
                node = node.left
            else
                parent = node
                node = node.right
            end
        end
        self.splay(parent)
    end
    def printInOrder()
        self.printInOrder(self.root)
        print("\n")
    end
    def printInOrder( node) # In order
        if (node != nil)
            self.printInOrder(node.left)
            print(node.data.to_s + " ")
            self.printInOrder(node.right)
        end
    end
end


tree = SPLAYTree.new()
tree.insert(5)
tree.insert(4)
tree.insert(6)
tree.insert(3)
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.printTree()
print("Value 2 found: " + tree.find(2).to_s,"\n")
tree.delete(2)
tree.delete(5)
tree.printTree()