# Create a Dictionary or map.
hm = {} # (or hm = Hash.new)

# Put elements into the Dictionary or map
hm["Apple"] = 40
hm["Banana"] = 30
hm["Mango"] = 50
puts "Total number of fruits :: #{hm.size}"

hm.each do |key, value|
    puts "#{key}    cost :#{value}"
end
hm.delete("Mango")
puts "Apple present :: #{hm.key?("Apple")}" 
puts "Mango present :: #{hm.key?("Mango")}" 
puts "Grape present :: #{hm.key?("Grape")}"  

=begin 
Total number of fruits :: 3
Apple  cost :40
Banana  cost :30
Mango  cost :50
Apple present :: true
Mango present :: false
Grape present :: false 
=end