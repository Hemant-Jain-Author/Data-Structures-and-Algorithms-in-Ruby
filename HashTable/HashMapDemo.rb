# Create a hash map.
hm =  {}

# Put elements into the map
hm["Apple"] = 40
hm["Banana"] = 10
hm["Mango"] = 20

print("Size :: " + hm.size().to_s,"\n")

hm.each { |key,value|
print(key + " cost : " + hm[key].to_s,"\n")
}
print(hm,"\n")
print("Apple present ::" + hm.key?("Apple").to_s,"\n")
print("Grapes present :: " + hm.key?("Grapes").to_s,"\n")
hm.delete("Apple")
print("Apple present ::" + hm.key?("Apple").to_s,"\n")
print(hm,"\n")

=begin
Size :: 3
Apple cost : 40
Banana cost : 10
Mango cost : 20
{"Apple"=>40, "Banana"=>10, "Mango"=>20}
Apple present ::true
Grapes present :: false
Apple present ::false
{"Banana"=>10, "Mango"=>20}
=end