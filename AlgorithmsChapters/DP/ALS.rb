def fastestWayBU2( a,  t,  e,  x,  n)
	f1 = Array.new(n){0}
	f2 = Array.new(n){0}
	# Time taken to leave first station.
	f1[0] = e[0] + a[0][0]
	f2[0] = e[1] + a[1][0]
	
	# Fill the tables f1[] and f2[] using
	# bottom up approach.
	i = 1
	while (i < n)
		f1[i] = [f1[i-1] + a[0][i], f2[i-1] + t[1][i-1] + a[0][i]].min
		f2[i] = [f2[i-1] + a[1][i], f1[i-1] + t[0][i-1] + a[1][i]].min
		i += 1
	end
	# Consider exit times and return minimum.
	return [f1[n-1] + x[0], f2[n-1] + x[1]].min
end

def fastestWayBU( a,  t,  e,  x,  n)
	f = Array.new(2){Array.new(n){0}}
	# Time taken to leave first station.
	f[0][0] = e[0] + a[0][0]
	f[1][0] = e[1] + a[1][0]
	
	# Fill the tables f1[] and f2[] using
	# bottom up approach.
	i = 1
	while (i < n)
		f[0][i] = [f[0][i - 1] + a[0][i],f[1][i - 1] + t[1][i - 1] + a[0][i]].min
		f[1][i] = [f[1][i - 1] + a[1][i],f[0][i - 1] + t[0][i - 1] + a[1][i]].min
		i += 1
	end
	# Consider exit times and return minimum.
	return [f[0][n - 1] + x[0],f[1][n - 1] + x[1]].min
end

def fastestWayTD( a,  t,  e,  x,  n)
	f = Array.new(2){Array.new(n){0}}
	# Time taken to leave first station.
	f[0][0] = e[0] + a[0][0]
	f[1][0] = e[1] + a[1][0]
	fastestWayTDUtil(f, a, t, n - 1)
	return [f[0][n - 1] + x[0],f[1][n - 1] + x[1]].min
end

def fastestWayTDUtil( f,  a,  t,  i)
	if (i == 0)
		return
	end
	fastestWayTDUtil(f, a, t, i - 1)
	# Fill the tables f1[] and f2[] using top-down approach.
	f[0][i] = [f[0][i - 1] + a[0][i],f[1][i - 1] + t[1][i - 1] + a[0][i]].min
	f[1][i] = [f[1][i - 1] + a[1][i],f[0][i - 1] + t[0][i - 1] + a[1][i]].min
end

# Driver code
a =[[7, 9, 3, 4, 8, 4],[8, 5, 6, 4, 5, 7]]
t =	[[2, 3, 1, 3, 4], [2, 1, 2, 2, 1]]
e =	[2, 4]
x =	[3, 2]
n = 6
print(fastestWayBU2(a, t, e, x, n),"\n")
print(fastestWayBU(a, t, e, x, n),"\n")
print(fastestWayTD(a, t, e, x, n),"\n")

"""
38
38
38
"""