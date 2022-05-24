require 'set'

# Create a hash set.
hs = Set.new()

# add elements to the hash set.
hs.add("Banana")
hs.add("Apple")
hs.add("Mango")

#traverse
hs.each do |key|
    puts "#{key} "
end
print hs
print "Apple present : " , hs.include?("Apple"), "\n"
print "Grapes present : " , hs.include?("Grapes"), "\n"
hs.delete("Apple")
print "Apple present : " , hs.include?("Apple"), "\n"

=begin 
Banana 
Apple 
Mango 
Apple present : true
Grapes present : false
Apple present : false 
=end