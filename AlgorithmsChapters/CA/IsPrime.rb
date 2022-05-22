def isPrime( n)
	answer = (n > 1) ? true : false
	i = 2
	while (i * i <= n)
		if (n % i == 0)
			answer = false
			break
		end
		i += 1
	end
	return answer
end

print(isPrime(8),"\n")
print(isPrime(11),"\n")
