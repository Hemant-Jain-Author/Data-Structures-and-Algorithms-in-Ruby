require 'set'

# Create a hash set.
hs = Set.new()

# add elements to the hash set.
hs.add("Banana")
hs.add("Apple")
hs.add("Mango")

#traverse
hs.each do |key|
    print "#{key} "
end

p hs
p "Size : #{hs.size}"
p "Apple present : #{hs.include?("Apple")}"
p "Grapes present : #{hs.include?("Grapes")}"
hs.delete("Apple")
p "Apple present : #{hs.include?("Apple")}"

=begin 
Banana Apple Mango 
#<Set: {"Banana", "Apple", "Mango"}>
"Size : 3"
"Apple present : true"
"Grapes present : false"
"Apple present : false"
=end