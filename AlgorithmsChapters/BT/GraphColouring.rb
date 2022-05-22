def printSolution( colour,  vCount)
	print("Assigned colours are::")
	i = 0
	while (i < vCount)
		print(" " + colour[i].to_s)
		i += 1
	end
	print("\n")
end

# Check if the whole graph is coloured properly.
def isSafe2( graph,  colour,  vCount)
	i = 0
	while (i < vCount)
		j = i + 1
		while (j < vCount)
			if (graph[i][j] && colour[j] == colour[i])
				return false
			end
			j += 1
		end
		i += 1
	end
	return true
end

def graphColouring2Util( graph,  vCount,  m,  colour,  i)
	if (i == vCount)
		if (isSafe2(graph, colour, vCount))
			printSolution(colour, vCount)
			return true
		end
		return false
	end
	j = 1
	# Assign each colour from 1 to m
	while (j <= m)
		colour[i] = j
		if (graphColouring2Util(graph, vCount, m, colour, i + 1))
			return true
		end
		j += 1
	end
	return false
end

def graphColouring2( graph,  vCount,  m)
	colour = Array.new(vCount){0}
	if (graphColouring2Util(graph, vCount, m, colour, 0))
		return true
	end
	return false
end

# Is it safe to colour vth vertice with c colour.
def isSafe( graph,  vCount,  colour,  v,  c)
	i = 0
	while (i < vCount)
		if (graph[v][i] == true && c == colour[i])
			return false
		end
		i += 1
	end
	return true
end

def graphColouringUtil( graph,  vCount,  m,  colour,  i)
	if (i == vCount)
		printSolution(colour, vCount)
		return true
	end
	j = 1
	while (j <= m)
		if (isSafe(graph, vCount, colour, i, j))
			colour[i] = j
			if (graphColouringUtil(graph, vCount, m, colour, i + 1))
				return true
			end
		end
		j += 1
	end
	return false
end

def graphColouring( graph,  vCount,  m)
	colour = Array.new(vCount){0}
	if (graphColouringUtil(graph, vCount, m, colour, 0))
		return true
	end
	return false
end


graph =[
[false, true, false, false, true],
[true, false, true, false, true],
[false, true, false, true, true],
[false, false, true, false, true],
[true, true, true, true, false]]

v = 5
# Number of vertices
m = 4
# Number of colours
if (!graphColouring2(graph,v, m))
	print("Solution does not exist","\n")
end

if (!graphColouring(graph, v, m))
	print("Solution does not exist","\n")
end
    
"""
Assigned colours are:: 1 2 1 2 3
Assigned colours are:: 1 2 1 2 3
"""