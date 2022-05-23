def feasible(queens,  k)
	i = 0
	while (i < k)
		if (queens[k] == queens[i] || (queens[i] - queens[k]).abs == (i - k).abs)
			return false
		end
		i += 1
	end
	return true
end

def nQueens(queens,  k,  n)
	if (k == n)
		print("#{queens}\n")
		return
	end
	i = 0
	while (i < n)
		queens[k] = i
		if (feasible(queens, k))
			nQueens(queens, k + 1, n)
		end
		i += 1
	end
end

queens = Array.new(8){0}
nQueens(queens, 0, 8)

"""
[0, 4, 7, 5, 2, 6, 1, 3]
[0, 5, 7, 2, 6, 3, 1, 4]
...
[7, 2, 0, 5, 1, 4, 6, 3]
[7, 3, 0, 2, 5, 1, 6, 4]
"""