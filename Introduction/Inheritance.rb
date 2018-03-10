#implements BulbInterface
class Bulb
  def initialize()
    #Instance Variables 
    @isOn = false
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

class AdvanceBulb < Bulb
  attr_accessor :intensity
  def initialize(value = 1)
    @intensity = value
  end
end

# Testing code
b = Bulb.new()
b2 = AdvanceBulb.new(10)
b2.turnOn()
puts b2.IsOn()
puts b2.intensity()