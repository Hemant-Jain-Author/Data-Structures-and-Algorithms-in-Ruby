class BTree
    # Define the accessor and reader of class BTree
    attr_accessor :root,:max,:min

    def initialize( dg)
        self.root = nil # Pointer to root node
        self.max = dg # Maximum degree or Max number of children.
        self.min = dg / 2 # Minimum degree
    end

    class Node
        # Define the accessor and reader of class Node
        attr_accessor :n,:keys,:arr,:leaf
        
        # Constructor
        def initialize( leaf, mx)
            self.n = 0 # Current number of keys
            self.keys = Array.new(mx){0} # An array of keys
            self.arr = Array.new(mx + 1){nil} # An array of child pointers
            self.leaf = leaf # Is true when node is leaf. Otherwise false
        end
    end

    def printTree()
        self.printTreeUtil(self.root, "")
        print("\n")
    end

    def printTreeUtil( node,  indent)
        if (node == nil)
            return
        end
        i = 0
        while (i < node.n)
            self.printTreeUtil(node.arr[i], indent + "    ")
            print(indent + "key[" + i.to_s + "]:" + node.keys[i].to_s,"\n")
            i += 1
        end
        self.printTreeUtil(node.arr[i], indent + "    ")
    end

    def printInOrder( node)
        i = 0
        while (i < node.n)
            if (node.leaf == false)
                self.printInOrder(node.arr[i])
            end
            print(node.keys[i].to_s + " ")
            i += 1
        end
        if (node.leaf == false)
            self.printInOrder(node.arr[i])
        end
    end

    def search( key)
        if (self.root == nil)
            return nil
        end
        return self.searchUtil(self.root, key)
    end

    def searchUtil( node,  key)
        i = 0
        while (i < node.n && node.keys[i] < key) 
			i += 1
        end
        # If the found key is equal to key, return this node
        if (node.keys[i] == key)
            return node
        end
        # If the key is not found and this is a leaf node
        if (node.leaf == true)
            return nil
        end
        # Search in the appropriate child
        return self.searchUtil(node.arr[i], key)
    end

    def insert( key)
        # If tree is empty
        if (self.root == nil)
            self.root = Node.new(true, self.max) # Allocate memory for root
            self.root.keys[0] = key # Insert key
            self.root.n = 1 # Update number of keys in root
            return
        end

        if (self.root.leaf == true)
            # Finds the location where new key can be inserted.
            # By moving all keys greater than key to one place forward.
            i = self.root.n - 1
            while (i >= 0 && self.root.keys[i] > key)
                self.root.keys[i + 1] = self.root.keys[i]
                i -= 1
            end
            # Insert the new key at found location
            self.root.keys[i + 1] = key
            self.root.n = self.root.n + 1
        else
            i = 0
            while (i < self.root.n && self.root.keys[i] < key) 
				i += 1
            end
            self.insertUtil(self.root, self.root.arr[i], i, key)
        end
        if (self.root.n == self.max)
            # If root contains more then allowed nodes, then tree grows in height.
            rt = Node.new(false, self.max) # Allocate memory for new root
            rt.arr[0] = self.root
			# divide the child into two and then add the median to the parent.
            self.split(rt, self.root, 0)
            self.root = rt
        end
    end

    # Insert a new key in this node
    # Arguments are parent, child, index of child and key.
    def insertUtil( parent,  child,  index,  key)
        if (child.leaf == true)
            # Finds the location where new key will be inserted
            # by moving all keys greater than key to one place forward.
            i = child.n - 1
            while (i >= 0 && child.keys[i] > key)
                child.keys[i + 1] = child.keys[i]
                i -= 1
            end
            # Insert the new key at found location
            child.keys[i + 1] = key
            child.n += 1
        else
            i = 0
            # insert the node to the proper child.
            while (i < child.n && child.keys[i] < key) 
				i += 1
            end
            self.insertUtil(child, child.arr[i], i, key)
        end
        if (child.n == self.max)
            # More nodes than allowed.
            # divide the child into two and then add the median to the parent.
            self.split(parent, child, index)
        end
    end

    def split( parent,  child,  index)
        median = self.max / 2 # Getting index of median.
        child.n = median # Reduce the number of keys in child
        node = Node.new(child.leaf, self.max)
        # Copy the second half keys of child to node
        j = 0
        while (median + 1 + j < self.max)
            node.keys[j] = child.keys[median + 1 + j]
            j += 1
        end
        node.n = j
        # Copy the second half children of child to node
        j = 0
        while (child.leaf == false && median + j <= self.max - 1)
            node.arr[j] = child.arr[median + 1 + j]
            j += 1
        end
        j = parent.n
        # parent is going to have a new child,
        # create space of new child
        while (j >= index + 1)
            parent.arr[j + 1] = parent.arr[j]
            j -= 1
        end
        # Link the new child to the parent node
        parent.arr[index + 1] = node
        j = parent.n - 1
        # A key of child will move to the parent node.
        # Find the location of new key by moving
        # all greater keys one space forward.
        while (j >= index)
            parent.keys[j + 1] = parent.keys[j]
            j -= 1
        end
        # Copy the middle key of child to the parent
        parent.keys[index] = child.keys[median]
        # Increment count of keys in this parent
        parent.n += 1
    end

    def remove( key)
        self.removeUtil(self.root, key)
        if (self.root.n == 0)
            # Shrinking : If root is pointing to empty node.
            # If that node is a leaf node then root will become null.
            # Else root will point to first child of node.
            if (self.root.leaf)
                self.root = nil
            else
                self.root = self.root.arr[0]
            end
        end
    end

    def removeUtil( node,  key)
        index = self.findKey(node, key)
        if (node.leaf)
            if (index < node.n && node.keys[index] == key)
                self.removeFromLeaf(node, index)
            else
                print("The key " + key.to_s + " not found.","\n")
                return
            end
        else
            if (index < node.n && node.keys[index] == key)
                self.removeFromNonLeaf(node, index)
            else
                self.removeUtil(node.arr[index], key)
            end
            # All the property violation in index subtree only.
            # which include remove from leaf case too.
            if (node.arr[index].n < self.min)
                self.fixBTree(node, index)
            end
        end
    end

    # Returns the index of first key which is greater than or equal to key.
    def findKey( node,  key)
        index = 0
        while (index < node.n && node.keys[index] < key) 
			index += 1
        end
        return index
    end

    # Remove the index key from leaf node.
    def removeFromLeaf( node,  index)
        i = index + 1
        # Move all the keys after the index position one step left.
        while (i < node.n)
            node.keys[i - 1] = node.keys[i]
            i += 1
        end
        # Reduce the key count.
        node.n -= 1
        return
    end

    # Remove the index key from a non-leaf node.
    def removeFromNonLeaf( node,  index)
        key = node.keys[index]
        # If the child that precedes key has at least min keys,
        # Find the predecessor 'pred' of key in the subtree rooted at index.
        # Replace key by pred and recursively delete pred in arr[index]
        if (node.arr[index].n > self.min)
            pred = self.getPred(node, index)
            node.keys[index] = pred
            self.removeUtil(node.arr[index], pred)
        elsif (node.arr[index + 1].n > self.min)
            succ = self.getSucc(node, index)
            node.keys[index] = succ
            self.removeUtil(node.arr[index + 1], succ)
        else
            self.merge(node, index)
            self.removeUtil(node.arr[index], key)
        end
        return
    end

    # To get predecessor of keys[index]
    def getPred( node,  index)
        # Keep moving to the right most node of left subtree until we reach a leaf.
        cur = node.arr[index]
        while (!cur.leaf) 
			cur = cur.arr[cur.n]
        end
        # Return the last key of the leaf
        return cur.keys[cur.n - 1]
    end

    # To get successor of keys[index]
    def getSucc( node,  index)
        # Keep moving to the left most node of right subtree until we reach a leaf
        cur = node.arr[index + 1]
        while (!cur.leaf) 
			cur = cur.arr[0]
        end
        # Return the first key of the leaf
        return cur.keys[0]
    end

    # Make sure that the node have at least min number of keys
    def fixBTree( node,  index)
        # If the left sibling has more than min keys.
        if (index != 0 && node.arr[index - 1].n > self.min)
            self.borrowFromLeft(node, index)
        elsif (index != node.n && node.arr[index + 1].n > self.min)
            self.borrowFromRight(node, index)
        else
            if (index != node.n)
                self.merge(node, index)
            else
                self.merge(node, index - 1)
            end
        end
    end

    # Move a key from parent to right and left to parent.
    def borrowFromLeft( node,  index)
        child = node.arr[index]
        sibling = node.arr[index - 1]
        
        # Moving all key in child one step forward.
        i = child.n - 1
        while (i >= 0)
            child.keys[i + 1] = child.keys[i]
            i -= 1
        end
        
        # Move all its child pointers one step forward.
        i = child.n
        while (!child.leaf && i >= 0)
            child.arr[i + 1] = child.arr[i]
            i -= 1
        end

        # Setting child's first key equal to of the current node.
        child.keys[0] = node.keys[index - 1]
        # Moving sibling's last child as child's first child.
        if (!child.leaf)
            child.arr[0] = sibling.arr[sibling.n]
        end

        # Moving the key from the sibling to the parent
        node.keys[index - 1] = sibling.keys[sibling.n - 1]
        # Increase child key count and decrease sibling key count.
        child.n += 1
        sibling.n -= 1
        return
    end

    # Move a key from parent to left and right to parent.
    def borrowFromRight( node,  index)
        child = node.arr[index]
        sibling = node.arr[index + 1]
        # node key is inserted as the last key in child.
        child.keys[child.n] = node.keys[index]
        # Sibling's first child is inserted as the last child of child.
        if (!(child.leaf))
            child.arr[(child.n) + 1] = sibling.arr[0]
        end
        # First key from sibling is inserted into node.
        node.keys[index] = sibling.keys[0]
        
        # Moving all keys in sibling one step left
        i = 1
        while (i < sibling.n)
            sibling.keys[i - 1] = sibling.keys[i]
            i += 1
        end
        i = 1
        # Moving the child pointers one step behind
        while (!sibling.leaf && i <= sibling.n)
            sibling.arr[i - 1] = sibling.arr[i]
            i += 1
        end
        # Increase child key count and decrease sibling key count.
        child.n += 1
        sibling.n -= 1
        return
    end

    # Merge node's children at index and index+1.
    def merge( node,  index)
        left = node.arr[index]
        right = node.arr[index + 1]
        start = left.n
        # Adding a key from node to the left child.
        left.keys[start] = node.keys[index]
        
        # Copying the keys from right to left.
        i = 0
        while (i < right.n)
            left.keys[start + 1 + i] = right.keys[i]
            i += 1
        end
        
        # Copying the child pointers from right to left.
        i = 0
        while (!left.leaf && i <= right.n)
            left.arr[start + 1 + i] = right.arr[i]
            i += 1
        end
        
        # Moving all keys after  index in the current node one step forward.
        i = index + 1
        while (i < node.n)
            node.keys[i - 1] = node.keys[i]
            i += 1
        end
        
        # Moving the child pointers after (index+1) in the current node one step forward.
        i = index + 2
        while (i <= node.n)
            node.arr[i - 1] = node.arr[i]
            i += 1
        end
        # Updating the key count of child and the current node
        left.n += right.n + 1
        node.n -= 1
        return
    end
end

t = BTree.new(3) # A B-Tree with max key 3
t.insert(1)
t.insert(2)
t.insert(3)
t.insert(4)
t.insert(5)
t.insert(6)
t.insert(7)
t.insert(8)
t.insert(9)
t.insert(10)
t.printTree()
print("6 : " + ((t.search(6) != nil) ? "Present" : "Not Present"),"\n")
print("11 : " + ((t.search(11) != nil) ? "Present" : "Not Present"),"\n")
t.remove(6)
t.remove(3)
t.remove(7)
t.printTree()

=begin 
        key[0]:1
    key[0]:2
        key[0]:3
key[0]:4
        key[0]:5
    key[0]:6
        key[0]:7
    key[1]:8
        key[0]:9
        key[1]:10

6 : Present

11 : Not Present

    key[0]:1
    key[1]:2
key[0]:4
    key[0]:5
key[1]:8
    key[0]:9
    key[1]:10

=end