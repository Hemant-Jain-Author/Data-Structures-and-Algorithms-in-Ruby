stk = []
stk.push(1)
stk.push(2)
stk.push(3)
stk.push(4)

size = stk.size
print "Element at top of stack ::" , stk[size -1], "\n"
i = 0
while i < size
  print "Pop from stack: " , stk.pop(), "\n"
  i += 1
end