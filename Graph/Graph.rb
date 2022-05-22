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

class Graph	
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

	attr_accessor :count, :Adj
    def initialize( cnt)
        self.count = cnt
        self.Adj =  Array.new(cnt, nil)
        i = 0
        while (i < cnt)
            self.Adj[i] = Array.new()
            i += 1
        end
    end
	
    def addEdge( source,  dest,  cost = 1)
        edge = Edge.new(source, dest, cost)
        self.Adj[source].append(edge)
    end
	
    def addUndirectedEdge( source,  dest,  cost = 1)
        self.addEdge(source, dest, cost)
        self.addEdge(dest, source, cost)
    end
	
    def display()
        i = 0
        while (i < self.count)
            ad = self.Adj[i]
            print("Vertex " + i.to_s + " is connected to : ")
            for adn in ad do
            	print(adn.dest.to_s + "(cost: " + adn.cost.to_s + ") ")
            end
            print("\n")
            i += 1
        end
    end
	
    def dfsStack( source,  target)
        visited = Array.new(self.count){false}
        stk =  []
        stk.push(source)
        visited[source] = true
        while ((stk.length == 0) == false)
            curr = stk.pop()
            adl = self.Adj[curr]
            for adn in adl do
            if (visited[adn.dest] == false)
                visited[adn.dest] = true
                stk.push(adn.dest)
            end
            end
        end
        return visited[target]
    end
	
    def dfs( source,  target)
        visited = Array.new(self.count){false}
        self.dfsUtil(source, visited)
        return visited[target]
    end
	
    def dfsUtil( index,  visited)
        visited[index] = true
        adl = self.Adj[index]
        for adn in adl do
			if (visited[adn.dest] == false)
				self.dfsUtil(adn.dest, visited)
			end
        end
    end
	
    def dfsUtil2( index,  visited,  stk)
        visited[index] = true
        adl = self.Adj[index]
        for adn in adl do
			if (visited[adn.dest] == false)
				self.dfsUtil2(adn.dest, visited, stk)
			end
        end
        stk.push(index)
    end
	
    def bfs( source,  target)
        visited = Array.new(self.count){false}
        que =  Queue.new()
        que.push(source)
        visited[source] = true
        while (que.empty? == false)
            curr = que.pop()
            adl = self.Adj[curr]
            for adn in adl do
				if (visited[adn.dest] == false)
					visited[adn.dest] = true
					que.push(adn.dest)
				end
            end
        end
        return visited[target]
    end
	
    def self.main0()
        gph = Graph.new(4)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(0, 2)
        gph.addUndirectedEdge(1, 2)
        gph.addUndirectedEdge(2, 3)
        gph.display()
    end
	
    # Testing Code
    def self.main1()
        gph = Graph.new(8)
        gph.addUndirectedEdge(0, 3)
        gph.addUndirectedEdge(0, 2)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(1, 4)
        gph.addUndirectedEdge(2, 5)
        gph.addUndirectedEdge(3, 6)
        gph.addUndirectedEdge(6, 7)
        gph.addUndirectedEdge(5, 7)
        gph.addUndirectedEdge(4, 7)
        print("Path between 0 & 6 : " + gph.dfs(0, 6).to_s,"\n")
        print("Path between 0 & 6 : " + gph.bfs(0, 6).to_s,"\n")
        print("Path between 0 & 6 : " + gph.dfsStack(0, 6).to_s,"\n")
    end
    # Path between 0 & 6 : true
    # Path between 0 & 6 : true
    # Path between 0 & 6 : true
    def topologicalSort()
        stk =  []
        visited = Array.new(self.count){false}
        i = 0
        while (i < self.count)
            if (visited[i] == false)
                self.dfsUtil2(i, visited, stk)
            end
            i += 1
        end
        print("Topological Sort::")
        while ((stk.length == 0) != true)
            print(" " + stk.pop().to_s)
        end
    end
	
    # Testing Code
    def self.main2()
        gph = Graph.new(9)
        gph.addEdge(0, 2)
        gph.addEdge(1, 2)
        gph.addEdge(1, 3)
        gph.addEdge(1, 4)
        gph.addEdge(3, 2)
        gph.addEdge(3, 5)
        gph.addEdge(4, 5)
        gph.addEdge(4, 6)
        gph.addEdge(5, 7)
        gph.addEdge(6, 7)
        gph.addEdge(7, 8)
        gph.topologicalSort()
    end
    # Topological Sort:: 1 4 6 3 5 7 8 0 2

    def pathExist( source,  dest)
        visited = Array.new(self.count){false}
        self.dfsUtil(source, visited)
        return visited[dest]
    end
	
    def countAllPathDFS( visited,  source,  dest)
        if (source == dest)
            return 1
        end
        count = 0
        visited[source] = true
        adl = self.Adj[source]
        for adn in adl do
			if (visited[adn.dest] == false)
				count += self.countAllPathDFS(visited, adn.dest, dest)
			end
        end
        visited[source] = false
        return count
    end
	
    def countAllPath( src,  dest)
        visited = Array.new(self.count){false}
        return self.countAllPathDFS(visited, src, dest)
    end
	
    def printAllPathDFS( visited,  source,  dest,  path)
        path.push(source)
        if (source == dest)
            print(path,"\n")
            path.pop()
            return
        end
        visited[source] = true
        adl = self.Adj[source]
        for adn in adl do
			if (visited[adn.dest] == false)
				self.printAllPathDFS(visited, adn.dest, dest, path)
			end
        end
        visited[source] = false
        path.pop()
    end
	
    def printAllPath( src,  dest)
        visited = Array.new(self.count){false}
        path =  []
        self.printAllPathDFS(visited, src, dest, path)
    end
	
    # Testing Code
    def self.main3()
        gph = Graph.new(5)
        gph.addEdge(0, 1)
        gph.addEdge(0, 2)
        gph.addEdge(2, 3)
        gph.addEdge(1, 3)
        gph.addEdge(3, 4)
        gph.addEdge(1, 4)
        gph.display()
        print("PathExist :: " + gph.pathExist(0, 4).to_s,"\n")
        print("Path Count :: " + gph.countAllPath(0, 4).to_s,"\n")
        gph.printAllPath(0, 4)
    end
    # Vertex 0 is connected to : 1(cost: 1) 2(cost: 1) 
    # Vertex 1 is connected to : 3(cost: 1) 4(cost: 1) 
    # Vertex 2 is connected to : 3(cost: 1) 
    # Vertex 3 is connected to : 4(cost: 1) 
    # Vertex 4 is connected to : 
    # PathExist :: true
    # Path Count :: 3
    # [0, 1, 3, 4]
    # [0, 1, 4]
    # [0, 2, 3, 4]

    def rootVertex()
        visited = Array.new(self.count){false}
        retVal = -1
        i = 0
        while (i < self.count)
            if (visited[i] == false)
                self.dfsUtil(i, visited)
                retVal = i
            end
            i += 1
        end
        print("Root vertex is :: " + retVal.to_s)
        return retVal
    end
	
    # Testing Code
    def self.main4()
        gph = Graph.new(7)
        gph.addEdge(0, 1)
        gph.addEdge(0, 2)
        gph.addEdge(1, 3)
        gph.addEdge(4, 1)
        gph.addEdge(6, 4)
        gph.addEdge(5, 6)
        gph.addEdge(5, 2)
        gph.addEdge(6, 0)
        gph.rootVertex()
    end
    # Root vertex is :: 5
    def transitiveClosureUtil( source,  dest,  tc)
        tc[source][dest] = 1
        adl = self.Adj[dest]
        for adn in adl do
			if (tc[source][adn.dest] == 0)
				self.transitiveClosureUtil(source, adn.dest, tc)
			end
        end
    end
	
    def transitiveClosure()
        tc = Array.new(self.count){Array.new(self.count){0}}
        i = 0
        while (i < self.count)
            self.transitiveClosureUtil(i, i, tc)
            i += 1
        end
        return tc
    end
	
    # Testing Code
    def self.main5()
        gph = Graph.new(4)
        gph.addEdge(0, 1)
        gph.addEdge(0, 2)
        gph.addEdge(1, 2)
        gph.addEdge(2, 0)
        gph.addEdge(2, 3)
        gph.addEdge(3, 3)
        tc = gph.transitiveClosure()
        i = 0
        while (i < 4)
            j = 0
            while (j < 4)
                print(tc[i][j].to_s + " ")
                j += 1
            end
            print("\n")
            i += 1
        end
    end
    # 1 1 1 1 
    # 1 1 1 1 
    # 1 1 1 1 
    # 0 0 0 1

    def bfsLevelNode( source)
        visited = Array.new(self.count){false}
        level = Array.new(self.count){0}
        visited[source] = true
        que =  Queue.new()
        que.push(source)
        level[source] = 0
        print("Node  - Level","\n")
        while (que.empty? == false)
            curr = que.pop()
            depth = level[curr]
            adl = self.Adj[curr]
            print(curr.to_s + " - " + depth.to_s,"\n")
            for adn in adl do
				if (visited[adn.dest] == false)
					visited[adn.dest] = true
					que.push(adn.dest)
					level[adn.dest] = depth + 1
				end
            end
        end
    end
	
    def bfsDistance( source,  dest)
        visited = Array.new(self.count){false}
        que =  Queue.new()
        que.push(source)
        visited[source] = true
        level = Array.new(self.count){0}
        level[source] = 0
        while (que.empty? == false)
            curr = que.pop()
            depth = level[curr]
            adl = self.Adj[curr]
            for adn in adl do
				if (adn.dest == dest)
					return depth + 1
				end
				if (visited[adn.dest] == false)
					visited[adn.dest] = true
					que.push(adn.dest)
					level[adn.dest] = depth + 1
				end
            end
        end
        return -1
    end
	
    # Testing Code
    def self.main6()
        gph = Graph.new(7)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(0, 2)
        gph.addUndirectedEdge(0, 4)
        gph.addUndirectedEdge(1, 2)
        gph.addUndirectedEdge(2, 5)
        gph.addUndirectedEdge(3, 4)
        gph.addUndirectedEdge(4, 5)
        gph.addUndirectedEdge(4, 6)
        gph.bfsLevelNode(1)
        print("BfsDistance(1, 6) : " + gph.bfsDistance(1, 6).to_s,"\n")
    end
    # Node  - Level
    # 1 - 0
    # 0 - 1
    # 2 - 1
    # 4 - 2
    # 5 - 2
    # 3 - 3
    # 6 - 3
    # BfsDistance :: 3

    def isCyclePresentUndirectedDFS( index,  parentIndex,  visited)
        visited[index] = true
        adl = self.Adj[index]
        for adn in adl do
			dest = adn.dest
			if (visited[dest] == false)
				if (self.isCyclePresentUndirectedDFS(dest, index, visited))
					return true
				end
			elsif (parentIndex != dest)
				return true
			end
        end
        return false
    end
	
    def isCyclePresentUndirected()
        visited = Array.new(self.count){false}
        i = 0
        while (i < self.count)
            if (visited[i] == false && self.isCyclePresentUndirectedDFS(i, -1, visited))
                return true
            end
            i += 1
        end
        return false
    end
	
    def findRootParent( parent,  index)
        p = parent[index]
        while (p != -1)
            index = p
            p = parent[index]
        end
        return index
    end
	
    def unionParent( parent,  x,  y)
        parent[y] = x
    end
	
    def isCyclePresentUndirected2()
        parent = Array.new(self.count){-1}
        edge =  Array.new()
        flags = Array.new(self.count){Array.new(self.count){false}}
        i = 0
        while (i < self.count)
            ad = self.Adj[i]
            for adn in ad do
				# Using flags[][] array, if considered edge x to y,
				# then ignore edge y to x.
				if (flags[adn.dest][adn.src] == false)
					edge.append(adn)
					flags[adn.src][adn.dest] = true
				end
            end
            i += 1
        end
        for e in edge do
			x = self.findRootParent(parent, e.src)
			y = self.findRootParent(parent, e.dest)
			if (x == y)
				return true
			end
			self.unionParent(parent, x, y)
        end
        return false
    end
	
    def isCyclePresentUndirected3()
        # Different subsets are created.
        sets = Array.new(self.count){nil}
        i = 0
        while (i < self.count)
            sets[i] = Set.new(i, 0)
            i += 1
        end
        edge =  Array.new()
        flags = Array.new(self.count){Array.new(self.count){false}}
        i = 0
        while (i < self.count)
            ad = self.Adj[i]
            for adn in ad do
				# Using flags[][] array, if considered edge x to y,
				# then ignore edge y to x.
				if (flags[adn.dest][adn.src] == false)
					edge.append(adn)
					flags[adn.src][adn.dest] = true
				end
            end
            i += 1
        end
        for e in edge do
        x = self.find(sets, e.src)
        y = self.find(sets, e.dest)
        if (x == y)
            return true
        end
        self.union(sets, x, y)
        end
        return false
    end
	
    # Testing Code
    def self.main7()
        gph = Graph.new(6)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(1, 2)
        gph.addUndirectedEdge(3, 4)
        gph.addUndirectedEdge(4, 2)
        gph.addUndirectedEdge(2, 5)
        print("Cycle Presen : " + gph.isCyclePresentUndirected().to_s,"\n")
        print("Cycle Presen : " + gph.isCyclePresentUndirected2().to_s,"\n")
        print("Cycle Presen : " + gph.isCyclePresentUndirected3().to_s,"\n")
        gph.addUndirectedEdge(4, 1)
        print("Cycle Presen : " + gph.isCyclePresentUndirected().to_s,"\n")
        print("Cycle Presen : " + gph.isCyclePresentUndirected2().to_s,"\n")
        print("Cycle Presen : " + gph.isCyclePresentUndirected3().to_s,"\n")
    end
    # Cycle Presen : false
    # Cycle Presen : false
    # Cycle Presen : false
    # Cycle Presen : true
    # Cycle Presen : true
    # Cycle Presen : true

    def isCyclePresentDFS( index,  visited,  marked)
        visited[index] = true
        marked[index] = 1
        adl = self.Adj[index]
        for adn in adl do
			dest = adn.dest
			if (marked[dest] == 1)
				return true
			end
			if (visited[dest] == false)
				if (self.isCyclePresentDFS(dest, visited, marked))
					return true
				end
			end
        end
        marked[index] = 0
        return false
    end
	
    def isCyclePresent()
        visited = Array.new(self.count){false}
        marked = Array.new(self.count){0}
        index = 0
        while (index < self.count)
            if (!visited[index])
                if (self.isCyclePresentDFS(index, visited, marked))
                    return true
                end
            end
            index += 1
        end
        return false
    end
	
    def isCyclePresentDFSColour( index,  visited)
        visited[index] = 1
        # 1 = grey
        adl = self.Adj[index]
        for adn in adl do
			dest = adn.dest
			if (visited[dest] == 1)
				# "Grey":
				return true
			end
			if (visited[dest] == 0)
				# "White":
				if (self.isCyclePresentDFSColour(dest, visited))
					return true
				end
			end
        end
        visited[index] = 2
        # "Black"
        return false
    end
	
    def isCyclePresentColour()
        visited = Array.new(self.count){0}
        i = 0
        while (i < self.count)
            if (visited[i] == 0)
                # "White"
                if (self.isCyclePresentDFSColour(i, visited))
                    return true
                end
            end
            i += 1
        end
        return false
    end
	
    # Testing Code
    def self.main8()
        gph = Graph.new(5)
        gph.addEdge(0, 1)
        gph.addEdge(0, 2)
        gph.addEdge(2, 3)
        gph.addEdge(1, 3)
        gph.addEdge(3, 4)
        print("isCyclePresent : " + gph.isCyclePresent().to_s,"\n")
        print("isCyclePresent : " + gph.isCyclePresentColour().to_s,"\n")
        gph.addEdge(4, 1)
        print("isCyclePresent : " + gph.isCyclePresent().to_s,"\n")
        print("isCyclePresent : " + gph.isCyclePresentColour().to_s,"\n")
    end
    # isCyclePresent : false
    # isCyclePresent : false
    # isCyclePresent : true
    # isCyclePresent : true

    def transposeGraph()
        g = Graph.new(self.count)
        i = 0
        while (i < self.count)
            adl = self.Adj[i]
            for adn in adl do
				dest = adn.dest
				g.addEdge(dest, i)
            end
            i += 1
        end
        return g
    end
	
    # Testing Code
    def self.main9()
        gph = Graph.new(5)
        gph.addEdge(0, 1)
        gph.addEdge(0, 2)
        gph.addEdge(2, 3)
        gph.addEdge(1, 3)
        gph.addEdge(3, 4)
        gph.addEdge(4, 1)
        gReversed = gph.transposeGraph()
        gReversed.display()
    end
    # Vertex 0 is connected to : 
    # Vertex 1 is connected to : 0(cost: 1) 4(cost: 1) 
    # Vertex 2 is connected to : 0(cost: 1) 
    # Vertex 3 is connected to : 1(cost: 1) 2(cost: 1) 
    # Vertex 4 is connected to : 3(cost: 1)

    def isConnectedUndirected()
        visited = Array.new(self.count){false}
        self.dfsUtil(0, visited)
        i = 0
        while (i < self.count)
            if (visited[i] == false)
                return false
            end
            i += 1
        end
        return true
    end
	
    # Testing Code
    def self.main10A()
        gph = Graph.new(6)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(1, 2)
        gph.addUndirectedEdge(3, 4)
        gph.addUndirectedEdge(4, 2)
        gph.addUndirectedEdge(2, 5)
        print("isConnectedUndirected:: " + gph.isConnectedUndirected().to_s,"\n")
    end
    # isConnectedUndirected:: true

    def isStronglyConnected()
        visited = Array.new(self.count){false}
        self.dfsUtil(0, visited)
        i = 0
        while (i < self.count)
            if (visited[i] == false)
                return false
            end
            i += 1
        end
        gReversed = self.transposeGraph()
        i = 0
        while (i < self.count)
            visited[i] = false
            i += 1
        end
        gReversed.dfsUtil(0, visited)
        i = 0
        while (i < self.count)
            if (visited[i] == false)
                return false
            end
            i += 1
        end
        return true
    end
	
    # Testing Code
    def self.main10()
        gph = Graph.new(5)
        gph.addEdge(0, 1)
        gph.addEdge(1, 2)
        gph.addEdge(2, 3)
        gph.addEdge(3, 0)
        gph.addEdge(2, 4)
        gph.addEdge(4, 2)
        print("IsStronglyConnected:: " + gph.isStronglyConnected().to_s,"\n")
    end
    # IsStronglyConnected:: true

    def stronglyConnectedComponent()
        visited = Array.new(self.count){false}
        stk =  []
        i = 0
        while (i < self.count)
            if (visited[i] == false)
                self.dfsUtil2(i, visited, stk)
            end
            i += 1
        end
        gReversed = self.transposeGraph()
        visited = Array.new(self.count){false}
        stk2 =  []
        while ((stk.length == 0) == false)
            index = stk.pop()
            if (visited[index] == false)
                stk2.clear()
                gReversed.dfsUtil2(index, visited, stk2)
                print(stk2,"\n")
            end
        end
    end
	
    # Testing Code
    def self.main11()
        gph = Graph.new(7)
        gph.addEdge(0, 1)
        gph.addEdge(1, 2)
        gph.addEdge(2, 0)
        gph.addEdge(2, 3)
        gph.addEdge(3, 4)
        gph.addEdge(4, 5)
        gph.addEdge(5, 3)
        gph.addEdge(5, 6)
        gph.stronglyConnectedComponent()
    end
    # [1, 2, 0]
    # [4, 5, 3]
    # [6]

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
            node = queue.queue.remove()
            visited[source] = true
            source = node.dest
            adl = self.Adj[source]
            for adn in adl do
				dest = adn.dest
				alt = adn.cost
				if (dist[dest] > alt && visited[dest] == false)
					dist[dest] = alt
					previous[dest] = source
					node = Edge.new(source, dest, alt)
					queue.add(node)
				end
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

    class Set
        # Define the accessor and reader of class Set
        attr_reader :parent,:rank
        attr_accessor :parent,:rank
        def initialize( p,  r)
            self.parent = p
            self.rank = r
        end
    end

    # root element of set
    def find( sets,  index)
        p = sets[index].parent
        while (p != index)
            index = p
            p = sets[index].parent
        end
        return index
    end

    # consider x and y are roots of sets.
    def union( sets,  x,  y)
        if (sets[x].rank < sets[y].rank)
            sets[x].parent = y
        elsif (sets[y].rank < sets[x].rank)
            sets[y].parent = x
        else
            sets[x].parent = y
            sets[y].rank += 1
        end
    end
	
    def kruskalMST()
        # Different subsets are created.
        sets = Array.new(self.count){nil}
        i = 0
        while (i < self.count)
            sets[i] = Set.new(i, 0)
            i += 1
        end
        # Edges are added to array and sorted.
        _E = 0
        edge = Array.new()
        i = 0
        while (i < self.count)
            ad = self.Adj[i]
            for adn in ad do
            	edge.append(adn)
				_E += 1
            end
            i += 1
        end
        edge.sort! {|x, y| x.cost <=> y.cost}
        sum = 0
        output = "Edges are "
        i = 0
        while (i < _E)
            x = self.find(sets, edge[i].src)
            y = self.find(sets, edge[i].dest)
            if (x != y)
                output += ("(" + edge[i].src.to_s + "->" + edge[i].dest.to_s + " @ " + edge[i].cost.to_s + ") ")
                sum += edge[i].cost
                self.union(sets, x, y)
            end
            i += 1
        end
        print(output,"\n")
        print("Total MST cost: " + sum.to_s,"\n")
    end
	
    # Testing Code
    def self.main12()
        gph = Graph.new(9)
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
        print("\n")
        gph.primsMST()
        print("\n")
        gph.kruskalMST()
        print("\n")
        gph.dijkstra(0)
    end
    # Edges are (0->1 @ 4) (5->2 @ 4) (2->3 @ 7) (3->4 @ 9) (6->5 @ 2) (7->6 @ 1) (0->7 @ 8) (2->8 @ 2) 
    # Total MST cost: 37
    # Edges are (6->7 @ 1) (2->8 @ 2) (5->6 @ 2) (0->1 @ 4) (2->5 @ 4) (2->3 @ 7) (0->7 @ 8) (3->4 @ 9) 
    # Total MST cost: 37
    # Shortest Paths: (0->1 @ 4) (0->1->2 @ 12) (0->1->2->3 @ 19) (0->7->6->5->4 @ 21) (0->7->6->5 @ 11) (0->7->6 @ 9) (0->7 @ 8) (0->1->2->8 @ 14)
    # Unweighed graph

    def shortestPath( source)
        distance = Array.new(self.count){0}
        path = Array.new(self.count){0}
        i = 0
        while (i < self.count)
            distance[i] = -1
            path[i] = -1
            i += 1
        end
        que =  Queue.new()
        que.push(source)
        distance[source] = 0
        path[source] = source
        while (que.empty? == false)
            curr = que.pop()
            adl = self.Adj[curr]
            for adn in adl do
				if (distance[adn.dest] == -1)
					distance[adn.dest] = distance[curr] + 1
					path[adn.dest] = curr
					que.push(adn.dest)
				end
            end
        end
        self.printPath(path, distance, self.count, source)
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
	
    def dijkstra( source)
        previous = Array.new(self.count){-1}
        dist = Array.new(self.count){99999}
        visited = Array.new(self.count){false}

        dist[source] = 0
        previous[source] = source
        queue =  Heap.new(true)
        edge = Edge.new(source, source, 0)
        queue.add(edge)
        while (queue.isEmpty() != true)
            edge = queue.queue.remove()
            curr = edge.dest
            visited[curr] = true
            adl = self.Adj[curr]
            for adn in adl do
            dest = adn.dest
            alt = adn.cost + dist[curr]
            if (alt < dist[dest] && visited[dest] == false)
                dist[dest] = alt
                previous[dest] = curr
                edge = Edge.new(curr, dest, alt)
                queue.add(edge)
            end
            end
        end
        self.printPath(previous, dist, self.count, source)
    end
	
    def bellmanFordShortestPath( source)
        distance = Array.new(self.count){99999}
        path = Array.new(self.count){-1}
        distance[source] = 0
        path[source] = source
        i = 0
        # Outer loop will run (V-1) number of times.
        # Inner for loop and while loop runs combined will
        # run for Edges number of times.
        # Which make the total complexity as O(V*E)
        while (i < self.count - 1)
            j = 0
            while (j < self.count)
                adl = self.Adj[j]
                for adn in adl do
					newDistance = distance[j] + adn.cost
					if (distance[adn.dest] > newDistance)
						distance[adn.dest] = newDistance
						path[adn.dest] = j
					end
                end
                j += 1
            end
            i += 1
        end
        self.printPath(path, distance, self.count, source)
    end
	
    # Testing Code
    def self.main13()
        gph = Graph.new(5)
        gph.addEdge(0, 1, 3)
        gph.addEdge(0, 4, 2)
        gph.addEdge(1, 2, 1)
        gph.addEdge(2, 3, 1)
        gph.addEdge(4, 1, -2)
        gph.addEdge(4, 3, 1)
        gph.bellmanFordShortestPath(0)
    end
    # Shortest Paths: (0->4->1 @ 0) (0->4->1->2 @ 1) (0->4->1->2->3 @ 2) (0->4 @ 2)

    def self.heightTreeParentArr( arr)
        count = arr.length
        heightArr = Array.new(count){0}
        gph = Graph.new(count)
        source = 0
        i = 0
        while (i < count)
            if (arr[i] != -1)
                gph.addEdge(arr[i], i)
            else
                source = i
            end
            i += 1
        end
        visited = Array.new(count){false}
        visited[source] = true
        que =  Queue.new()
        que.push(source)
        heightArr[source] = 0
        maxHight = 0
        while (que.empty? == false)
            curr = que.pop()
            height = heightArr[curr]
            if (height > maxHight)
                maxHight = height
            end
            adl = gph.Adj[curr]
            for adn in adl do
            if (visited[adn.dest] == false)
                visited[adn.dest] = true
                que.push(adn.dest)
                heightArr[adn.dest] = height + 1
            end
            end
        end
        return maxHight
    end
	
    def self.getHeight( arr,  height,  index)
        if (arr[index] == -1)
            return 0
        else
            return self.getHeight(arr, height, arr[index]) + 1
        end
    end
	
    def self.heightTreeParentArr2( arr)
        count = arr.length
        height = Array.new(count){0}
        maxHeight = -1
        i = 0
        while (i < count)
            height[i] = self.getHeight(arr, height, i)
            maxHeight = [maxHeight,height[i]].max()
            i += 1
        end
        return maxHeight
    end
	
    # Testing Code
    def self.main14()
        parentArray = [-1, 0, 1, 2, 3]
        print(self.heightTreeParentArr(parentArray),"\n")
        print(self.heightTreeParentArr2(parentArray),"\n")
    end
    # 4
    # 4

    def isConnected()
        visited = Array.new(self.count){false}
        # Find a vertex with non - zero degree
        # DFS traversal of graph from a vertex with non - zero degree
        i = 0
        while (i < self.count)
            adl = self.Adj[i]
            if (adl.size() > 0)
                self.dfsUtil(i, visited)
                break
            end
            i += 1
        end
        i = 0
        # Check if all non - zero degree count are visited
        while (i < self.count)
            adl = self.Adj[i]
            if (adl.size() > 0)
                if (visited[i] == false)
                    return false
                end
            end
            i += 1
        end
        return true
    end
	
    def isEulerian()
        # Check if all non - zero degree nodes are connected
        if (self.isConnected() == false)
            print("graph is not Eulerian","\n")
            return 0
        end
        # Count odd degree
        odd = 0
        inDegree = Array.new(self.count){0}
        outDegree = Array.new(self.count){0}
        i = 0
        while (i < self.count)
            adl = self.Adj[i]
            for adn in adl do
            outDegree[i] += 1
            inDegree[adn.dest] += 1
            end
            i += 1
        end
        i = 0
        while (i < self.count)
            if ((inDegree[i] + outDegree[i]) % 2 != 0)
                odd += 1
            end
            i += 1
        end

        if (odd == 0)
            print("graph is Eulerian","\n")
            return 2
        elsif (odd == 2)
            print("graph is Semi-Eulerian","\n")
            return 1
        else
            print("graph is not Eulerian","\n")
            return 0
        end
    end
	
    # Testing Code
    def self.main15()
        gph = Graph.new(5)
        gph.addEdge(1, 0)
        gph.addEdge(0, 2)
        gph.addEdge(2, 1)
        gph.addEdge(0, 3)
        gph.addEdge(3, 4)
        gph.isEulerian()
        gph.addEdge(4, 0)
        gph.isEulerian()
    end
    # graph is Semi-Eulerian
    # graph is Eulerian

    def isStronglyConnected2()
        visited = Array.new(self.count){false}
        # Find a vertex with non - zero degree
        index = 0
        while (index < self.count)
            adl = self.Adj[index]
            if (adl.size() > 0)
                break
            end
            index += 1
        end
        # DFS traversal of graph from a vertex with non - zero degree
        self.dfsUtil(index, visited)
        i = 0
        while (i < self.count)
            adl = self.Adj[i]
            if (visited[i] == false && adl.size() > 0)
                return false
            end
            i += 1
        end
        gReversed = self.transposeGraph()
        i = 0
        while (i < self.count)
            visited[i] = false
            i += 1
        end
        gReversed.dfsUtil(index, visited)
        i = 0
        while (i < self.count)
            adl = self.Adj[i]
            if (visited[i] == false && adl.size() > 0)
                return false
            end
            i += 1
        end
        return true
    end
	
    def isEulerianCycle()
        # Check if all non - zero degree count are connected
        inDegree = Array.new(self.count){0}
        outDegree = Array.new(self.count){0}
        if (!self.isStronglyConnected2())
            return false
        end
        i = 0
        # Check if in degree and out degree of every vertex is same
        while (i < self.count)
            adl = self.Adj[i]
            for adn in adl do
            outDegree[i] += 1
            inDegree[adn.dest] += 1
            end
            i += 1
        end
        i = 0
        while (i < self.count)
            if (inDegree[i] != outDegree[i])
                return false
            end
            i += 1
        end
        return true
    end
	
    # Testing Code
    def self.main16()
        gph = Graph.new(5)
        gph.addEdge(0, 1)
        gph.addEdge(1, 2)
        gph.addEdge(2, 0)
        gph.addEdge(0, 4)
        gph.addEdge(4, 3)
        gph.addEdge(3, 0)
        print(gph.isEulerianCycle(),"\n")
    end
    # true

    # Testing Code
    def self.main17()
        gph = Graph.new(7)
        gph.addEdge(0, 1)
        gph.addEdge(1, 2)
        gph.addEdge(2, 0)
        gph.addEdge(2, 3)
        gph.addEdge(3, 4)
        gph.addEdge(4, 5)
        gph.addEdge(5, 3)
        gph.addEdge(5, 6)
        gReversed = gph.transposeGraph()
        gReversed.display()
    end
    # Vertex 0 is connected to : 2(cost: 1) 
    # Vertex 1 is connected to : 0(cost: 1) 
    # Vertex 2 is connected to : 1(cost: 1) 
    # Vertex 3 is connected to : 2(cost: 1) 5(cost: 1) 
    # Vertex 4 is connected to : 3(cost: 1) 
    # Vertex 5 is connected to : 4(cost: 1) 
    # Vertex 6 is connected to : 5(cost: 1)

    # Testing Code
    def self.main18()
        gph = Graph.new(9)
        gph.addUndirectedEdge(0, 1)
        gph.addUndirectedEdge(0, 7)
        gph.addUndirectedEdge(1, 2)
        gph.addUndirectedEdge(1, 7)
        gph.addUndirectedEdge(2, 3)
        gph.addUndirectedEdge(2, 8)
        gph.addUndirectedEdge(2, 5)
        gph.addUndirectedEdge(3, 4)
        gph.addUndirectedEdge(3, 5)
        gph.addUndirectedEdge(4, 5)
        gph.addUndirectedEdge(5, 6)
        gph.addUndirectedEdge(6, 7)
        gph.addUndirectedEdge(6, 8)
        gph.addUndirectedEdge(7, 8)
        gph.shortestPath(0)
    end
    # Shortest Paths: (0->1 @ 1)(0->1->2 @ 2)(0->1->2->3 @ 3)(0->1->2->3->4 @ 4)(0->1->2->5 @ 3)(0->7->6 @ 2)(0->7 @ 1)(0->7->8 @ 2)
   
	def floydWarshall()
        _V = self.count
        dist = Array.new(_V){Array.new(_V){0}}
        path = Array.new(_V){Array.new(_V){0}}
        _INF = 99999
        i = 0
        while (i < _V)
            j = 0
            while (j < _V)
                dist[i][j] = _INF
                if (i == j)
                    path[i][j] = 0
                else
                    path[i][j] = -1
                end
                j += 1
            end
            i += 1
        end
        i = 0
        while (i < _V)
            adl = self.Adj[i]
            for adn in adl do
				path[adn.src][adn.dest] = adn.src
				dist[adn.src][adn.dest] = adn.cost
            end
            i += 1
        end
        k = 0
        # Pick intermediate vertices.
        while (k < _V)
            i = 0
            # Pick source vertices one by one.
            while (i < _V)
                j = 0
                # Pick destination vertices.
                while (j < _V)
                    # If we have a shorter path from i to j via k.
                    # then update dist[i][j] and  and path[i][j]
                    if (dist[i][k] + dist[k][j] < dist[i][j])
                        dist[i][j] = dist[i][k] + dist[k][j]
                        path[i][j] = path[k][j]
                    end
                    j += 1
                end
                # dist[i][i] is 0 in the start.
                # If there is a better path from i to i and is better path then we have -ve cycle.                //
                if (dist[i][i] < 0)
                    print("Negative-weight cycle found.","\n")
                    return
                end
                i += 1
            end
            k += 1
        end
        self.printSolution(dist, path, _V)
    end
	
    def printSolution( cost,  path,  _V)
        print("Shortest Paths : ")
        u = 0
        while (u < _V)
            v = 0
            while (v < _V)
                if (u != v && path[u][v] != -1)
                    print("(")
                    self.printPath2(path, u, v)
                    print(" @ " + cost[u][v].to_s + ") ")
                end
                v += 1
            end
            u += 1
        end
        print("\n")
    end
	
    def printPath2( path,  u,  v)
        if (path[u][v] == u)
            print(u.to_s + "->" + v.to_s)
            return
        end
        self.printPath2(path, u, path[u][v])
        print("->" + v.to_s)
    end

    # Testing code.
    def self.main19()
        gph = Graph.new(4)
        gph.addEdge(0, 0, 0)
        gph.addEdge(1, 1, 0)
        gph.addEdge(2, 2, 0)
        gph.addEdge(3, 3, 0)
        gph.addEdge(0, 1, 5)
        gph.addEdge(0, 3, 10)
        gph.addEdge(1, 2, 3)
        gph.addEdge(2, 3, 1)
        gph.floydWarshall()
    end
    # Shortest Paths : (0->1 @ 5) (0->1->2 @ 8) (0->1->2->3 @ 9) (1->2 @ 3) (1->2->3 @ 4) (2->3 @ 1)
    
	def self.main()
        main0()
        main1()
        main2()
        main3()
        main4()
        main5()
        main6()
        main7()
        main8()
        main9()
        main10A()
        main10()
        main11()
        main12()
        main13()
        main14()
        main15()
        main16()
        main17()
        main18()
        main19()
    end
end

Graph.main()