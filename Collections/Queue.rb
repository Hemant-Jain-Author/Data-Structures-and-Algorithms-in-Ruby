que = Queue.new()
que.push(1)
que.push(2)
que.push(3)

size = que.size
i = 0
while i < size
    print "Dequeue : " , que.pop(), "\n"
    i += 1
end

# Dequeue : 1
# Dequeue : 2
# Dequeue : 3

