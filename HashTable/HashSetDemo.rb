require 'set'

# Create a hash set.
hs = Set.new
hs.add("Banana")
hs.add("Apple")
hs.add("Mango")

#traverse
hs.each do |key|
  print "#{key} "
end
print("\n")

print(hs,"\n")
print("Apple present : " + hs.include?("Apple").to_s,"\n")
print("Grapes present : " + hs.include?("Grapes").to_s,"\n")
hs.delete("Apple")
print(hs,"\n")
print("Apple present : " + hs.include?("Apple").to_s,"\n")



=begin
Banana Apple Mango 
#<Set: {"Banana", "Apple", "Mango"}>
Apple present : true
Grapes present : false
#<Set: {"Banana", "Mango"}>
Apple present : false
=end