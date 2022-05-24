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

def kthSmallest( arr,  size,  k)
	arr.sort! {|x, y| x <=> y}
	return arr[k - 1]
end

def kthSmallest2( arr,  size,  k)
	pq =  Heap.new(true) # Min Heap
	i = 0
	while (i < size)
		pq.add(arr[i])
		i += 1
	end
	i = 0
	while (i < k - 1)
		pq.remove()
		i += 1
	end
	return pq.peek()
end

def kthSmallest3( arr,  size,  k)
	pq =  Heap.new(true) # Min Heap
	i = 0
	while (i < size)
		if (i < k)
			pq.add(arr[i])
		else
			if (pq.peek() > arr[i])
				pq.add(arr[i])
				pq.remove()
			end
		end
		i += 1
	end
	return pq.peek()
end

def kthLargest( arr,  size,  k)
	value = 0
	pq =  Heap.new(true) # Min Heap
	i = 0
	while (i < size)
		pq.add(arr[i])
		i += 1
	end
	i = 0
	while (i < k)
		value = pq.remove()
		i += 1
	end
	return value
end

def isMinHeap( arr,  size)
	parent = 0
	# last element index size - 1
	while (parent < (size / 2 + 1))
		lchild = parent * 2 + 1
		rchild = parent * 2 + 2
		# heap property check.
		if (((lchild < size) && (arr[parent] > arr[lchild])) || 
			((rchild < size) && (arr[parent] > arr[rchild])))
			return false
		end
		parent += 1
	end
	return true
end

def isMaxHeap( arr,  size)
	parent = 0
	# last element index size - 1
	while (parent < (size / 2 + 1))
		lchild = parent * 2 + 1
		rchild = lchild + 1
		# heap property check.
		if (((lchild < size) && (arr[parent] < arr[lchild])) || 
			((rchild < size) && (arr[parent] < arr[rchild])))
			return false
		end
		parent += 1
	end
	return true
end

def main1()
	arr = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("Kth Smallest :: " + kthSmallest(arr, arr.length, 3).to_s,"\n")
	arr2 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("Kth Smallest :: " + kthSmallest2(arr2, arr2.length, 3).to_s,"\n")
end

# Kth Smallest :: 5
# Kth Smallest :: 5

def main2()
	arr3 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("isMaxHeap :: " + isMaxHeap(arr3, arr3.length).to_s,"\n")
	arr4 = [ 1, 2, 3, 4, 5, 6, 7, 8]
	print("isMinHeap :: " + isMinHeap(arr4, arr4.length).to_s,"\n")
end

# isMaxHeap :: true
# isMinHeap :: true

def kSmallestProduct( arr,  size,  k)
	arr.sort! {|x, y| x <=> y}
	product = 1
	i = 0
	while (i < k)
		product *= arr[i]
		i += 1
	end
	return product
end

def swap( arr,  i,  j)
	temp = arr[i]
	arr[i] = arr[j]
	arr[j] = temp
end

def quickSelectUtil( arr,  lower,  upper,  k)
	if (upper <= lower)
		return
	end
	pivot = arr[lower]
	start = lower
	stop = upper
	while (lower < upper)
		while (lower < upper && arr[lower] <= pivot)
			lower += 1
		end
		while (lower <= upper && arr[upper] > pivot)
			upper -= 1
		end
		if (lower < upper)
			swap(arr, upper, lower)
		end
	end
	swap(arr, upper, start)
	# upper is the pivot position
	if (k < upper)
		quickSelectUtil(arr, start, upper - 1, k)
	end
	# pivot -1 is the upper for left sub array.
	if (k > upper)
		quickSelectUtil(arr, upper + 1, stop, k)
	end
end

def kSmallestProduct3( arr,  size,  k)
	quickSelectUtil(arr, 0, size - 1, k)
	product = 1
	i = 0
	while (i < k)
		product *= arr[i]
		i += 1
	end
	return product
end

def kSmallestProduct2( arr,  size,  k)
	pq =  Heap.new(true) # Min Heap
	i = 0
	product = 1
	i = 0
	while (i < size)
		pq.add(arr[i])
		i += 1
	end
	i = 0
	while (i < size && i < k)
		product *= pq.remove()
		i += 1
	end
	return product
end

def kSmallestProduct4( arr,  size,  k)
	pq =  Heap.new(false) # Max Heap
	i = 0
	while (i < size)
		if (i < k)
			pq.add(arr[i])
		else
			if (pq.peek() > arr[i])
				pq.add(arr[i])
				pq.remove()
			end
		end
		i += 1
	end
	product = 1
	i = 0
	while (i < k)
		product *= pq.remove()
		i += 1
	end
	return product
end

def main3()
	arr = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("Kth Smallest product:: " + kSmallestProduct(arr, 8, 3).to_s,"\n")
	arr2 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("Kth Smallest product:: " + kSmallestProduct2(arr2, 8, 3).to_s,"\n")
	arr3 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("Kth Smallest product:: " + kSmallestProduct3(arr3, 8, 3).to_s,"\n")
	arr4 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	print("Kth Smallest product:: " + kSmallestProduct4(arr4, 8, 3).to_s,"\n")
end

# Kth Smallest product:: 10 
# Kth Smallest product:: 10 
# Kth Smallest product:: 10
# Kth Smallest product:: 10

def printLargerHalf( arr,  size)
	arr.sort! {|x, y| x <=> y}
	i = size / 2
	while (i < size)
		print(arr[i].to_s + " ")
		i += 1
	end
	print("\n")
end

def printLargerHalf2( arr,  size)
	pq =  Heap.new(true) # Min Heap
	i = 0
	while (i < size)
		pq.add(arr[i])
		i += 1
	end
	i = 0
	while (i < size / 2)
		pq.remove()
		i += 1
	end
	pq.display()
end

def printLargerHalf3( arr,  size)
	quickSelectUtil(arr, 0, size - 1, size / 2)
	i = size / 2
	while (i < size)
		print(arr[i].to_s + " ")
		i += 1
	end
	print("\n")
end

def main4()
	arr = [ 8, 7, 6, 5, 7, 5, 2, 1]
	printLargerHalf(arr, 8)
	arr2 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	printLargerHalf2(arr2, 8)
	arr3 = [ 8, 7, 6, 5, 7, 5, 2, 1]
	printLargerHalf3(arr3, 8)
end

# 6 7 7 8 
# [6, 7, 7, 8] 
# 6 7 7 8

def sortK( arr,  size,  k)
	pq =  Heap.new(true) # Min Heap
	i = 0
	i = 0
	while (i < k)
		pq.add(arr[i])
		i += 1
	end
	output = Array.new(size){0}
	index = 0
	i = k
	while (i < size)
		output[index] = pq.remove()
		index += 1
		pq.add(arr[i])
		i += 1
	end
	while (pq.size() > 0) 
		output[index] = pq.remove()
		index += 1
	end
	i = 0
	while (i < size)
		arr[i] = output[i]
		i += 1
	end
end

# Testing Code
def main5()
	k = 3
	arr = [ 1, 5, 4, 10, 50, 9]
	size = arr.length
	sortK(arr, size, k)
	i = 0
	while (i < size)
		print(arr[i].to_s + " ")
		i += 1
	end
end

# 1 4 5 9 10 50

main1()
main2()
main3()
main4()
main5()

class MedianHeap
    # Define the accessor of class MedianHeap
    attr_accessor :minHeap,:maxHeap

    def initialize()
        self.minHeap =  Heap.new(true) # Min Heap
        self.maxHeap =  Heap.new(false) # Max Heap
    end
    # Other Methods.
    def add( value)
        if (self.maxHeap.size() == 0 || self.maxHeap.peek() >= value)
            self.maxHeap.add(value)
        else
            self.minHeap.add(value)
        end
        # size balancing
        if (self.maxHeap.size() > self.minHeap.size() + 1)
            value = self.maxHeap.remove()
            self.minHeap.add(value)
        end
        if (self.minHeap.size() > self.maxHeap.size() + 1)
            value = self.minHeap.remove()
            self.maxHeap.add(value)
        end
    end
    def getMedian()
        if (self.maxHeap.size() == 0 && self.minHeap.size() == 0)
            return 99999
        end
        if (self.maxHeap.size() == self.minHeap.size())
            return (self.maxHeap.peek() + self.minHeap.peek()) / 2
        elsif (self.maxHeap.size() > self.minHeap.size())
            return self.maxHeap.peek()
        else
            return self.minHeap.peek()
        end
    end
end

def main6()
	arr = [1, 9, 2, 8, 3, 7]
	hp = MedianHeap.new()
	i = 0
	while (i < 6)
		hp.add(arr[i])
		print("Median after addition of " + arr[i].to_s + " is  " + hp.getMedian().to_s,"\n")
		i += 1
	end
end

main6()

=begin 
Median after addition of 1 is  1
Median after addition of 9 is  5
Median after addition of 2 is  2
Median after addition of 8 is  5
Median after addition of 3 is  3
Median after addition of 7 is  5 
=end