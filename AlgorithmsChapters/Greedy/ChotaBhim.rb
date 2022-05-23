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

def chotaBhim( cups)
	size = cups.length
	time = 60
	cups.sort! {|x, y| -x <=> -y}
	total = 0
	while (time > 0)
		total += cups[0]
		cups[0] = (cups[0] / 2.0).ceil.to_i
		index = 0
		temp = cups[0]
		while (index < size - 1 && temp < cups[index + 1])
			cups[index] = cups[index + 1]
			index += 1
		end
		cups[index] = temp
		time -= 1
	end
	print("Total : " + total.to_s,"\n")
	return total
end

def chotaBhim2( cups)
	size = cups.length
	time = 60
	pq = Heap.new(false)
	i = 0
	while (i < size)
		pq.add(cups[i])
		i += 1
	end

	total = 0
	while (time > 0)
		value = pq.remove()
		total += value
		value = (value / 2.0).ceil.to_i
		pq.add(value)
		time -= 1
	end
	print("Total : " + total.to_s,"\n")
	return total
end

# Testing code.
cups = [2, 1, 7, 4, 2]
chotaBhim(cups)
cups = [2, 1, 7, 4, 2]
chotaBhim2(cups)

"""
Total : 76
Total : 76
"""