class BinaryIndexTree
    # Define the accessor of class BinaryIndexTree
    attr_accessor :BITS,:size

    def initialize( arr)
        self.size = arr.length
        self.BITS = Array.new(self.size + 1){0}
        i = 0
        # Populating BITS.
        while (i < self.size)
            self.update(i, arr[i])
            i += 1
        end
    end

    def set( arr,  index,  val)
        diff = val - arr[index]
        arr[index] = val
        # Difference is propagated.
        self.update(index, diff)
    end

    def update( index,  val)
        # Index in BITS is 1 more than the input array.
        index = index + 1
        # Traverse to ancestors of nodes.
        while (index <= self.size)
            # Add val to current node of Binary Index Tree.
            self.BITS[index] += val
            # Next element which need to store val.
            index += index & (-index)
        end
    end

    # Range sum in the range start to end.
    def rangeSum( start,  ed)
        # Check for error conditions.
        if (start > ed || start < 0 || ed > self.size - 1)
            print("Invalid Input.","\n")
            return -1
        end
        return self.prefixSum(ed) - self.prefixSum(start - 1)
    end

    # Prefix sum in the range 0 to index.
    def prefixSum( index)
        sum = 0
        index = index + 1
        # Traverse ancestors of Binary Index Tree nodes.
        while (index > 0)
            # Add current element to sum.
            sum += self.BITS[index]
            # Parent index calculation.
            index -= index & (-index)
        end
        return sum
    end
end


# Main function
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
tree = BinaryIndexTree.new(arr)
print("Sum of elements in range(0, 5): " + tree.prefixSum(5).to_s,"\n")
print("Sum of elements in range(2, 5): " + tree.rangeSum(2, 5).to_s,"\n")
# Set fourth element to 10.
tree.set(arr, 3, 10)
# Find sum after the value is updated
print("Sum of elements in range(0, 5): " + tree.prefixSum(5).to_s,"\n")


=begin 
Sum of elements in range(0, 5): 21
Sum of elements in range(2, 5): 18
Sum of elements in range(0, 5): 27
=end
