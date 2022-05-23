class Heap
    # Define the accessor and reader of class Heap
    attr_accessor :CAPACITY,:size,:arr,:isMinHeap   
    
    def initialize(isMin = true)
        self.arr = Array.new(100){0} # The Heap array
        self.size = 0
        self.isMinHeap = isMin
    end

    def set(array)
        self.size = array.size
        self.arr = array.clone
        
        # Build Heap operation over array
        i = (self.size / 2)
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

    def delete( value)
        i = 0
        while (i < self.size)
            if (self.arr[i] == value)
                self.arr[i] = self.arr[self.size - 1]
                self.size -= 1
                self.percolateUp(i)
                self.percolateDown(i)
                return true
            end
            i += 1
        end
        return false
    end
end

def main1()
    hp = Heap.new(true)
    hp.add(1)
    hp.add(6)
    hp.add(5)
    hp.add(7)
    hp.add(3)
    hp.add(4)
    hp.add(2)
    hp.display()
    while (!hp.isEmpty()) 
      print(hp.remove().to_s + " ")
    end
    print "\n"
end
# 	1 3 2 7 6 5 4 
# 	1 2 3 4 5 6 7

def heapSort(array,  inc)
    # Create max heap for increasing order sorting.
    hp = Heap.new(!inc)
    hp.set(array)
    i = 0
    while (i < array.length)
        array[array.length - i - 1] = hp.remove()
        i += 1
    end
end

def main2()
    s = [1, 5, 9, 3, 2, 6, 8, 7, 4]
    heapSort(s,  true)
    print(s, "\n")
    s = [1, 5, 9, 3, 2, 6, 8, 7, 4]
    heapSort(s,  false)
    print(s, "\n")
end

main1()
main2()
