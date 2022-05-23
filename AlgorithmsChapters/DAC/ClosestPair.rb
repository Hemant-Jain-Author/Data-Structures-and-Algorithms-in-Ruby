class Point
	# Define the accessor and reader of class Point
	attr_reader :x,:y
	attr_accessor :x,:y
	def initialize( a,  b)
		self.x = a
		self.y = b
	end
end

def closestPairBF( arr)
	n = arr.length
	dmin = 99999
	i = 0
	while (i < n - 1)
		j = i + 1
		while (j < n)
			d = Math.sqrt((arr[i][0] - arr[j][0]) * (arr[i][0] - arr[j][0]) + (arr[i][1] - arr[j][1]) * (arr[i][1] - arr[j][1]))
			if (d < dmin)
				dmin = d
			end
			j += 1
		end
		i += 1
	end
	return dmin
end

def distance( a,  b)
	return Math.sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y))
end

def stripMin( q,  n,  d)
	min = d
	# Find the distance between all the points in the strip.
	# Array q is sorted according to the y axis coordinate.
	# The inner loop will run at most 6 times for each point.
	i = 0
	while (i < n)
		j = i + 1
		while (j < n && (q[j].y - q[i].y) < min)
			d = distance(q[i], q[j])
			if (d < min)
				min = d
			end
			j += 1
		end
		i += 1
	end
	return min
end

def closestPairUtil( p,  start,  stop,  q,  n)
	if (stop - start < 1)
		return 99999
	end
	if (stop - start == 1)
		return distance(p[start], p[stop])
	end
	# Find the middle point
	mid = (start + stop) / 2
	dl = closestPairUtil(p, start, mid, q, n)
	dr = closestPairUtil(p, mid + 1, stop, q, n)
	d = [dl,dr].min()
	# Build an array strip[] that contains points whose x axis coordinate
	# in the range p[mid]-d and p[mid]+d
	# Points are already sorted according to y axis.
	strip = Array.new(n){nil}
	j = 0
	i = 0
	while (i < n)
		if ((q[i].x - p[mid].x).abs < d)
			strip[j] = q[i]
			j += 1
		end
		i += 1
	end
	# Find the closest points in strip and compare with d.
	return [d,stripMin(strip, j, d)].min()
end

def closestPairDC( arr)
	n = arr.length
	p = Array.new(n){nil}
	i = 0
	while (i < n)
		p[i] = Point.new(arr[i][0], arr[i][1])
		i += 1
	end

	# Sort according to x axis.
	p.sort! {|x, y| x.x <=> y.x}
	q = p.clone()
	# Sort according to y axis.
	q.sort! {|x, y| x.y <=> y.y}
	return closestPairUtil(p, 0, n - 1, q, n)
end

 
arr = [[648, 896], [269, 879], [250, 922], [453, 347], [213, 17]]
print("Smallest distance is:" + closestPairBF(arr).to_s,"\n")
print("Smallest distance is:" + closestPairDC(arr).to_s,"\n")

"""
Smallest distance is:47.01063709417264
Smallest distance is:47.01063709417264
"""