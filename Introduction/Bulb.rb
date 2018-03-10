class Bulb
  def initialize()
    @isOn = false
  end

  def turnOn()
    @isOn = true
  end

  def turnOff()
    @isOn = false
  end
  
  def isOn()
    @isOn
  end
end

b = Bulb.new()
puts b.isOn()
b.turnOn()
puts b.isOn()