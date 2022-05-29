arr = [1, 2, 3, 4]
p "Array : #{arr}"
p "arr[0] : #{arr[0]}"
p "arr[1] : #{arr[1]}"

p "Size : #{arr.length}" 
# p arr.count 
# p arr.size

p "Slice arr[0..2] : #{arr[0..2]}"

arr.append(5) 
# arr.push(5)

p "Array : #{arr}"
p "Size : #{arr.length}"
p "pop : #{arr.pop()}"
p "Array : #{arr}"
p "Size : #{arr.length}"

arr = Array.new()
# arr = []
p arr
arr[10] = 10
p arr

arr = Array.new(10){1}
p arr








