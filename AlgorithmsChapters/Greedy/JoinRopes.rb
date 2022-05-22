class Heap
    # Define the accessor and reader of class Heap
    attr_reader :CAPACITY,:size,:arr,:isMinHeap
    attr_accessor :CAPACITY,:size,:arr,:isMinHeap
    # Number of elements in Heap
    # The Heap array
    
    def initialize(isMin = true)
        self.arr = Array.new(100){0}
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


def joinRopes(ropes,  size)
	ropes.sort! {|x, y| -x <=> -y}
	total = 0
	value = 0
	length = size
	while (length >= 2)
		value = ropes[length - 1] + ropes[length - 2]
		total += value
		index = length - 2
		while (index > 0 && ropes[index - 1] < value)
			ropes[index] = ropes[index - 1]
			index -= 1
		end
		ropes[index] = value
		length -= 1
	end
	print("Total : " + total.to_s,"\n")
	return total
end

def joinRopes2( ropes,  size)
	pq =  Heap.new(true)
	i = 0
	i = 0
	while (i < size)
		pq.add(ropes[i])
		i += 1
	end
	total = 0
	value = 0
	while (pq.size() > 1)
		value = pq.remove()
		value += pq.remove()
		pq.add(value)
		total += value
	end
	print("Total : " + total.to_s,"\n")
	return total
end

# Testing code.
ropes = [4, 3, 2, 6]
joinRopes(ropes, ropes.length)
rope2 = [4, 3, 2, 6]
joinRopes2(rope2, rope2.length)
