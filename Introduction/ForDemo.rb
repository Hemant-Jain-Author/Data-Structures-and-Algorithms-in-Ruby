@text = "Hello, World!"
@PI = 3.141592653589793

def ConditionDemo()
  i = 13
  if i < 5
    # statements
    puts "Below 5 years, stay at home"
  end

  if i < 5
    # statements
    puts "Below 5 years, stay at home."
  else
    # statements
    puts "You can go out."
  end

  if i < 5
    # statements
    puts "Below 5 years, stay at home."
  elsif i < 20
    # statements
    puts "Below 20 years, you are studying."
  else
    # statements
    puts "Now you should earn."
  end

  val = i < 5 ? "Below 5 years, stay at home." : "You can go out."
  puts val

  i = 4
  val = case i
  when  0..4
    "Below 5 years, stay at home."
  when  5..20
    "Below 20 years, you are studying."
  else
    "Now you should earn."
  end
  puts val
end

def LoopDemo()
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  sum = 0
  i = 0
  while i < numbers.size
    sum += numbers[i]
    i += 1
  end
  print "Sum is :: " , sum
end

def LoopDemo2()
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  sum = 0
  i = 0
  begin
    sum += numbers[i]
    i += 1
  end while i < numbers.size
  print "Sum is :: " , sum
end

def LoopDemo3()
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  sum = 0
  i = 0
  loop do
    sum += numbers[i]
    i += 1
    if i >= numbers.size
      break
    end
  end
  print "Sum is :: " , sum
end

def LoopDemo4()
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  sum = 0
  i = 0
  for i in numbers
    sum += i
  end
  print "Sum is :: " , sum
end

# Testing code
ConditionDemo()
LoopDemo()
LoopDemo2()
LoopDemo3()
LoopDemo4()
