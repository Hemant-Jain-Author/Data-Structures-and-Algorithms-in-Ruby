# Define the accessor and reader of class Items
class Items
	attr_reader :wt,:cost,:density
	attr_accessor :wt,:cost,:density
	def initialize( w,  v)
		self.wt = w
		self.cost = v
		self.density = self.cost / self.wt
	end
end

def getMaxCostFractional( wt,  cost,  capacity)
	totalCost = 0
	n = wt.length
	itemList = Array.new(n){nil}
	i = 0
	while (i < n)
		itemList[i] = Items.new(wt[i], cost[i])
		i += 1
	end
	itemList.sort! {|x, y| -x.density <=> -y.density}
	i = 0
	while (i < n)
		if (capacity - itemList[i].wt >= 0)
			capacity -= itemList[i].wt
			totalCost += itemList[i].cost
		else
			totalCost += (itemList[i].density * capacity)
			break
		end
		i += 1
	end
	return totalCost
end
# Testing code.
wt = [10, 40, 20, 30]
cost = [60, 40, 90, 120]
capacity = 50
maxCost = getMaxCostFractional(wt, cost, capacity)
print("Maximum cost obtained = " + maxCost.to_s,"\n")