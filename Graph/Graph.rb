require_relative "PQ"

class AdjNode
  attr_accessor :source, :destination, :cost, :next
  def initialize(src, dst, cst=1)
    @source = src
    @destination = dst
    @cost = cst
    @next = nil
  end

  def compare(other)
    return @cost - other.cost
  end
end

class AdjList
  attr_accessor :head
  def initialize()
    @head = nil
  end
end

class Graph
  attr_accessor :size, :list
  def initialize(cnt = 0)
    @size = cnt
    @list = Array.new(cnt, nil)
    i = 0
    while i < cnt
      @list[i] = AdjList.new()
      @list[i].head = nil
      i += 1
    end
  end

  def AddEdge(source, destination, cost = 1)
    node = AdjNode.new(source, destination, cost)
    node.next = @list[source].head
    @list[source].head = node
  end

  def AddBiEdge(source, destination, cost = 1) #bi directional edge
    AddEdge(source, destination, cost)
    AddEdge(destination, source, cost)
  end

  def Print()
    i = 0
    while i < size
      ad = @list[i].head
      if ad != nil then
        print "Vertex " , i , " is connected to : \n"
        while ad != nil
          print ad.destination , " "
          ad = ad.next
        end
        puts ""
      end
      i += 1
    end
  end
end

def Dijkstra(gph, source)
  previous = Array.new(gph.size)
  dist = Array.new(gph.size)
  i = 0
  while i < gph.size
    previous[i] = -1
    dist[i] = 999999
    i += 1
  end #infinite
  dist[source] = 0
  previous[source] = -1
  queue = PriorityQueue.new([])
  node = AdjNode.new(source, source, 0)
  queue.add(node)
  while queue.size != 0
    node = queue.peek()
    queue.remove()
    adl = gph.list[node.destination]
    adn = adl.head
    while adn != nil
      alt = adn.cost + dist[adn.source]
      if alt < dist[adn.destination] then
        dist[adn.destination] = alt
        previous[adn.destination] = adn.source
        node = AdjNode.new(adn.source, adn.destination, alt)
        queue.add(node)
      end
      adn = adn.next
    end
  end
  size = gph.size
  i = 0
  while i < size
    if dist[i] == 999999 then
      print " node id " , i , "  prev " , previous[i] , " distance : Unreachable \n"
    else
      print " node id " , i , "  prev " , previous[i] , " distance : " , dist[i], "\n"
    end
    i += 1
  end
end

def Prims(gph)
  previous = Array.new(gph.size)
  dist = Array.new(gph.size)
  source = 1
  i = 0
  while i < gph.size
    previous[i] = -1
    dist[i] = 999999
    i += 1
  end
  dist[source] = 0
  previous[source] = -1
  queue = PriorityQueue.new([])
  node = AdjNode.new(source, source, 0)
  queue.add(node)
  while queue.size() != 0
    node = queue.peek()
    queue.remove()
    if dist[node.destination] < node.cost then
      next
    end
    dist[node.destination] = node.cost
    previous[node.destination] = node.source
    adl = gph.list[node.destination]
    adn = adl.head
    while adn != nil
      if previous[adn.destination] == -1 then
        node = AdjNode.new(adn.source, adn.destination, adn.cost)
        queue.add(node)
      end
      adn = adn.next
    end
  end
  # Printing result.
  size = gph.size
  i = 0
  while i < size
    if dist[i] == 999999 then
      print " node id " , i , "  prev " , previous[i] , " distance : Unreachable \n"
    else
      print " node id " , i , "  prev " , previous[i] , " distance : " , dist[i] ,"\n"
    end
    i += 1
  end
end

def TopologicalSortDFS(gph, index, visited, stk)
  head = gph.list[index].head
  while head != nil
    if visited[head.destination] == 0 then
      visited[head.destination] = 1
      TopologicalSortDFS(gph, head.destination, visited, stk)
    end
    head = head.next
  end
  stk.push(index)
end

def TopologicalSort(gph)
  stk = []
  size = gph.size
  visited = Array.new(size)
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  i = 0
  while i < size
    if visited[i] == 0 then
      visited[i] = 1
      TopologicalSortDFS(gph, i, visited, stk)
    end
    i += 1
  end
  print "topology order is : "
  while stk.size != 0
    print " " , stk.pop()
  end
  puts ""
end

def PathExist(gph, source, destination)
  size = gph.size
  visited = Array.new( size)
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  visited[source] = 1
  DFSRec(gph, source, visited)
  return visited[destination]
end

def DFSRec(gph, index, visited)
  head = gph.list[index].head
  while head != nil
    if visited[head.destination] == 0 then
      visited[head.destination] = 1
      #puts "visited stk rec #{head.destination}"
      DFSRec(gph, head.destination, visited)
    end
    head = head.next
  end
end

def DFS(gph)
  size = gph.size
  visited = Array.new( size)
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  i = 0
  while i < size
    if visited[i] == 0 then
      visited[i] = 1
      DFSRec(gph, i, visited)
    end
    i += 1
  end
end

def DFSStack(gph)
  size = gph.size
  visited = Array.new( size)
  stk = []
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  visited[0] = 1
  stk.push(0)
  while stk.size > 0
    curr = stk.pop()
    head = gph.list[curr].head
    while head != nil
      if visited[head.destination] == 0 then
        visited[head.destination] = 1
        puts "visited dfs stack #{head.destination}"
        stk.push(head.destination)
      end
      head = head.next
    end
  end
end

def DFS(gph)
  size = gph.size
  visited = Array.new( size)
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  i = 0
  while i < size
    if visited[i] == 0 then
      visited[i] = 1
      DFSRec(gph, i, visited)
    end
    i += 1
  end
end

def BFSQueue(gph, index, visited)
  que = Queue.new()
  visited[index] = 1
  que.push(index)
  while que.size > 0
    curr = que.pop()
    head = gph.list[curr].head
    while head != nil
      if visited[head.destination] == 0 then
        puts "visited #{head.destination}"
        visited[head.destination] = 1
        que.push(head.destination)
      end
      head = head.next
    end
  end
end

def BFS(gph)
  size = gph.size
  visited = Array.new( size)
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  i = 0
  while i < size
    if visited[i] == 0 then
      BFSQueue(gph, i, visited)
    end
    i += 1
  end
end

def isConnected(gph)
  size = gph.size
  visited = Array.new( size)
  i = 0
  while i < size
    visited[i] = 0
    i += 1
  end
  visited[0] = 1
  DFSRec(gph, 0, visited)
  i = 0
  while i < size
    if visited[i] == 0 then
      return false
    end
    i += 1
  end
  return true
end

def ShortestPath(gph, source) # unweighted graph
  size = gph.size
  distance = Array.new( size)
  path = Array.new( size)
  que = Queue.new()
  i = 0
  while i < size
    distance[i] = -1
    i += 1
  end
  que.push(source)
  distance[source] = 0
  while que.size > 0
    curr = que.pop()
    head = gph.list[curr].head
    while head != nil
      if distance[head.destination] == -1 then
        distance[head.destination] = distance[curr] + 1
        path[head.destination] = curr
        que.push(head.destination)
      end
      head = head.next
    end
  end
  i = 0
  while i < size
    print path[i] , " to " , i , " weight " , distance[i], "\n"
    i += 1
  end
end

def BellmanFordShortestPath(gph, source)
  size = gph.size
  distance = Array.new( size)
  path = Array.new( size)
  i = 0
  while i < size
    distance[i] = 999999
    i += 1
  end
  distance[source] = 0
  i = 0
  while i < size - 1
    j = 0
    while j < size
      head = gph.list[j].head
      while head != nil
        newDistance = distance[j] + head.cost
        if distance[head.destination] > newDistance then
          distance[head.destination] = newDistance
          path[head.destination] = j
        end
        head = head.next
      end
      j += 1
    end
    i += 1
  end
  i = 0
  while i < size
    print path[i] , " to " , i , " weight " , distance[i], "\n"
    i += 1
  end
end

gph = Graph.new(9)
gph.AddBiEdge(0, 2, 1)
gph.AddBiEdge(1, 2, 5)
gph.AddBiEdge(1, 3, 7)
gph.AddBiEdge(1, 4, 9)
gph.AddBiEdge(3, 2, 2)
gph.AddBiEdge(3, 5, 4)
gph.AddBiEdge(4, 5, 6)
gph.AddBiEdge(4, 6, 3)
gph.AddBiEdge(5, 7, 5)
gph.AddBiEdge(6, 7, 7)
gph.AddBiEdge(7, 8, 17)
# gph.Print()
Prims(gph)
#Dijkstra(gph, 2)

def main3()
  g = Graph.new(9)
  g.AddEdge(0, 2, 1)
  g.AddBiEdge(1, 2, 5)
  g.AddEdge(1, 3, 7)
  g.AddEdge(1, 4, 9)
  g.AddEdge(3, 2, 2)
  g.AddEdge(3, 5, 4)
  g.AddEdge(4, 5, 6)
  g.AddEdge(4, 6, 3)
  g.AddEdge(5, 7, 1)
  g.AddEdge(6, 7, 7)
  g.AddEdge(7, 8, 17)
  #g.Print()
  #  print PathExist(g, 1, 0), "\n"
  #  print PathExist(g, 0, 1), "\n"
  #  print PathExist(g, 1, 2), "\n"
  #  DFS(g)
  #  puts ""
  #  DFSStack(g)
  #  puts ""
  #  BFS(g)
  #  puts ""
  print isConnected(g), "\n"
  ShortestPath(g, 1)
  BellmanFordShortestPath(g, 1)
end

#
main3()
#
##Dijkstra(gph,1);
#def tpTest()
#  g = Graph.new(6)
#  g.AddEdge(5, 2)
#  g.AddEdge(5, 0)
#  g.AddEdge(4, 0)
#  g.AddEdge(4, 1)
#  g.AddEdge(2, 3)
#  g.AddEdge(3, 1)
#  TopologicalSort(g)
#  #g.Print()
#end
