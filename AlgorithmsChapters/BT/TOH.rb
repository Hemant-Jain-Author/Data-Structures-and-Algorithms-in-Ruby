# Towers Of Hanoi problem.
def tohUtil( num,  from,  to,  temp)
	if (num < 1)
		return
	end
	tohUtil(num - 1, from, temp, to)
	print("Move disk " + num.to_s + " from peg " + from.to_s + " to peg " + to.to_s,"\n")
	tohUtil(num - 1, temp, to, from)
end

def toh( num)
	print("The sequence of moves involved in the Tower of Hanoi are :","\n")
	tohUtil(num, 'A', 'C', 'B')
end

toh(3)

"""
The sequence of moves involved in the Tower of Hanoi are :
Move disk 1 from peg A to peg C
Move disk 2 from peg A to peg B
Move disk 1 from peg C to peg B
Move disk 3 from peg A to peg C
Move disk 1 from peg B to peg A
Move disk 2 from peg B to peg C
Move disk 1 from peg A to peg C
"""