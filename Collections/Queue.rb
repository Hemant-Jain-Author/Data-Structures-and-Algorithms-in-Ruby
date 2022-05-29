que = Queue.new()
que.push(1)
que.push(2)
que.push(3)

p "Size : " + que.size.to_s
p "Dequeue : " + que.pop().to_s
p "Dequeue : " + que.pop().to_s

=begin 
"Size : 3"
"Dequeue : 1"
"Dequeue : 2"
 =end
