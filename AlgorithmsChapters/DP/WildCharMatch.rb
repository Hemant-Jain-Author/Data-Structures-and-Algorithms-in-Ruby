def matchExp( exp,  str)
	return matchExpUtil(exp.chars, str.chars, 0, 0)
end

def matchExpUtil( exp,  str,  m,  n)
	if (m == exp.length && (n == str.length || exp[m - 1] == '*'))
		return true
	end
	if ((m == exp.length && n != str.length) || (m != exp.length && n == str.length))
		return false
	end
	if (exp[m] == '?' || exp[m] == str[n])
		return matchExpUtil(exp, str, m + 1, n + 1)
	end
	if (exp[m] == '*')
		return matchExpUtil(exp, str, m + 1, n) || matchExpUtil(exp, str, m, n + 1)
	end
	return false
end

def matchExpDP( exp,  str)
	return matchExpUtilDP(exp.chars, str.chars, exp.length, str.length)
end

def matchExpUtilDP( exp,  str,  m,  n)
	lookup = Array.new(m + 1){Array.new(n + 1){false}}
	lookup[0][0] = true
	
	# empty exp and empty str match.
	# 0 row will remain all false. empty exp cant match any str.
	# '*' can match with empty string, column 0 update.
	i = 1
	while (i <= m)
		if (exp[i - 1] == '*')
			lookup[i][0] = lookup[i - 1][0]
		else
			break
		end
		i += 1
	end

	i = 1
	# Fill the table in bottom-up fashion
	while (i <= m)
		j = 1
		while (j <= n)
			# If we see a '*' in pattern:
			# 1) We ignore '*' character and consider next character in the pattern.
			# 2) We ignore one character in the input str and consider next character.
			if (exp[i - 1] == '*')
				lookup[i][j] = lookup[i - 1][j] || lookup[i][j - 1]
			elsif (exp[i - 1] == '?' || str[j - 1] == exp[i - 1])
				lookup[i][j] = lookup[i - 1][j - 1]
			else
				lookup[i][j] = false
			end
			j += 1
		end
		i += 1
	end
	return lookup[m][n]
end


print("matchExp :: " + matchExp("*llo,?World?", "Hello, World!").to_s,"\n")
print("matchExp :: " + matchExpDP("*llo,?World?", "Hello, World!").to_s,"\n")
    
"""
matchExp :: true
matchExp :: true
"""