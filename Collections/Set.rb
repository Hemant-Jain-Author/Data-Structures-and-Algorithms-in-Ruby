require 'set'

# Create a hash set.
hs = Set.new[]

# add elements to the hash set.
hs.add("India")
hs.add("USA")
hs.add("UK")
#traverse
hs.each do |key|
  puts "#{key} "
end

print "Set contains USA : " , hs.include?("USA")
puts ""
print "Set contains Russia : " , hs.include?("Russia")
puts ""
hs.delete("USA")
print "Set contains USA : " , hs.include?("USA")
