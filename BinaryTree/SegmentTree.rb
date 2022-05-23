class SegmentTree
    # Define the accessor and reader of class SegmentTree
    attr_accessor :segArr,:size

    def initialize( input)
        self.size = input.length
        # Height of segment tree.
        x = (Math.log(self.size) / Math.log(2)).ceil.to_i
        # Maximum size of segment tree
        max_size = 99999
        # Allocate memory for segment tree
        self.segArr = Array.new(max_size){0}
        self.constructST(input, 0, self.size - 1, 0)
    end

    def constructST( input,  start,  ed,  index)
        # Store it in current node of the segment tree and return
        if (start == ed)
            self.segArr[index] = input[start]
            return input[start]
        end
        # If there are more than one elements,
        # then traverse left and right subtrees
        # and store the sum of values in current node.
        mid = (start + ed) / 2
        self.segArr[index] = self.constructST(input, start, mid, index * 2 + 1) + 
						self.constructST(input, mid + 1, ed, index * 2 + 2)
        return self.segArr[index]
    end

    def getSum( start,  ed)
        # Check for error conditions.
        if (start > ed || start < 0 || ed > self.size - 1)
            print("Invalid Input.","\n")
            return -1
        end
        return self.getSumUtil(0, self.size - 1, start, ed, 0)
    end

    def getSumUtil( segStart,  segEnd,  queryStart,  queryEnd,  index)
        if (queryStart <= segStart && segEnd <= queryEnd)
            # complete overlapping case.
            return self.segArr[index]
        end
        if (segEnd < queryStart || queryEnd < segStart)
            # no overlapping case.
            return 0
        end
        # Segment tree is partly overlaps with the query range.
        mid = (segStart + segEnd) / 2
        return self.getSumUtil(segStart, mid, queryStart, queryEnd, 2 * index + 1) + 
				self.getSumUtil(mid + 1, segEnd, queryStart, queryEnd, 2 * index + 2)
    end

    def set( arr,  ind,  val)
        # Check for error conditions.
        if (ind < 0 || ind > self.size - 1)
            print("Invalid Input.","\n")
            return
        end
        arr[ind] = val
        # Set new value in segment tree
        self.setUtil(0, self.size - 1, ind, val, 0)
    end

    # Always diff will be returned.
    def setUtil( segStart,  segEnd,  ind,  val,  index)
        # set index lies outside the range of current segment.
        # So diff to its parent node will be zero.
        if (ind < segStart || ind > segEnd)
            return 0
        end
        # If the input index is in range of this node, then set the
        # value of the node and its children
        if (segStart == segEnd)
            if (segStart == ind)
                # Index that need to be set.
                diff = val - self.segArr[index]
                self.segArr[index] = val
                return diff
            else
                return 0
            end
        end
        mid = (segStart + segEnd) / 2
        diff = self.setUtil(segStart, mid, ind, val, 2 * index + 1) + self.setUtil(mid + 1, segEnd, ind, val, 2 * index + 2)
        # Current node value is set with diff. 
        self.segArr[index] = self.segArr[index] + diff
        # Value of diff is propagated to the parent node.
        return diff
    end
end

arr = [1, 2, 4, 8, 16, 32, 64]
tree = SegmentTree.new(arr)
print("Sum of values in the range(0, 3): " + tree.getSum(1, 3).to_s,"\n")
print("Sum of values of all the elements: " + tree.getSum(0, arr.length - 1).to_s,"\n")
tree.set(arr, 1, 10)
print("Sum of values in the range(0, 3): " + tree.getSum(1, 3).to_s,"\n")
print("Sum of values of all the elements: " + tree.getSum(0, arr.length - 1).to_s,"\n")