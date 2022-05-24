class Heap
    # Define the accessor of class Heap
    attr_accessor :CAPACITY,:size,:arr,:isMinHeap  
    
    def initialize(isMin = true)
        self.arr = Array.new(100){0} # The Heap array
        self.size = 0
        self.isMinHeap = isMin
    end

    def set(array)
        self.size = array.size
        self.arr = array.clone
        i = (self.size / 2)
        # Build Heap operation over array
        while (i >= 0)
            self.percolateDown(i)
            i -= 1
        end
    end

    def compare( arr,  first,  second)
        if (self.isMinHeap)
            return (arr[first] - arr[second]) > 0
        else
            return (arr[first] - arr[second]) < 0
        end
    end

    # Other Methods.
    def percolateDown( parent)
        lChild = 2 * parent + 1
        rChild = lChild + 1
        child = -1
        if (lChild < self.size)
            child = lChild
        end
        if (rChild < self.size && self.compare(self.arr, lChild, rChild))
            child = rChild
        end
        if (child != -1 && self.compare(self.arr, parent, child))
            temp = self.arr[parent]
            self.arr[parent] = self.arr[child]
            self.arr[child] = temp
            self.percolateDown(child)
        end
    end

    def percolateUp( child)
        parent = (child - 1) / 2
        if (parent >= 0 && self.compare(self.arr, parent, child))
            temp = self.arr[child]
            self.arr[child] = self.arr[parent]
            self.arr[parent] = temp
            self.percolateUp(parent)
        end
    end

    def isEmpty()
        return (self.size == 0)
    end

    def length()
        return self.size
    end

    def peek()
        if (self.isEmpty())
            raise StandardError, "HeapEmptyException"
        end
        return self.arr[0]
    end

    def add( value)
        if (self.size == self.arr.length)
            raise StandardError, "HeapFullException"
        end
        self.arr[self.size] = value
        self.size += 1
        self.percolateUp(self.size - 1)
    end

    def remove()
      if (self.isEmpty())
          raise StandardError, "HeapEmptyException"
      end
      value = self.arr[0]
      self.arr[0] = self.arr[self.size - 1]
      self.size -= 1
      self.percolateDown(0)
      return value
    end

    def display()
        print("Heap : ")
        i = 0
        while (i < self.size)
            print(self.arr[i].to_s + " ")
            i += 1
        end
        print("\n")
    end
end

class HuffmanTree
	class Node 
        # Define the accessor of class Node
        attr_accessor :c,:freq,:left,:right
        
        def initialize( ch,  fr,  l,  r)
            self.c = ch
            self.freq = fr
            self.left = l
            self.right = r
        end

		def -(obj)
        	return self.freq - obj.freq
    	end
    end

	attr_accessor :root

    def initialize( arr,  freq)
		self.root = nil;
        n = arr.length
		que = Heap.new(true)
        i = 0
        while (i < n)
            node = Node.new(arr[i], freq[i], nil, nil)
            que.add(node)
            i += 1
        end
        while (que.size() > 1)
            lt = que.remove()
            rt = que.remove()
            nd = Node.new('+', lt.freq + rt.freq, lt, rt)
            que.add(nd)
        end
        self.root = que.peek()
    end

    def printUtil( root,  s)
        if (root.left == nil && root.right == nil && root.c != '+')
            print(root.c.to_s + " = " + s,"\n")
            return
        end
        self.printUtil(root.left, s + "0")
        self.printUtil(root.right, s + "1")
    end

    def display()
        print("Char = Huffman code","\n")
        self.printUtil(self.root, "")
    end
end

# Testing code.
ar = ['A', 'B', 'C', 'D', 'E']
fr = [30, 25, 21, 14, 10]
hf = HuffmanTree.new(ar, fr)
hf.display()

"""
Char = Huffman code
C = 00
E = 010
D = 011
B = 10
A = 11
"""