que = Queue.new()
que.push(1)
que.push(2)
que.push(3)
que.push(4)
que.push(5)
size = que.size
i = 0
while i < size
  print "Dequeue from queue: " , que.pop(), "\n"
  i += 1
end

