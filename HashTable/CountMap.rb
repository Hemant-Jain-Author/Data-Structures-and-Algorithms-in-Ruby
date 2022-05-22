class CountMap
    # Define the accessor and reader of class CountMap
    attr_accessor :hm

    def initialize()
        self.hm = Hash.new()
    end

	def add(k)
        if (self.hm.key?(k))
            self.hm[k] = self.hm[k] + 1
        else
            self.hm[k] = 1
        end
    end

	def remove(k)
        if (self.hm.key?(k))
            if (self.hm[k] == 1)
                self.hm.delete(k)
            else
                self.hm[k] = self.hm[k] - 1
            end
        end
    end

	def get(k)
        if (self.hm.key?(k))
            return self.hm[k]
        end
        return 0
    end

	def containsKey(k)
        return self.hm.key?(k)
    end

	def size()
        return self.hm.size()
    end

	def self.main()
        cm = CountMap.new()
        cm.add(2)
        cm.add(2)
        print("count is : " + cm.get(2).to_s,"\n")
        cm.remove(2)
        print("count is : " + cm.get(2).to_s,"\n")
        cm.remove(2)
        print("count is : " + cm.get(2).to_s,"\n")
    end
end
CountMap.main()