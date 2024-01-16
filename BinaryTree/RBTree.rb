class RBTree
    # Define the accessor of class RBTree
    attr_accessor :root,:NullNode

    class Node
        # Define the accessor of class Node
        attr_accessor :left,:right,:parent,:data,:colour

        def initialize( data,  nullNode)
            self.data = data
            self.left = nullNode
            self.right = nullNode
            self.colour = true # New node are red in colour.
            self.parent = nullNode
        end
    end
	
    def initialize()
        self.NullNode = Node.new(0, nil)
        self.NullNode.colour = false
        self.root = self.NullNode
    end

    # To check whether node is of colour red or not.
    def isRed( node)
        return (node == nil) ? false : (node.colour == true)
    end
	
    def printTree()
        self.printTreeUtil(self.root, "", false)
        print("\n")
    end
	
    def printTreeUtil( node,  indent,  isLeft)
        if (node == self.NullNode)
            return
        end

        if (isLeft)
            print(indent + "L:")
            indent += "|  "
        else
            print(indent + "R:")
            indent += "   "
        end
        print(node.data.to_s + "(" + node.colour.to_s + ")","\n")
        self.printTreeUtil(node.left, indent, true)
        self.printTreeUtil(node.right, indent, false)
    end

    # Other methods

    # Function to right rotate subtree rooted with x
    def rightRotate( x)
        y = x.left
        t = y.right
        # Rotation
        y.parent = x.parent
        y.right = x
        x.parent = y
        x.left = t
        if (t != self.NullNode)
            t.parent = x
        end
        if (x == self.root)
            self.root = y
            return y
        end
        if (y.parent.left == x)
            y.parent.left = y
        else
            y.parent.right = y
        end
        
        return y # Return new root
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
        if (t != self.NullNode)
            t.parent = x
        end
        if (x == self.root)
            self.root = y
            return y
        end
        if (y.parent.left == x)
            y.parent.left = y
        else
            y.parent.right = y
        end
        
        return y # Return new root
    end
	
    def rightLeftRotate( node)
        node.right = self.rightRotate(node.right)
        return self.leftRotate(node)
    end
	
    def leftRightRotate( node)
        node.left = self.leftRotate(node.left)
        return self.rightRotate(node)
    end
	
    def find( data)
        curr = self.root
        while (curr != self.NullNode)
            if (curr.data == data)
                return curr
            elsif (curr.data > data)
                curr = curr.left
            else
                curr = curr.right
            end
        end
        return nil
    end
	
    def insert( data)
        self.root = self.insertUtil(self.root, data)
        temp = self.find(data)
        self.fixRedRed(temp)
    end
	
    def insertUtil( node,  data)
        if (node == self.NullNode)
            node = Node.new(data, self.NullNode)
        elsif (node.data > data)
            node.left = self.insertUtil(node.left, data)
            node.left.parent = node
        elsif (node.data < data)
            node.right = self.insertUtil(node.right, data)
            node.right.parent = node
        end
        return node
    end
	
    def fixRedRed( x)
        # if x is root colour it black and return
        if (x == self.root)
            x.colour = false
            return
        end
        if (x.parent == self.NullNode || x.parent.parent == self.NullNode)
            return
        end
        # Initialize parent, grandparent, uncle
        parent = x.parent
        grandparent = parent.parent
        uncle = self.uncle(x)
        mid = nil
        if (parent.colour == false)
            return
        end
        # parent colour is red. gp is black.
        if (uncle != self.NullNode && uncle.colour == true)  # uncle and parent is red.
            parent.colour = false
            uncle.colour = false
            grandparent.colour = true
            self.fixRedRed(grandparent)
            return
        end
        # parent is red, uncle is black and gp is black.
        # Perform LR, LL, RL, RR
        if (parent == grandparent.left && x == parent.left)  # LL
            mid = self.rightRotate(grandparent)
        elsif (parent == grandparent.left && x == parent.right)  # LR
            mid = self.leftRightRotate(grandparent)
        elsif (parent == grandparent.right && x == parent.left)  # RL
            mid = self.rightLeftRotate(grandparent)
        elsif (parent == grandparent.right && x == parent.right)  # RR
            mid = self.leftRotate(grandparent)
        end
        mid.colour = false
        mid.left.colour = true
        mid.right.colour = true
    end
	
    def uncle( node)
        # If no parent or grandparent, then no uncle
        if (node.parent == self.NullNode || node.parent.parent == self.NullNode)
            return nil
        end

        if (node.parent == node.parent.parent.left)  # uncle on right
            return node.parent.parent.right
        else # uncle on left
            return node.parent.parent.left 
        end
    end
	
    def delete( data)
        self.deleteUtil(self.root, data)
    end
	
    def deleteUtil( node,  key)
        z = self.NullNode
        while (node != self.NullNode)
            if (node.data == key)
                z = node
                break
            elsif (node.data <= key)
                node = node.right
            else
                node = node.left
            end
        end
        if (z == self.NullNode)
            print("Couldn\'t find key in the tree","\n")
            return
        end
        y = z
        yColour = y.colour
        if (z.left == self.NullNode)
            x = z.right
            self.joinParentChild(z, z.right)
        elsif (z.right == self.NullNode)
            x = z.left
            self.joinParentChild(z, z.left)
        else
            y = self.minimum(z.right)
            yColour = y.colour
            z.data = y.data
            self.joinParentChild(y, y.right)
            x = y.right
        end
        if (yColour == false)
            if (x.colour == true)
                x.colour = false
                return
            else
                self.fixDoubleBlack(x)
            end
        end
    end
	
    def fixDoubleBlack( x)
        if (x == self.root)  # Root node.
            return
        end
        sib = self.sibling(x)
        parent = x.parent
        if (sib == self.NullNode)  # No sibling double black shifted to parent.
            self.fixDoubleBlack(parent)
        else
            if (sib.colour == true)  # Sibling colour is red.
                parent.colour = true
                sib.colour = false
                if (sib.parent.left == sib) # Sibling is left child.
                    self.rightRotate(parent)
                else # Sibling is right child.
                    self.leftRotate(parent)
                end
                self.fixDoubleBlack(x)
            else
                # Sibling colour is black
                # At least one child is red.
                if (sib.left.colour == true || sib.right.colour == true)
                    if (sib.parent.left == sib) # Sibling is left child.
                        if (sib.left != self.NullNode && sib.left.colour == true) # left left case.
                            sib.left.colour = sib.colour
                            sib.colour = parent.colour
                            self.rightRotate(parent)
                        else # left right case.
                            sib.right.colour = parent.colour
                            self.leftRotate(sib)
                            self.rightRotate(parent)
                        end
                    else
                        # Sibling is right child.
                        if (sib.left != self.NullNode && sib.left.colour == true) # right left case.
                            sib.left.colour = parent.colour
                            self.rightRotate(sib)
                            self.leftRotate(parent)
                        else # right right case.
                            sib.right.colour = sib.colour
                            sib.colour = parent.colour
                            self.leftRotate(parent)
                        end
                    end
                    parent.colour = false
                else
                    # Both children black.
                    sib.colour = true
                    if (parent.colour == false)
                        self.fixDoubleBlack(parent)
                    else
                        parent.colour = false
                    end
                end
            end
        end
    end
	
    def sibling( node)
        # sibling null if no parent
        if (node.parent == self.NullNode)
            return nil
        end
        if (node.parent.left == node)
            return node.parent.right
        end
        return node.parent.left
    end
	
    def joinParentChild( u,  v)
        if (u.parent == self.NullNode)
            self.root = v
        elsif (u == u.parent.left)
            u.parent.left = v
        else
            u.parent.right = v
        end
        v.parent = u.parent
    end
	
    def minimum( node)
        while (node.left != self.NullNode)
            node = node.left
        end
        return node
    end
end

tree = RBTree.new()
tree.insert(1)
tree.insert(2)
tree.insert(3)
tree.insert(4)
tree.insert(5)
tree.insert(7)
tree.insert(6)
tree.insert(8)
tree.insert(9)
tree.printTree()
tree.delete(4)
tree.printTree()
tree.delete(7)
tree.printTree()
    

=begin 

R:4(false)
   L:2(true)
   |  L:1(false)
   |  R:3(false)
   R:6(true)
      L:5(false)
      R:8(false)
         L:7(true)
         R:9(true)

R:5(false)
   L:2(true)
   |  L:1(false)
   |  R:3(false)
   R:7(true)
      L:6(false)
      R:8(false)
         R:9(true)

R:5(false)
   L:2(true)
   |  L:1(false)
   |  R:3(false)
   R:8(true)
      L:6(false)
      R:9(false)

=end