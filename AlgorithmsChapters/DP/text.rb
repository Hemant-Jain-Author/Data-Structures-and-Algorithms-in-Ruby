java.util.Comparator




    def compare( a,  b)
            return (b.density - a.density).to_i
        end
    end
    # Approximate solution.
    def getMaxCostGreedy( wt,  cost,  capacity)
        totalCost = 0
        n = wt.length
        itemList = Array.new(n){nil}
        i = 0
        while (i < n)
            itemList[i] = self.Items.new(wt[i], cost[i])
            i += 1
        end
        Arrays.sort
        i = 0
        while (i < n && capacity > 0)
            if (capacity - itemList[i].wt >= 0)
                capacity -= itemList[i].wt
                totalCost += itemList[i].cost
            end
            i += 1
        end
        return totalCost
    end
    # Testing code.
    def self.main()
        wt =
        [10, 40, 20, 30]
        cost =
        [60, 40, 90, 120]
        capacity = 50
        kp = Knapsack.new()
        maxCost = kp.getMaxCostGreedy(wt, cost, capacity)
        print("Maximum cost obtained = " + maxCost.to_s,"\n")
    end
end
Knapsack.main()