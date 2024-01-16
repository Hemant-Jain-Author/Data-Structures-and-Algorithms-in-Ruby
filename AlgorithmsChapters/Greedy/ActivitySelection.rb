class Activity 
	# Define the accessor of class Activity
	attr_reader :start,:stop
	attr_accessor :start,:stop
	def initialize( s,  f)
		self.start = s
		self.stop = f
	end
end

def maxActivities( s,  f,  n)
	act = Array.new(n){nil}
	i = 0
	while (i < n)
		act[i] = Activity.new(s[i], f[i])
		i += 1
	end

	act = act.sort_by(&:stop) # sort according to finish time.
	
	# The first activity at index 0 is always gets selected.
	i = 0
	print("Activities are : (" + act[i].start.to_s + "," + act[i].stop.to_s + ")")
	j = 1
	while (j < n)
		# Find next activity whose start time is greater than or equal
		# to the finish time of previous activity.
		if (act[j].start >= act[i].stop)
			print(", (" + act[j].start.to_s + "," + act[j].stop.to_s + ")")
			i = j
		end
		j += 1
	end
end

# Testing code.

s = [1, 5, 0, 3, 5, 6, 8]
f = [2, 6, 5, 4, 9, 7, 9]
n = s.length
maxActivities(s, f, n)

# Activities are : (1,2), (3,4), (5,6), (6,7), (8,9)
