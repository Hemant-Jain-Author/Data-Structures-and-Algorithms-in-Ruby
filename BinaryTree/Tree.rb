class Tree
    # Define the accessor and reader of class Tree
    attr_accessor :root

    class Node
        # Define the accessor and reader of class Node
        attr_accessor :value,:left,:right

        def initialize( v,  l = nil,  r = nil)
            self.value = v
            self.left = l
            self.right = r
        end
    end

    def initialize()
        self.root = nil
    end

    # Other methods
    def createCompleteBinaryTree( arr)
        self.root = self.createCompleteBinaryTreeUtil(arr, 0)
    end

    def createCompleteBinaryTreeUtil( arr,  start)
        size = arr.length
        curr = Node.new(arr[start])
        leftIndex = 2 * start + 1
        rightIndex = 2 * start + 2
        if (leftIndex < size)
            curr.left = self.createCompleteBinaryTreeUtil(arr, leftIndex)
        end
        if (rightIndex < size)
            curr.right = self.createCompleteBinaryTreeUtil(arr, rightIndex)
        end
        return curr
    end

    def insert( value)
        self.root = self.insertUtil(self.root, value)
    end

    def insertUtil( node,  value)
        if (node == nil)
            node = Node.new(value, nil, nil)
        else
            if (node.value > value)
                node.left = self.insertUtil(node.left, value)
            else
                node.right = self.insertUtil(node.right, value)
            end
        end
        return node
    end

    def printPreOrder()
        self.printPreOrderUtil(self.root)
        print("\n")
    end

    def printPreOrderUtil( node) # pre order
        if (node != nil)
            print(node.value.to_s + " ")
            self.printPreOrderUtil(node.left)
            self.printPreOrderUtil(node.right)
        end
    end

    def nthPreOrder( index)
        counter = [0]
        self.nthPreOrderUtil(self.root, index, counter)
    end

    def nthPreOrderUtil( node,  index,  counter)  # pre order
        if (node != nil)
            counter[0] += 1
            if (counter[0] == index)
                print(node.value,"\n")
            end
            self.nthPreOrderUtil(node.left, index, counter)
            self.nthPreOrderUtil(node.right, index, counter)
        end
    end

    def printPostOrder()
        self.printPostOrderUtil(self.root)
        print("\n")
    end

    def printPostOrderUtil( node)  # post order
        if (node != nil)
            self.printPostOrderUtil(node.left)
            self.printPostOrderUtil(node.right)
            print(node.value.to_s + " ")
        end
    end

    def nthPostOrder( index)
        counter = [0]
        self.nthPostOrderUtil(self.root, index, counter)
    end
	
    def nthPostOrderUtil( node,  index,  counter)  # post order
        if (node != nil)
            self.nthPostOrderUtil(node.left, index, counter)
            self.nthPostOrderUtil(node.right, index, counter)
            counter[0] += 1
            if (counter[0] == index)
                print(node.value,"\n")
            end
        end
    end
	
    def printInOrder()
        self.printInOrderUtil(self.root)
        print("\n")
    end
	
    def printInOrderUtil( node)  # In order
        if (node != nil)
            self.printInOrderUtil(node.left)
            print(node.value.to_s + " ")
            self.printInOrderUtil(node.right)
        end
    end

    def nthInOrder( index)
        counter = [0]
        self.nthInOrderUtil(self.root, index, counter)
    end

    def nthInOrderUtil( node,  index,  counter)
        if (node != nil)
            self.nthInOrderUtil(node.left, index, counter)
            counter[0] += 1
            if (counter[0] == index)
                print(node.value,"\n")
            end
            self.nthInOrderUtil(node.right, index, counter)
        end
    end

    def printBreadthFirst()
        que =  Queue.new()
        if (self.root != nil)
            que.push(self.root)
        end
        while (que.empty? == false)
            temp = que.pop()
            print(temp.value.to_s + " ")
            if (temp.left != nil)
                que.push(temp.left)
            end
            if (temp.right != nil)
                que.push(temp.right)
            end
        end
    end

    def printDepthFirst()
        stk =  []
        if (self.root != nil)
            stk.push(self.root)
        end
        while ((stk.size == 0) == false)
            temp = stk.pop()
            print(temp.value.to_s + " ")
            if (temp.left != nil)
                stk.push(temp.left)
            end
            if (temp.right != nil)
                stk.push(temp.right)
            end
        end
    end

    def printLevelOrderLineByLine()
        que1 =  Queue.new()
        que2 =  Queue.new()
        temp = nil
        if (self.root != nil)
            que1.push(self.root)
        end
        while (que1.size() != 0 || que2.size != 0)
            while (que1.size() != 0)
                temp = que1.pop()
                print(temp.value.to_s + " ")
                if (temp.left != nil)
                    que2.push(temp.left)
                end
                if (temp.right != nil)
                    que2.push(temp.right)
                end
            end
            print("","\n")
            while (que2.size != 0)
                temp = que2.pop()
                print(temp.value.to_s + " ")
                if (temp.left != nil)
                    que1.push(temp.left)
                end
                if (temp.right != nil)
                    que1.push(temp.right)
                end
            end
            print("\n")
        end
    end

    def printLevelOrderLineByLine2()
        que =  Queue.new()
        temp = nil
        count = 0
        if (self.root != nil)
            que.push(self.root)
        end
        while (que.size != 0)
            count = que.size
            while (count > 0)
                temp = que.pop()
                print(temp.value.to_s + " ")
                if (temp.left != nil)
                    que.push(temp.left)
                end
                if (temp.right != nil)
                    que.push(temp.right)
                end
                count -= 1
            end
            print("\n")
        end
    end

    def printSpiralTree()
        stk1 =  []
        stk2 =  []
        if (self.root != nil)
            stk1.push(self.root)
        end
        while (stk1.length != 0 || stk2.length != 0)
            while (stk1.length != 0)
                temp = stk1.pop()
                print(temp.value.to_s + " ")
                if (temp.right != nil)
                    stk2.push(temp.right)
                end
                if (temp.left != nil)
                    stk2.push(temp.left)
                end
            end
            while (stk2.length != 0)
                temp = stk2.pop()
                print(temp.value.to_s + " ")
                if (temp.left != nil)
                    stk1.push(temp.left)
                end
                if (temp.right != nil)
                    stk1.push(temp.right)
                end
            end
        end
        print("\n")
    end

    def find( value)
        curr = self.root
        while (curr != nil)
            if (curr.value == value)
                return true
            elsif (curr.value > value)
                curr = curr.left
            else
                curr = curr.right
            end
        end
        return false
    end

    def findMin()
        node = self.root
        if (node == nil)
            return 99999
        end
        while (node.left != nil)
            node = node.left
        end
        return node.value
    end

    def findMax()
        node = self.root
        if (node == nil)
            return -99999
        end
        while (node.right != nil)
            node = node.right
        end
        return node.value
    end

    def findMaxNode( curr)
        node = curr
        if (node == nil)
            return nil
        end
        while (node.right != nil)
            node = node.right
        end
        return node
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

    def free()
        self.root = nil
    end

    def deleteNode( value)
        self.root = self.deleteNodeUtil(self.root, value)
    end

    def deleteNodeUtil( node,  value)
        if (node != nil)
            if (node.value == value)
                if (node.left == nil && node.right == nil)
                    return nil
                else
                    if (node.left == nil)
                        return node.right
                    end
                    if (node.right == nil)
                        return node.left
                    end
                    minNode = self.findMinNode(node.right)
                    minValue = minNode.value
                    node.value = minValue
                    node.right = self.deleteNodeUtil(node.right, minValue)
                end
            else
                if (node.value > value)
                    node.left = self.deleteNodeUtil(node.left, value)
                else
                    node.right = self.deleteNodeUtil(node.right, value)
                end
            end
        end
        return node
    end

    def treeDepth()
        return self.treeDepthUtil(self.root)
    end

    def treeDepthUtil( curr)
        if (curr == nil)
            return 0
        else
            lDepth = self.treeDepthUtil(curr.left)
            rDepth = self.treeDepthUtil(curr.right)
            if (lDepth > rDepth)
                return lDepth + 1
            else
                return rDepth + 1
            end
        end
    end

    def isEqual( t2)
        return self.isEqualUtil(self.root, t2.root)
    end

    def isEqualUtil( node1,  node2)
        if (node1 == nil && node2 == nil)
            return true
        elsif (node1 == nil || node2 == nil)
            return false
        else
            return (self.isEqualUtil(node1.left, node2.left) && self.isEqualUtil(node1.right, node2.right) && (node1.value == node2.value))
        end
    end

    def ancestor( first,  second)
        if (first > second)
            temp = first
            first = second
            second = temp
        end
        return self.ancestorUtil(self.root, first, second)
    end

    def ancestorUtil( curr,  first,  second)
        if (curr == nil)
            return nil
        end
        if (curr.value > first && curr.value > second)
            return self.ancestorUtil(curr.left, first, second)
        end
        if (curr.value < first && curr.value < second)
            return self.ancestorUtil(curr.right, first, second)
        end
        return curr
    end

    def copyTree()
        tree2 = Tree.new()
        tree2.root = self.copyTreeUtil(self.root)
        return tree2
    end

    def copyTreeUtil( curr)
        if (curr != nil)
            temp = Node.new(curr.value)
            temp.left = self.copyTreeUtil(curr.left)
            temp.right = self.copyTreeUtil(curr.right)
            return temp
        else
            return nil
        end
    end

    def copyMirrorTree()
        tree2 = Tree.new()
        tree2.root = self.copyMirrorTreeUtil(self.root)
        return tree2
    end

    def copyMirrorTreeUtil( curr)
        if (curr != nil)
            temp = Node.new(curr.value)
            temp.right = self.copyMirrorTreeUtil(curr.left)
            temp.left = self.copyMirrorTreeUtil(curr.right)
            return temp
        else
            return nil
        end
    end

    def numNodes()
        return self.numNodesUtil(self.root)
    end

    def numNodesUtil( curr)
        if (curr == nil)
            return 0
        else
            return (1 + self.numNodesUtil(curr.right) + self.numNodesUtil(curr.left))
        end
    end

    def numFullNodesBT()
        return self.numFullNodesBTUtil(self.root)
    end

    def numFullNodesBTUtil( curr)
        if (curr == nil)
            return 0
        end
        count = self.numFullNodesBTUtil(curr.right) + self.numFullNodesBTUtil(curr.left)
        if (curr.right != nil && curr.left != nil)
            count += 1
        end
        return count
    end

    def maxLengthPathBT()
        return self.maxLengthPathBTUtil(self.root)
    end

    def maxLengthPathBTUtil( curr)  # diameter
        if (curr == nil)
            return 0
        end
        leftPath = self.treeDepthUtil(curr.left)
        rightPath = self.treeDepthUtil(curr.right)
        max = leftPath + rightPath + 1
        leftMax = self.maxLengthPathBTUtil(curr.left)
        rightMax = self.maxLengthPathBTUtil(curr.right)
        if (leftMax > max)
            max = leftMax
        end
        if (rightMax > max)
            max = rightMax
        end
        return max
    end

    def numLeafNodes()
        return self.maxLengthPathBTUtil(self.root)
    end

    def maxLengthPathBTUtil( curr)
        if (curr == nil)
            return 0
        end
        if (curr.left == nil && curr.right == nil)
            return 1
        else
            return (self.maxLengthPathBTUtil(curr.right) + self.maxLengthPathBTUtil(curr.left))
        end
    end

    def sumAllBT()
        return self.sumAllBTUtil(self.root)
    end

    def sumAllBTUtil( curr)
        if (curr == nil)
            return 0
        end
        return (curr.value + self.sumAllBTUtil(curr.left) + self.sumAllBTUtil(curr.right))
    end

    def iterativePreOrder()
        stk =  []
        if (self.root != nil)
            stk.push(self.root)
        end
        while ((stk.size == 0) == false)
            curr = stk.pop()
            print(curr.value.to_s + " ")
            if (curr.right != nil)
                stk.push(curr.right)
            end
            if (curr.left != nil)
                stk.push(curr.left)
            end
        end
        print("\n")
    end

    def iterativePostOrder()
        stk =  []
        visited =  []
        if (self.root != nil)
            stk.push(self.root)
            visited.push(0)
        end
        while ((stk.size == 0) == false)
            curr = stk.pop()
            vtd = visited.pop()
            if (vtd == 1)
                print(curr.value.to_s + " ")
            else
                stk.push(curr)
                visited.push(1)
                if (curr.right != nil)
                    stk.push(curr.right)
                    visited.push(0)
                end
                if (curr.left != nil)
                    stk.push(curr.left)
                    visited.push(0)
                end
            end
        end
        print("\n")
    end

    def iterativeInOrder()
        stk =  []
        visited =  []
        if (self.root != nil)
            stk.push(self.root)
            visited.push(0)
        end
        while ((stk.size == 0) == false)
            curr = stk.pop()
            vtd = visited.pop()
            if (vtd == 1)
                print(curr.value.to_s + " ")
            else
                if (curr.right != nil)
                    stk.push(curr.right)
                    visited.push(0)
                end
                stk.push(curr)
                visited.push(1)
                if (curr.left != nil)
                    stk.push(curr.left)
                    visited.push(0)
                end
            end
        end
        print("\n")
    end

    def isBST3()
        return self.isBST3Util(self.root)
    end

    def isBST3Util( root)
        if (root == nil)
            return true
        end
        if (root.left != nil && self.findMaxNode(root.left).value > root.value)
            return false
        end
        if (root.right != nil && self.findMinNode(root.right).value <= root.value)
            return false
        end
        return (self.isBST3Util(root.left) && self.isBST3Util(root.right))
    end

    def isBST()
        return self.isBSTUtil(self.root, -99999, 99999)
    end

    def isBSTUtil( curr,  min,  max)
        if (curr == nil)
            return true
        end
        if (curr.value < min || curr.value > max)
            return false
        end
        return self.isBSTUtil(curr.left, min, curr.value) && self.isBSTUtil(curr.right, curr.value, max)
    end

    def isBST2()
        count = Array.new(1){0}
        return self.isBST2Util(self.root, count)
    end

    def isBST2Util( root,  count)  # in order traversal
        if (root != nil)
            ret = self.isBST2Util(root.left, count)
            if (!ret)
                return false
            end
            if (count[0] > root.value)
                return false
            end
            count[0] = root.value
            ret = self.isBST2Util(root.right, count)
            if (!ret)
                return false
            end
        end
        return true
    end

    def isCompleteTree()
        que =  Queue.new()
        temp = nil
        noChild = 0
        if (self.root != nil)
            que.push(self.root)
        end
        while (que.size != 0)
            temp = que.pop()
            if (temp.left != nil)
                if (noChild == 1)
                    return false
                end
                que.push(temp.left)
            else
                noChild = 1
            end
            if (temp.right != nil)
                if (noChild == 1)
                    return false
                end
                que.push(temp.right)
            else
                noChild = 1
            end
        end
        return true
    end

    def isCompleteTreeUtil( curr,  index,  count)
        if (curr == nil)
            return true
        end
        if (index > count)
            return false
        end
        return self.isCompleteTreeUtil(curr.left, index * 2 + 1, count) && self.isCompleteTreeUtil(curr.right, index * 2 + 2, count)
    end

    def isCompleteTree2()
        count = self.numNodes()
        return self.isCompleteTreeUtil(self.root, 0, count)
    end

    def isHeapUtil( curr,  parentValue)
        if (curr == nil)
            return true
        end
        if (curr.value < parentValue)
            return false
        end
        return (self.isHeapUtil(curr.left, curr.value) && self.isHeapUtil(curr.right, curr.value))
    end

    def isHeap()
        infinite = -9999999
        return (self.isCompleteTree() && self.isHeapUtil(self.root, infinite))
    end

    def isHeapUtil2( curr,  index,  count,  parentValue)
        if (curr == nil)
            return true
        end
        if (index > count)
            return false
        end
        if (curr.value < parentValue)
            return false
        end
        return self.isHeapUtil2(curr.left, index * 2 + 1, count, curr.value) && self.isHeapUtil2(curr.right, index * 2 + 2, count, curr.value)
    end

    def isHeap2()
        count = self.numNodes()
        parentValue = -9999999
        return self.isHeapUtil2(self.root, 0, count, parentValue)
    end

    def printAllPath()
        stk =  []
        self.printAllPathUtil(self.root, stk)
    end

    def printAllPathUtil( curr,  stk)
        if (curr == nil)
            return
        end
        stk.push(curr.value)
        if (curr.left == nil && curr.right == nil)
            print(stk,"\n")
            stk.pop()
            return
        end
        self.printAllPathUtil(curr.right, stk)
        self.printAllPathUtil(curr.left, stk)
        stk.pop()
    end

    def lca( first,  second)
        ans = self.lcaUtil(self.root, first, second)
        if (ans != nil)
            return ans.value
        else
            return -9999999
        end
    end

    def lcaUtil( curr,  first,  second)
        if (curr == nil)
            return nil
        end
        if (curr.value == first || curr.value == second)
            return curr
        end
        left = self.lcaUtil(curr.left, first, second)
        right = self.lcaUtil(curr.right, first, second)
        if (left != nil && right != nil)
            return curr
        elsif (left != nil)
            return left
        else
            return right
        end
    end

    def lcaBST( first,  second)
        if (first > second)
            result = self.lcaBSTUtil(self.root, second, first)
        else
            result = self.lcaBSTUtil(self.root, first, second)
        end
        if (result == 9999999)
            print("lca does not exist","\n")
        else
            print("lca is :" + result.to_s,"\n")
        end
        return result
    end

    def lcaBSTUtil( curr,  first,  second)
        if (curr == nil)
            return 9999999
        end
        if (curr.value > second)
            return self.lcaBSTUtil(curr.left, first, second)
        end
        if (curr.value < first)
            return self.lcaBSTUtil(curr.right, first, second)
        end
        if (self.find(first) && self.find(second))
            return curr.value
        end
        return 9999999
    end

    def trimOutsideRange( min,  max)
        self.trimOutsideRangeUtil(self.root, min, max)
    end

    def trimOutsideRangeUtil( curr,  min,  max)
        if (curr == nil)
            return nil
        end
        curr.left = self.trimOutsideRangeUtil(curr.left, min, max)
        curr.right = self.trimOutsideRangeUtil(curr.right, min, max)
        if (curr.value < min)
            return curr.right
        end
        if (curr.value > max)
            return curr.left
        end
        return curr
    end
	
    def printInRange( min,  max)
        self.printInRangeUtil(self.root, min, max)
        print("\n")
    end
	
    def printInRangeUtil( root,  min,  max)
        if (root == nil)
            return
        end
        self.printInRangeUtil(root.left, min, max)
        if (root.value >= min && root.value <= max)
            print(root.value.to_s + " ")
        end
        self.printInRangeUtil(root.right, min, max)
    end
	
    def floorBST( val)
        curr = self.root
        floor = 9999999
        while (curr != nil)
            if (curr.value == val)
                floor = curr.value
                break
            elsif (curr.value > val)
                curr = curr.left
            else
                floor = curr.value
                curr = curr.right
            end
        end
        return floor
    end
	
    def ceilBST( val)
        curr = self.root
        ceil = -9999999
        while (curr != nil)
            if (curr.value == val)
                ceil = curr.value
                break
            elsif (curr.value > val)
                ceil = curr.value
                curr = curr.left
            else
                curr = curr.right
            end
        end
        return ceil
    end
	
    def findMaxBT()
        ans = self.findMaxBTUtil(self.root)
        return ans
    end
	
    def findMaxBTUtil( curr)
        if (curr == nil)
            return -9999999
        end
        max = curr.value
        leftmax = self.findMaxBTUtil(curr.left)
        rightmax = self.findMaxBTUtil(curr.right)
        if (leftmax > max)
            max = leftmax
        end
        if (rightmax > max)
            max = rightmax
        end
        return max
    end
	
    def searchBT( value)
        return self.searchBTUtil(self.root, value)
    end
	
    def searchBTUtil( curr,  value)
        if (curr == nil)
            return false
        end
        if ((curr.value == value) || self.searchBTUtil(curr.left, value) || self.searchBTUtil(curr.right, value))
            return true
        end
        return false
    end
	
    def createBinarySearchTree( arr)
        self.root = self.createBinarySearchTreeUtil(arr, 0, arr.length - 1)
    end
	
    def createBinarySearchTreeUtil( arr,  startI,  endI)
        if (startI > endI)
            return nil
        end
        mid = (startI + endI) / 2
        curr = Node.new(arr[mid])
        curr.left = self.createBinarySearchTreeUtil(arr, startI, mid - 1)
        curr.right = self.createBinarySearchTreeUtil(arr, mid + 1, endI)
        return curr
    end
	
    def isBSTArray( preorder)
        size = preorder.length
        stk =  []
        root = -999999
        i = 0
        while (i < size)
            value = preorder[i]
            # If value of the right child is less than root.
            if (value < root)
                return false
            end
            # First left child values will be popped
            # Last popped value will be the root.
            while (stk.length() > 0 && stk[stk.length() -1] < value) 
				root = stk.pop()
            end
            # add current value to the stack.
            stk.push(value)
            i += 1
        end
        return true
    end
end

def main1()
	t = Tree.new()
	arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	t.createCompleteBinaryTree(arr)
	t.printPreOrder()
	# 1 2 4 8 9 5 10 3 6 7 
	t.printPostOrder()
	# 8 9 4 10 5 2 6 7 3 1 
	t.printInOrder()
	# 8 4 9 2 10 5 1 6 3 7 
	t.iterativePreOrder()
	# 1 2 4 8 9 5 10 3 6 7 
	t.iterativePostOrder()
	# 8 9 4 10 5 2 6 7 3 1 
	t.iterativeInOrder()
	# 8 4 9 2 10 5 1 6 3 7 
	t.printBreadthFirst()
	# 1 2 3 4 5 6 7 8 9 10 
	t.printDepthFirst()
	# 1 3 7 6 2 5 10 4 9 8
	t.printLevelOrderLineByLine()
	# 	1 
	# 	2 3 
	# 	4 5 6 7 
	# 	8 9 10 
	t.printLevelOrderLineByLine2()
	# 	1 
	# 	2 3 
	# 	4 5 6 7 
	# 	8 9 10 
	t.printSpiralTree()
	# 1 2 3 7 6 5 4 8 9 10 
	t.nthInOrder(2)
	t.nthPostOrder(2)
	t.nthPreOrder(2)
	# 	4
	# 	9
	# 	2
	t.printAllPath()
    # [1, 3, 7]
    # [1, 3, 6]
    # [1, 2, 5, 10]
    # [1, 2, 4, 9]
    # [1, 2, 4, 8]
end

def main2()
	t = Tree.new()
	arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	t.createCompleteBinaryTree(arr)
	print(t.numNodes(),"\n")
	# 10
	print(t.sumAllBT(),"\n")
	# 55
	print(t.numLeafNodes(),"\n")
	# 5
	print(t.numFullNodesBT(),"\n")
	# 4
	print(t.searchBT(9),"\n")
	# true
	print(t.findMaxBT(),"\n")
	# 10
	print(t.treeDepth(),"\n")
	# 4
	print(t.maxLengthPathBT(),"\n")
    # 5
end

def main3()
	t = Tree.new()
	arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	t.createCompleteBinaryTree(arr)
	t2 = t.copyTree()
	t2.printInOrder()
	# 8 4 9 2 10 5 1 6 3 7 
	t3 = t.copyMirrorTree()
	t3.printInOrder()
	# 7 3 6 1 5 10 2 9 4 8
	print(t.isEqual(t2),"\n")
	# 	true
	print(t.isHeap(),"\n")
	print(t.isHeap2(),"\n")
	print(t.isCompleteTree(),"\n")
	print(t.isCompleteTree2(),"\n")
    # true
    # true
    # true
    # true
end

def main4()
	t = Tree.new()
	t.insert(6)
	t.insert(4)
	t.insert(2)
	t.insert(5)
	t.insert(1)
	t.insert(3)
	t.insert(8)
	t.insert(7)
	t.insert(9)
	t.insert(10)
	t.printInOrder()
	# 	1 2 3 4 5 6 7 8 9 10 
	print(t.find(3),"\n")
	print(t.find(16),"\n")
	# 	true
	# 	false
	print(t.isBST(),"\n")
	print(t.isBST2(),"\n")
	print(t.isBST3(),"\n")
    # true
    # true
    # true
end

def main5()
	t = Tree.new()
	t.insert(2)
	t.insert(1)
	t.insert(3)
	t.insert(4)
	print("Before delete operation.","\n")
	t.printInOrder()
	t.deleteNode(2)
	print("After delete operation.","\n")
	t.printInOrder()
end
# Before delete operation.
# 1 2 3 4 
# After delete operation.
# 1 3 4

def main6()
	t = Tree.new()
	arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	t.createBinarySearchTree(arr)
	print(t.findMin(),"\n")
	print(t.findMax(),"\n")
	t.lcaBST(3, 4)
	t.lcaBST(1, 4)
	t.lcaBST(10, 4)
end
# 1
# 10
# lca is :3
# lca is :2
# lca is :5

def main7()
	t = Tree.new()
	arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	t.createBinarySearchTree(arr)
	t.printInOrder()
	t.printInRange(4, 7)
	t.trimOutsideRange(4, 7)
	t.printInOrder()
end
# 1 2 3 4 5 6 7 8 9 10 
# 4 5 6 7 
# 4 5 6 7

def main8()
	t = Tree.new()
	arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	t.createBinarySearchTree(arr)
	print(t.ancestor(1, 10).value,"\n")
	# 5
	print(t.ceilBST(5.5),"\n")
	# 6
	print(t.floorBST(5.5),"\n")
	# 5
	arr1 = [5, 2, 4, 6, 9, 10]
	arr2 = [5, 2, 6, 4, 7, 9, 10]
	print(t.isBSTArray(arr1),"\n")
	print(t.isBSTArray(arr2),"\n")
    # true
    # false
end
	
main1()
main2()
main3()
main4()
main5()
main6()
main7()
main8()