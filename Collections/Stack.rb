stk = []
stk.push(1)
stk.push(2)
stk.push(3)

p "Size : " + stk.size.to_s
p "Stack : " + stk.to_s
p "Top : " + stk[-1].to_s
p "Pop : " + stk.pop().to_s
p "Stack : " + stk.to_s

=begin 
"Size : 3"
"Stack : [1, 2, 3]"
"Top : 3"
"Pop : 3"
"Stack : [1, 2]"
=end