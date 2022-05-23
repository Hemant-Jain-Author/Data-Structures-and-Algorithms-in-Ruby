class RmqST
    # Define the accessor and reader of class RmqST
    attr_accessor :segArr,:n
    def initialize( input)
        self.n = input.length
        # Height of segment tree.
        x = (Math.log(self.n) / Math.log(2)).ceil.to_i
        # Maximum size of segment tree
        max_size = 2 * 2**x.to_i - 1
        # Allocate memory for segment tree
        self.segArr = Array.new(max_size){0}
        self.constructST(input, 0, self.n - 1, 0)
    end

    def constructST( input,  start,  ed,  index)
        # Store it in current node of the segment tree and return
        if (start == ed)
            self.segArr[index] = input[start]
            return input[start]
        end
        # If there are more than one elements,
        # then traverse left and right subtrees
        # and store the minimum of values in current node.
        mid = (start + ed) / 2
        self.segArr[index] = self.min(self.constructST(input, start, mid, index * 2 + 1), 
							self.constructST(input, mid + 1, ed, index * 2 + 2))
        return self.segArr[index]
    end

    def min( first,  second)
        if (first < second)
            return first
        else
            return second
        end
    end

    def getMin( start,  ed)
        # Check for error conditions.
        if (start > ed || start < 0 || ed > self.n - 1)
            print("Invalid Input.","\n")
            return 99999
        end
        return self.getMinUtil(0, self.n - 1, start, ed, 0)
    end

    def getMinUtil( segStart,  segEnd,  queryStart,  queryEnd,  index)
        if (queryStart <= segStart && segEnd <= queryEnd)
            # complete overlapping case.
            return self.segArr[index]
        end
        if (segEnd < queryStart || queryEnd < segStart)
            # no overlapping case.
            return 99999
        end
        # Segment tree is partly overlaps with the query range.
        mid = (segStart + segEnd) / 2
        return self.min(self.getMinUtil(segStart, mid, queryStart, queryEnd, 2 * index + 1), self.getMinUtil(mid + 1, segEnd, queryStart, queryEnd, 2 * index + 2))
    end

    def update( ind,  val)
        # Check for error conditions.
        if (ind < 0 || ind > self.n - 1)
            print("Invalid Input.","\n")
            return
        end
        # Update the values in segment tree
        self.updateUtil(0, self.n - 1, ind, val, 0)
    end

    # Always min inside valid range will be returned.
    def updateUtil( segStart,  segEnd,  ind,  val,  index)
        # Update index lies outside the range of current segment.
        # So minimum will not change.
        if (ind < segStart || ind > segEnd)
            return self.segArr[index]
        end
        # If the input index is in range of this node, then update the
        # value of the node and its children
        if (segStart == segEnd)
            if (segStart == ind)
                # Index value need to be updated.
                self.segArr[index] = val
                return val
            else
                return self.segArr[index]
            end
        end
        mid = (segStart + segEnd) / 2
        # Current node value is updated with min. 
        self.segArr[index] = self.min(self.updateUtil(segStart, mid, ind, val, 2 * index + 1), 
									self.updateUtil(mid + 1, segEnd, ind, val, 2 * index + 2))
        # Value of diff is propagated to the parent node.
        return self.segArr[index]
    end
end

arr = [2, 3, 1, 7, 12, 5]
tree = RmqST.new(arr)
print("Min value in the range(1, 5): " + tree.getMin(1, 5).to_s,"\n")
print("Min value of all the elements: " + tree.getMin(0, arr.length - 1).to_s,"\n")
tree.update(2, -1)
print("Min value in the range(1, 5): " + tree.getMin(1, 5).to_s,"\n")
print("Min value of all the elements: " + tree.getMin(0, arr.length - 1).to_s,"\n")
tree.update(5, -2)
print("Min value in the range(0, 4): " + tree.getMin(0, 4).to_s,"\n")
print("Min value of all the elements: " + tree.getMin(0, arr.length - 1).to_s,"\n")

=begin 
Min value in the range(1, 5): 1
Min value of all the elements: 1
Min value in the range(1, 5): -1
Min value of all the elements: -1
Min value in the range(0, 4): -1
Min value of all the elements: -2
=end
