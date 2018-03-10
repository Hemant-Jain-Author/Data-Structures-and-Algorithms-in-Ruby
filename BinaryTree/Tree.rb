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

  # Other methods.
end

def levelOrderBinaryTree(arr)
  @root = self.levelOrderBinaryTreeUtil(arr, 0)
end

def levelOrderBinaryTreeUtil(arr, start)
  size = arr.size
  curr = Node.new(arr[start])
  left = 2 * start + 1
  right = 2 * start + 2
  if left < size
    curr.lChild = self.levelOrderBinaryTreeUtil(arr, left)
  end
  if right < size
    curr.rChild = self.levelOrderBinaryTreeUtil(arr, right)
  end
  return curr
end

def InsertNode(value)
  @root = self.InsertNodeUtil(value, @root)
end

def InsertNodeUtil(value, node)
  if node == nil
    node = Node.new(value, nil, nil)
  else
    if node.value > value
      node.lChild = self.InsertNodeUtil(value, node.lChild)
    else
      node.rChild = self.InsertNodeUtil(value, node.rChild)
    end
  end
  return node
end

def PrintPreOrder(node = @root)
  if node != nil
    print node.value, " "
    self.PrintPreOrder(node.lChild)
    self.PrintPreOrder(node.rChild)
  end
end

def NthPreOrder(index)
  counter = [0]
  self.NthPreOrderUtil(@root, index, counter)
end

def NthPreOrderUtil(node, index, counter)
  if node != nil
    counter[0] += 1
    if counter[0] == index
      print node.value
    end
    self.NthPreOrderUtil(node.lChild, index, counter)
    self.NthPreOrderUtil(node.rChild, index, counter)
  end
end

def PrintPostOrder(node = @root)
  if node != nil
    self.PrintPostOrder(node.lChild)
    self.PrintPostOrder(node.rChild)
    print node.value, " "
  end
end

def NthPostOrder(index)
  counter = [0]
  self.NthPostOrderUtil(@root, index, counter)
end

def NthPostOrderUtil(node, index, counter)
  if node != nil
    self.NthPostOrderUtil(node.lChild, index, counter)
    self.NthPostOrderUtil(node.rChild, index, counter)
    counter[0] +=  1
    if counter[0] == index
      print node.value
    end
  end
end

def PrintInOrder(node = @root)
  if node != nil
    self.PrintInOrder(node.lChild)
    print node.value, " "
    self.PrintInOrder(node.rChild)
  end
end

def NthInOrder(index)
  counter = [0]
  self.NthInOrderUtil(@root, index, counter)
end

def NthInOrderUtil(node, index, counter)
  if node != nil
    self.NthInOrderUtil(node.lChild, index, counter)
    counter[0] += 1
    if counter[0] == index
      print node.value
    end
    self.NthInOrderUtil(node.rChild, index, counter)
  end
end

def PrintBredthFirst()
  que = Queue.new()
  if @root != nil
    que.push(@root)
  end
  while que.size != 0
    temp = que.pop()
    print temp.value, " "
    if temp.lChild != nil
      que.push(temp.lChild)
    end
    if temp.rChild != nil
      que.push(temp.rChild)
    end
  end
end

def PrintDepthFirst()
  stk = []
  if @root != nil
    stk.push(@root)
  end
  while stk.size != 0
    temp = stk.pop()
    print temp.value, " "
    if temp.rChild != nil
      stk.push(temp.rChild)
    end
    if temp.lChild != nil
      stk.push(temp.lChild)
    end
  end
end

def Find(value)
  curr = @root
  while curr != nil
    if curr.value == value
      return true
    elsif curr.value > value
      curr = curr.lChild
    else
      curr = curr.rChild
    end
  end
  return false
end

def Find2(value)
  curr = @root
  while curr != nil and curr.value != value
    curr = (curr.value > value) ? curr.lChild : curr.rChild
  end
  return curr != nil
end

def FindMin( node = @root)
  if node == nil
    return 1000000
  end
  while node.lChild != nil
    node = node.lChild
  end
  return node.value
end

def FindMax(node = @root)
  if node == nil
    return -1000000
  end
  while node.rChild != nil
    node = node.rChild
  end
  return node.value
end

def Free()
  @root = nil
end

def DeleteNode(value)
  @root = self.DeleteNodeUtil(@root, value)
end

def DeleteNodeUtil(node, value)
  temp = nil
  if node != nil
    if node.value == value
      if node.lChild == nil and node.rChild == nil
        return nil
      else
        if node.lChild == nil
          return node.rChild
        end
        if node.rChild == nil
          return node.lChild
        end
        minNode = self.FindMin(node.rChild)
        minValue = minNode.value
        node.value = minValue
        node.rChild = self.DeleteNodeUtil(node.rChild, minValue)
      end
    else
      if node.value > value
        node.lChild = self.DeleteNodeUtil(node.lChild, value)
      else
        node.rChild = self.DeleteNodeUtil(node.rChild, value)
      end
    end
  end
  return node
end

def TreeDepth(curr = @root)
  if curr == nil
    return 0
  else
    lDepth = self.TreeDepth(curr.lChild)
    rDepth = self.TreeDepth(curr.rChild)
    if lDepth > rDepth
      return lDepth + 1
    else
      return rDepth + 1
    end
  end
end

def isEqual(tree2)
  return self.isEqualUtil(@root, tree2.root)
end

def isEqualUtil(node1, node2)
  if node1 == nil and node2 == nil
    return true
  elsif node1 == nil or node2 == nil
    return false
  else
    return (self.isEqualUtil(node1.lChild, node2.lChild) and self.isEqualUtil(node1.rChild, node2.rChild) and (node1.value == node2.value))
  end
end

def Ancestor(first, second)
  if first > second
    temp = first
    first = second
    second = temp
  end
  return self.AncestorUtil(@root, first, second).value
end

def AncestorUtil(curr, first, second)
  if curr == nil
    return nil
  end
  if curr.value > first and curr.value > second
    return self.AncestorUtil(curr.lChild, first, second)
  end
  if curr.value < first and curr.value < second
    return self.AncestorUtil(curr.rChild, first, second)
  end
  return curr
end

def CopyTree()
  tree2 = Tree.new()
  tree2.root = self.CopyTreeUtil(@root)
  return tree2
end

def CopyTreeUtil(curr)
  if curr != nil
    temp = Node.new(curr.value)
    temp.lChild = self.CopyTreeUtil(curr.lChild)
    temp.rChild = self.CopyTreeUtil(curr.rChild)
    return temp
  else
    return nil
  end
end

def CopyMirrorTree()
  tree2 = Tree.new()
  tree2.root = self.CopyMirrorTreeUtil(@root)
  return tree2
end

def CopyMirrorTreeUtil(curr)
  if curr != nil
    temp = Node.new(curr.value)
    temp.rChild = self.CopyMirrorTreeUtil(curr.lChild)
    temp.lChild = self.CopyMirrorTreeUtil(curr.rChild)
    return temp
  else
    return nil
  end
end

def numNodes(curr = @root)
  if curr == nil
    return 0
  else
    return (1 + self.numNodes(curr.rChild) + self.numNodes(curr.lChild))
  end
end

def numFullNodesBT(curr = @root)
  if curr == nil
    return 0
  end
  count = self.numFullNodesBT(curr.rChild) + self.numFullNodesBT(curr.lChild)
  if curr.rChild != nil and curr.lChild != nil
    count += 1
  end
  return count
end

def maxLengthPathBT(curr = @root) # diameter
  if curr == nil
    return 0
  end
  leftPath = self.TreeDepth(curr.lChild)
  rightPath = self.TreeDepth(curr.rChild)
  max = leftPath + rightPath + 1
  leftMax = self.maxLengthPathBT(curr.lChild)
  rightMax = self.maxLengthPathBT(curr.rChild)
  if leftMax > max
    max = leftMax
  end
  if rightMax > max
    max = rightMax
  end
  return max
end

def numLeafNodes(curr = @root)
  if curr == nil
    return 0
  end
  if curr.lChild == nil and curr.rChild == nil
    return 1
  else
    return (self.numLeafNodes(curr.rChild) + self.numLeafNodes(curr.lChild))
  end
end

def sumAllBT(curr = @root)
  if curr == nil
    return 0
  end
  rightSum = self.sumAllBT(curr.rChild)
  leftSum = self.sumAllBT(curr.lChild)
  sum = rightSum + leftSum + curr.value
  return sum
end

def iterativePreOrder()
  stk = []
  if @root != nil
    stk.push(@root)
  end
  while stk.size != 0
    curr = stk.pop()
    print curr.value , " "
    if curr.rChild != nil
      stk.push(curr.rChild)
    end
    if curr.lChild != nil
      stk.push(curr.lChild)
    end
  end
end

def isBST3(curr = @root)
  if curr == nil
    return true
  end
  if curr.lChild != nil and self.FindMax(curr.lChild).value > curr.value
    return false
  end
  if curr.rChild != nil and self.FindMin(curr.rChild).value < curr.value
    return false
  end
  return (self.isBST3(curr.lChild) and self.isBST3(curr.rChild))
end

def isBst()
  return self.isBSTUtil(@root, -1000000, 1000000)
end

def isBSTUtil(curr, min, max)
  if curr == nil
    return true
  end
  if curr.value < min or curr.value > max
    return false
  end
  return self.isBSTUtil(curr.lChild, min, curr.value) && self.isBSTUtil(curr.rChild, curr.value, max)
end

def isBST2()
  c = [-10000000]
  return self.isBST2Util(@root, c)
end

def isBST2Util(curr, count) #  in order  traversal
  if curr != nil
    ret = self.isBST2Util(curr.lChild, count)
    if not ret
      return false
    end
    if count[0] > curr.value
      return false
    end
    count[0] = curr.value
    ret = self.isBST2Util(curr.rChild, count)
    if not ret
      return false
    end
  end
  return true
end

def printAllPath()
  stk = []
  self.printAllPathUtil(@root, stk)
end

def printAllPathUtil(curr, stk)
  if curr == nil
    return
  end
  stk.push(curr.value)
  if curr.lChild == nil and curr.rChild == nil
    print stk, "\n"
    stk.pop()
    return
  end
  self.printAllPathUtil(curr.rChild, stk)
  self.printAllPathUtil(curr.lChild, stk)
  stk.pop()
end

def LCA(first, second)
  ans = self.LCAUtil(@root, first, second)
  if ans != nil
    return ans.value
  else
    return -1000000
  end
end

def LCAUtil(curr, first, second)
  if curr == nil
    return nil
  end
  if curr.value == first or curr.value == second
    return curr
  end
  left = self.LCAUtil(curr.lChild, first, second)
  right = self.LCAUtil(curr.rChild, first, second)
  if left != nil and right != nil
    return curr
  elsif left != nil
    return left
  else
    return right
  end
end

def LcaBST(first, second)
  return self.LcaBSTUtil(@root, first, second)
end

def LcaBSTUtil(curr, first, second)
  if curr == nil
    return 1000000
  end
  if curr.value > first and curr.value > second
    return self.LcaBSTUtil(curr.lChild, first, second)
  end
  if curr.value < first and curr.value < second
    return self.LcaBSTUtil(curr.rChild, first, second)
  end
  return curr.value
end

def trimOutsideRange(min, max, curr = @root)
  if curr == nil
    return nil
  end
  curr.lChild = self.trimOutsideRange(min, max, curr.lChild)
  curr.rChild = self.trimOutsideRange(min, max, curr.rChild)
  if curr.value < min
    return curr.rChild
  end
  if curr.value > max
    return curr.lChild
  end
  return curr
end

def printInRange(min, max, curr = @root)
  if curr == nil
    return
  end
  self.printInRange(min, max, curr.lChild)
  if curr.value >= min and curr.value <= max
    print curr.value , " "
  end
  self.printInRange(min, max, curr.rChild)
end

def FloorBST(val)
  curr = @root
  ceil = -1000000
  floor = 1000000
  while curr != nil
    if curr.value == val
      ceil = curr.value
      floor = curr.value
      break
    elsif curr.value > val
      ceil = curr.value
      curr = curr.lChild
    else
      floor = curr.value
      curr = curr.rChild
    end
  end
  return floor
end

def CeilBST(val)
  curr = @root
  ceil = -1000000
  floor = 1000000
  while curr != nil
    if curr.value == val
      ceil = curr.value
      floor = curr.value
      break
    elsif curr.value > val
      ceil = curr.value
      curr = curr.lChild
    else
      floor = curr.value
      curr = curr.rChild
    end
  end
  return ceil
end

def findMaxBT(curr = @root)
  if curr == nil
    return -1000000
  end
  max = curr.value
  left = self.findMaxBT(curr.lChild)
  right = self.findMaxBT(curr.rChild)
  if left > max
    max = left
  end
  if right > max
    max = right
  end
  return max
end

def searchBT(value, curr = @root)
  if curr == nil
    return false
  end
  if curr.value == value
    return true
  end
  left = self.searchBT( value, curr.lChild)
  if left
    return true
  end
  right = self.searchBT( value, curr.rChild)
  if right
    return true
  end
  return false
end

def CreateBinaryTree(arr)
  @root = self.CreateBinaryTreeUtil(arr, 0, arr.size - 1)
end

def CreateBinaryTreeUtil(arr, start, end2)
  curr = nil
  if start > end2
    return nil
  end
  mid = (start + end2) / 2
  curr = Node.new(arr[mid])
  curr.lChild = self.CreateBinaryTreeUtil(arr, start, mid - 1)
  curr.rChild = self.CreateBinaryTreeUtil(arr, mid + 1, end2)
  return curr
end

t = Tree.new()
arr =[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
t.CreateBinaryTree(arr)
t.InsertNode(11)
t.PrintInOrder()
#puts t.Find(5)
#puts t.Find2(5)
#puts t.FindMin()
#puts t.FindMax()
#
#t.DeleteNode(5)
#puts ""
t.PrintInOrder()
puts t.isBST3()
puts t.isBst()
puts t.isBST2()
puts t.FloorBST(6)
puts t.CeilBST(6)
puts t.LCA(4,7)
puts ""
t.PrintInOrder()
puts ""
puts ""
t.printInRange(4,7)
puts ""
t.trimOutsideRange(4,7)
puts ""
t.PrintInOrder()
t.Free()
t.PrintInOrder()

#t = Tree.new()
#arr =[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#t.levelOrderBinaryTree(arr)
#t2 = Tree.new()
#t2.levelOrderBinaryTree(arr)
#print "tree depth : ", t.TreeDepth()
#puts ""
#print "tree numNodes : ", t.numNodes()
#puts ""
#print "tree numFullNodesBT : ", t.numFullNodesBT()
#puts ""
#print "tree maxLengthPathBT : ", t.maxLengthPathBT()
#puts ""
#print "tree numLeafNodes : ", t.numLeafNodes()
#puts ""
#print "tree sumAllBT : ", t.sumAllBT()
#puts ""
#print "tree isEqual : ", t.isEqual(t2)
#puts ""
#t3 = t.CopyTree()
#print "tree isEqual : ", t.isEqual(t3)
#puts ""
#t3 = t.CopyMirrorTree()
#t3.PrintBredthFirst()
#puts ""
#t.PrintBredthFirst()
#puts ""
#
#print "findMaxBT", t.findMaxBT()
#puts ""
#puts t.searchBT(6)
#puts t.searchBT(21)
#
#t.printAllPath()
#puts ""
#t.PrintDepthFirst()
#puts ""
#t.PrintInOrder()
#puts ""
#t.NthInOrder(4)
#puts ""
#t.PrintPostOrder()
#puts ""
#t.NthPostOrder(4)
#puts ""
#t.PrintPreOrder()
#puts ""
#t.iterativePreOrder()
#puts ""
#t.NthPreOrder(4)
#puts ""
#puts t.LCA(4,7)