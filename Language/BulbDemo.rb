class Bulb
    #Class Variables 
    @@TotalBulbCount = 0
    
    #Constructor
    def initialize()
        @@TotalBulbCount += 1
        
        #Instance Variables 
        @isOn = false 
    end

    #Class Method
    def self.BulbCount
        return @@TotalBulbCount
    end

    #Instance Method
    def turnOn()
        @isOn = true
    end

    #Instance Method
    def turnOff()
        @isOn = false
    end

    #Instance Method
    def IsOn
        return @isOn
    end
end


b = Bulb.new()
c = Bulb.new()
puts Bulb.BulbCount()