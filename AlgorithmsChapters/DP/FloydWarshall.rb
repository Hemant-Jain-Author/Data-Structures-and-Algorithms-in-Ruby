# Define the accessor and reader of class FloydWarshall
INF = 99999

def floydWarshall( graph,  ver)
	dist = Array.new(ver){Array.new(ver){0}}
	i = 0
	while (i < ver)
		j = 0
		while (j < ver)
			dist[i][j] = graph[i][j]
			j += 1
		end
		i += 1
	end
	k = 0
	# Pick intermediate vertices.
	while (k < ver)
		i = 0
		# Pick source vertices one by one.
		while (i < ver)
			j = 0
			# Pick destination vertices.
			while (j < ver)
				# If we have shorter path from i to j via k.
				# then update dist[i][j]
				if (dist[i][k] != INF && dist[k][j] != INF && dist[i][k] + dist[k][j] < dist[i][j])
					dist[i][j] = dist[i][k] + dist[k][j]
				end
				j += 1
			end
			i += 1
		end
		k += 1
	end
	# Print the shortest distance matrix
	printSolution(dist, ver)
end

def printSolution( dist,  ver)
	i = 0
	while (i < ver)
		j = 0
		while (j < ver)
			if (dist[i][j] == INF)
				print("INF ")
			else
				print(dist[i][j].to_s + " ")
			end
			j += 1
		end
		print("\n")
		i += 1
	end
end

graph =	[
[0, 2, 4, INF, INF, INF, INF],
[2, 0, 4, 1, INF, INF, INF],
[4, 4, 0, 2, 8, 4, INF],
[INF, 1, 2, 0, 3, INF, 6],
[INF, INF, 6, 4, 0, 3, 1],
[INF, INF, 4, INF, 4, 0, 2],
[INF, INF, INF, 4, 2, 3, 0]]
floydWarshall(graph, 7)
