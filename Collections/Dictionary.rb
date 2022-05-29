# Create a Dictionary or map.
hm = {}  # hm = Hash.new

# Put elements into the Dictionary or map
hm["Apple"] = 40
hm["Banana"] = 30
hm["Mango"] = 50
puts "Total number of fruits :: #{hm.size}"
puts hm

hm.each do |key, value|
    puts "#{key} cost : #{value}"
end

puts "Apple cost :: #{hm["Apple"]}" 
puts "Apple present :: #{hm.key?("Apple")}" 
puts "Grape present :: #{hm.key?("Grape")}"
hm.delete("Apple")
puts "Mango present :: #{hm.key?("Apple")}" 

=begin 
Total number of fruits :: 3
{"Apple"=>40, "Banana"=>30, "Mango"=>50}
Apple cost : 40
Banana cost : 30
Mango cost : 50
Apple cost :: 40
Apple present :: true
Grape present :: false
Mango present :: false
=end