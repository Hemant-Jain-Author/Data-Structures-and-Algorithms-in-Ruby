def max( *arr)
	return arr.max()
end

class Job
	# Define the accessor and reader of class Job
	attr_reader :start,:stop,:value
	attr_accessor :start,:stop,:value
	def initialize( s,  f,  v)
		self.start = s
		self.stop = f
		self.value = v
	end
end

def maxValueJobUtil( arr,  n)
	# Base case
	if (n == 1)
		return arr[0].value
	end
	# Find Value when current job is included
	incl = arr[n - 1].value
	j = n - 1
	while (j >= 0)
		if (arr[j].stop <= arr[n - 1].start)
			incl += maxValueJobUtil(arr, j + 1)
			break
		end
		j -= 1
	end
	# Find Value when current job is excluded
	excl = maxValueJobUtil(arr, n - 1)
	return max(incl,excl)
end

def maxValueJobs( s,  f,  v,  n)
	act = Array.new(n){nil}
	i = 0
	while (i < n)
		act[i] = Job.new(s[i], f[i], v[i])
		i += 1
	end
	act = act.sort_by(&:stop)
	# sort according to finish time.
	return maxValueJobUtil(act, n)
end

def maxValueJobUtilTD( dp,  arr,  n)
	# Base case
	if (n == 0)
		return 0
	end
	if (dp[n - 1] != 0)
		return dp[n - 1]
	end
	# Find Value when current job is included
	incl = arr[n - 1].value
	j = n - 2
	while (j >= 0)
		if (arr[j].stop <= arr[n - 1].start)
			incl += maxValueJobUtilTD(dp, arr, j + 1)
			break
		end
		j -= 1
	end
	# Find Value when current job is excluded
	excl = maxValueJobUtilTD(dp, arr, n - 1)
	dp[n - 1] = max(incl,excl)
	return dp[n - 1]
end

def maxValueJobsTD( s,  f,  v,  n)
	act = Array.new(n){nil}
	i = 0
	while (i < n)
		act[i] = Job.new(s[i], f[i], v[i])
		i += 1
	end
	act = act.sort_by(&:stop)
	# sort according to finish time.
	dp = Array.new(n){0}
	return maxValueJobUtilTD(dp, act, n)
end

def maxValueJobsBU( s,  f,  v,  n)
	act = Array.new(n){nil}
	i = 0
	while (i < n)
		act[i] = Job.new(s[i], f[i], v[i])
		i += 1
	end
	act = act.sort_by(&:stop)
	# sort according to finish time.
	dp = Array.new(n){0}
	dp[0] = act[0].value
	i = 1
	while (i < n)
		incl = act[i].value
		j = i - 1
		while (j >= 0)
			if (act[j].stop <= act[i].start)
				incl += dp[j]
				break
			end
			j -= 1
		end
		dp[i] = max(incl,dp[i - 1])
		i += 1
	end
	return dp[n - 1]
end

start = [1, 5, 0, 3, 5, 6, 8]
finish = [2, 6, 5, 4, 9, 7, 9]
value = [2, 2, 4, 3, 10, 2, 8]
n = start.length
print(maxValueJobs(start, finish, value, n),"\n")
print(maxValueJobsTD(start, finish, value, n),"\n")
print(maxValueJobsBU(start, finish, value, n),"\n")