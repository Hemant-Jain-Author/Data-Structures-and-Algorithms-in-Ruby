deq = []
deq.append(1)
deq.append(2)
deq.append(3)
p "Size : #{deq.size}" 
p "Empty : #{deq.empty?}"
p "Deque : #{deq}"
p "First : #{deq.first}"
p "Last : #{deq.last}"

p "Remove : #{deq.shift}"
p "Deque : #{deq}"
p "Pop : #{deq.pop}"
p "Deque : #{deq}"

=begin 
"Size : 3"
"Empty : false"
"Deque : [1, 2, 3]"
"First : 1"
"Last : 3"
"Remove : 1"
"Deque : [2, 3]"
"Pop : 3"
"Deque : [2]"
=end