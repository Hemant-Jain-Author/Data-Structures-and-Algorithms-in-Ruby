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

class GraphAM	
	class Edge
        attr_reader :src,:dest,:cost
        attr_accessor :src,:dest,:cost
        def initialize( s,  d,  c)
            self.src = s
            self.dest = d
            self.cost = c
        end

        def -(obj)
        	return self.cost - obj.cost
    	end
    end

	attr_accessor :count, :adj
    def initialize(cnt)
        self.count = cnt
        self.adj = Array.new(self.count){Array.new(self.count){0}}
    end

    def addEdge( src,  dst,  cost = 1)
        self.adj[src][dst] = cost
    end

    def addUndirectedEdge( src,  dst,  cost = 1)
        self.addEdge(src, dst, cost)
        self.addEdge(dst, src, cost)
    end

    def display()
        i = 0
        while (i < self.count)
            print("Vertex " + i.to_s + " is connected to : ")
            j = 0
            while (j < self.count)
                if (self.adj[i][j] != 0)
                    print(j.to_s + "(cost: " + self.adj[i][j].to_s + ") ")
                end
                j += 1
            end
            print("\n")
            i += 1
        end
    end

    # Testing code.
    def self.main1()
        gph = GraphAM.new(4)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(0, 2)
        gph.addUndirectedEdge(1, 2)
        gph.addUndirectedEdge(2, 3)
        gph.display()
    end

    def dijkstra( source)
        previous = Array.new(self.count){-1}
        dist = Array.new(self.count){99999}
        visited = Array.new(self.count){false}
        dist[source] = 0
        previous[source] = source
        queue =  Heap.new(true)
        node = Edge.new(source, source, 0)
        queue.add(node)
        while (queue.isEmpty() != true)
            node = queue.remove()
            src = node.dest
            visited[src] = true
            dest = 0
            while (dest < self.count)
                cost = self.adj[src][dest]
                if (cost != 0)
                    alt = cost + dist[src]
                    if (dist[dest] > alt && visited[dest] == false)
                        dist[dest] = alt
                        previous[dest] = src
                        node = Edge.new(src, dest, alt)
                        queue.add(node)
                    end
                end
                dest += 1
            end
        end
        self.printPath(previous, dist, self.count, source)
    end

    def printPathUtil( previous,  source,  dest)
        path = ""
        if (dest == source)
            path += source.to_s
        else
            path += self.printPathUtil(previous, source, previous[dest])
            path += ("->" + dest.to_s)
        end
        return path
    end

    def printPath( previous,  dist,  count,  source)
        output = "Shortest Paths: "
        i = 0
        while (i < count)
            if (dist[i] == 99999)
                output += ("(" + source.to_s + "->" + i.to_s + " @ Unreachable) ")
            elsif (i != previous[i])
                output += "("
                output += self.printPathUtil(previous, source, i)
                output += (" @ " + dist[i].to_s + ") ")
            end
            i += 1
        end
        print(output,"\n")
    end

    def primsMST()
        previous = Array.new(self.count){-1}
        dist = Array.new(self.count){99999}
        visited = Array.new(self.count){false}
        source = 0
        dist[source] = 0
        previous[source] = source
        queue =  Heap.new(true)
        node = Edge.new(source, source, 0)
        queue.add(node)
        while (queue.isEmpty() != true)
            node = queue.remove()
            source = node.dest
            visited[source] = true
            dest = 0
            while (dest < self.count)
                cost = self.adj[source][dest]
                if (cost != 0)
                    if (dist[dest] > cost && visited[dest] == false)
                        dist[dest] = cost
                        previous[dest] = source
                        node = Edge.new(source, dest, cost)
                        queue.add(node)
                    end
                end
                dest += 1
            end
        end
        # printing result.
        sum = 0
        isMst = true
        output = "Edges are "
        i = 0
        while (i < self.count)
            if (dist[i] == 99999)
                output += ("(" + i.to_s + ", Unreachable) ")
                isMst = false
            elsif (previous[i] != i)
                output += ("(" + previous[i].to_s + "->" + i.to_s + " @ " + dist[i].to_s + ") ")
                sum += dist[i]
            end
            i += 1
        end
        if (isMst)
            print(output,"\n")
            print("Total MST cost: " + sum.to_s,"\n")
        else
            print("Can\'t get a Spanning Tree","\n")
        end
    end

    # Testing code.
    def self.main2()
        gph = GraphAM.new(9)
        gph.addUndirectedEdge(0, 1, 4)
        gph.addUndirectedEdge(0, 7, 8)
        gph.addUndirectedEdge(1, 2, 8)
        gph.addUndirectedEdge(1, 7, 11)
        gph.addUndirectedEdge(2, 3, 7)
        gph.addUndirectedEdge(2, 8, 2)
        gph.addUndirectedEdge(2, 5, 4)
        gph.addUndirectedEdge(3, 4, 9)
        gph.addUndirectedEdge(3, 5, 14)
        gph.addUndirectedEdge(4, 5, 10)
        gph.addUndirectedEdge(5, 6, 2)
        gph.addUndirectedEdge(6, 7, 1)
        gph.addUndirectedEdge(6, 8, 6)
        gph.addUndirectedEdge(7, 8, 7)
        gph.primsMST()
    end

    # Edges are (0->1 @ 4) (5->2 @ 4) (2->3 @ 7) (3->4 @ 9) (6->5 @ 2) (7->6 @ 1) (0->7 @ 8) (2->8 @ 2) 
    # Total MST cost: 37
    # Testing code.

    def self.main3()
        gph = GraphAM.new(9)
        gph.addUndirectedEdge(0, 2, 1)
        gph.addUndirectedEdge(1, 2, 5)
        gph.addUndirectedEdge(1, 3, 7)
        gph.addUndirectedEdge(1, 4, 9)
        gph.addUndirectedEdge(3, 2, 2)
        gph.addUndirectedEdge(3, 5, 4)
        gph.addUndirectedEdge(4, 5, 6)
        gph.addUndirectedEdge(4, 6, 3)
        gph.addUndirectedEdge(5, 7, 1)
        gph.addUndirectedEdge(6, 7, 7)
        gph.addUndirectedEdge(7, 8, 17)
        gph.dijkstra(0)
    end

    # Shortest Paths: (0->2->1 @ 6) (0->2 @ 1) (0->2->3 @ 3) (0->2->3->5->4 @ 13) (0->2->3->5 @ 7) (0->2->3->5->7->6 @ 15) (0->2->3->5->7 @ 8) (0->2->3->5->7->8 @ 25)
    
	def hamiltonianPathUtil( path,  pSize,  added)
        # Base case full length path is found
        if (pSize == self.count)
            return true
        end
        vertex = 0
        while (vertex < self.count)
            # There is an edge from last element of path and next vertex
            # and the next vertex is not already included in the path.
            if (pSize == 0 || (self.adj[path[pSize - 1]][vertex] == 1 && added[vertex] == 0))
                path[pSize += 1] = vertex
                added[vertex] = 1
                if (self.hamiltonianPathUtil(path, pSize, added))
                    return true
                end
                # backtracking
                pSize -= 1
                added[vertex] = 0
            end
            vertex += 1
        end
        return false
    end

    def hamiltonianPath()
        path = Array.new(self.count){0}
        added = Array.new(self.count){0}
        if (self.hamiltonianPathUtil(path, 0, added))
            print("Hamiltonian Path found :: ")
            i = 0
            while (i < self.count)
                print(" " + path[i].to_s)
                i += 1
            end
            print("\n")
            return true
        end
        print("Hamiltonian Path not found","\n")
        return false
    end

    # Testing code.
    def self.main4()
        count = 5
        gph = GraphAM.new(count)
        adj =
        [
        [0, 1, 0, 1, 0],
        [1, 0, 1, 1, 0],
        [0, 1, 0, 0, 1],
        [1, 1, 0, 0, 1],
        [0, 1, 1, 1, 0]]
        i = 0
        while (i < count)
            j = 0
            while (j < count)
                if (adj[i][j] == 1)
                    gph.addEdge(i, j, 1)
                end
                j += 1
            end
            i += 1
        end
        print("hamiltonianPath : " + gph.hamiltonianPath().to_s,"\n")
        gph2 = GraphAM.new(count)
        adj2 =
        [
        [0, 1, 0, 1, 0],
        [1, 0, 1, 1, 0],
        [0, 1, 0, 0, 1],
        [1, 1, 0, 0, 0],
        [0, 1, 1, 0, 0]]
        i = 0
        while (i < count)
            j = 0
            while (j < count)
                if (adj2[i][j] == 1)
                    gph2.addEdge(i, j, 1)
                end
                j += 1
            end
            i += 1
        end
        print("hamiltonianPath :  " + gph2.hamiltonianPath().to_s,"\n")
    end

    # Hamiltonian Path found ::  0 1 2 4 3
    # hamiltonianPath : true
    # Hamiltonian Path found ::  0 3 1 2 4
    # hamiltonianPath :  true
    
	def hamiltonianCycleUtil( path,  pSize,  added)
        # Base case full length path is found
        # this last check can be modified to make it a path.
        if (pSize == self.count)
            if (self.adj[path[pSize - 1]][path[0]] == 1)
                path[pSize] = path[0]
                return true
            else
                return false
            end
        end
        vertex = 0
        while (vertex < self.count)
            # there is a path from last element and next vertex
            if (pSize == 0 || (self.adj[path[pSize - 1]][vertex] == 1 && added[vertex] == 0))
                path[pSize += 1] = vertex
                added[vertex] = 1
                if (self.hamiltonianCycleUtil(path, pSize, added))
                    return true
                end
                # backtracking
                pSize -= 1
                added[vertex] = 0
            end
            vertex += 1
        end
        return false
    end

    def hamiltonianCycle()
        path = Array.new(self.count + 1){0}
        added = Array.new(self.count){0}
        if (self.hamiltonianCycleUtil(path, 0, added))
            print("Hamiltonian Cycle found :: ")
            i = 0
            while (i <= self.count)
                print(" " + path[i].to_s)
                i += 1
            end
            print("","\n")
            return true
        end
        print("Hamiltonian Cycle not found","\n")
        return false
    end

    # Testing code.
    def self.main5()
        count = 5
        gph = GraphAM.new(count)
        adj =
        [
        [0, 1, 0, 1, 0],
        [1, 0, 1, 1, 0],
        [0, 1, 0, 0, 1],
        [1, 1, 0, 0, 1],
        [0, 1, 1, 1, 0]]
        i = 0
        while (i < count)
            j = 0
            while (j < count)
                if (adj[i][j] == 1)
                    gph.addEdge(i, j, 1)
                end
                j += 1
            end
            i += 1
        end
        print("hamiltonianCycle : " + gph.hamiltonianCycle().to_s,"\n")
        gph2 = GraphAM.new(count)
        adj2 =
        [
        [0, 1, 0, 1, 0],
        [1, 0, 1, 1, 0],
        [0, 1, 0, 0, 1],
        [1, 1, 0, 0, 0],
        [0, 1, 1, 0, 0]]
        i = 0
        while (i < count)
            j = 0
            while (j < count)
                if (adj2[i][j] == 1)
                    gph2.addEdge(i, j, 1)
                end
                j += 1
            end
            i += 1
        end
        print("hamiltonianCycle :  " + gph2.hamiltonianCycle().to_s,"\n")
    end

    # Hamiltonian Cycle found ::  0 1 2 4 3 0
    # hamiltonianCycle : true
    # Hamiltonian Cycle not found
    # hamiltonianCycle :  false

    def self.main()
        self.main1()
        self.main2()
        self.main3()
        self.main4()
        self.main5()
    end
end

GraphAM.main()