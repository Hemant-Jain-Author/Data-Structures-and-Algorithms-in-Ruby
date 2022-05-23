
INF = 99999

def shortestDist( graph,  n)
	# dist[i] is going to store shortest
	# distance from node i to node n-1.
	dist = Array.new(n){INF}
	path = Array.new(n){0}
	dist[0] = 0
	path[0] = -1
	i = 0 # Calculating shortest path for the nodes
	while (i < n)
		j = i # Check all nodes of next
		while (j < n)
			# Reject if no edge exists
			if (graph[i][j] == INF)
				j += 1
				next
			end
			value = graph[i][j] + dist[i]
			if (dist[j] > value)
				dist[j] = value
				path[j] = i
			end
			j += 1
		end
		i += 1
	end
	value = n - 1
	while (value != -1)
		print(value.to_s + " ")
		value = path[value]
	end
	print("\n")
	return dist[n - 1]
end

# Testing code.
# Graph stored in the form of an adjacency Matrix
graph = [
[INF, 1, 2, 5, INF, INF, INF, INF],
[INF, INF, INF, INF, 4, 11, INF, INF],
[INF, INF, INF, INF, 9, 5, 16, INF],
[INF, INF, INF, INF, INF, INF, 2, INF],
[INF, INF, INF, INF, INF, INF, INF, 18],
[INF, INF, INF, INF, INF, INF, INF, 13],
[INF, INF, INF, INF, INF, INF, INF, 2],
[INF, INF, INF, INF, INF, INF, INF, INF]]
print(shortestDist(graph, 8),"\n")

"""
7 6 3 0 
9
"""