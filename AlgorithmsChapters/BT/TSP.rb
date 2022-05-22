# Function to find the minimum weight Hamiltonian Cycle
def tspUtil( graph,  n,  path,  pSize,  pCost,  visited,  ans,  ansPath)
	if (pCost > ans)
		return ans
	end
	curr = path[pSize - 1]
	if (pSize == n)
		if (graph[curr][0] > 0 && ans > pCost + graph[curr][0])
			ans = pCost + graph[curr][0]
			i = 0
			while (i <= n)
				ansPath[i] = path[i % n]
				i += 1
			end
		end
		return ans
	end
	i = 0
	while (i < n)
		if (visited[i] == false && graph[curr][i] > 0)
			visited[i] = true
			path[pSize] = i
			ans = tspUtil(graph, n, path, pSize + 1, pCost + graph[curr][i], visited, ans, ansPath)
			visited[i] = false
		end
		i += 1
	end
	return ans
end

def tsp( graph,  n)
	visited = Array.new(n){false}
	path = Array.new(n){0}
	ansPath = Array.new(n + 1){0}
	path[0] = 0
	visited[0] = true
	ans = (2**(0.size*8-2))
	ans = tspUtil(graph, n, path, 1, 0, visited, ans, ansPath)
	print("Path length : " + ans.to_s,"\n")
	print("Path : ")
	i = 0
	while (i <= n)
		print(ansPath[i].to_s + " ")
		i += 1
	end
	return ans
end

n = 4
graph = [
[0, 10, 15, 20],
[10, 0, 35, 25],
[15, 35, 0, 30],
[20, 25, 30, 0]]

tsp(graph, n)

"""
Path length : 80
Path : 0 1 3 2 0 
"""