class ArrayDemo
  def initialize()
    @numbers = Array.new(100)
  end

  def addValue(index, data)
    @numbers[index] = data
  end

  def getValue(index)
    return @numbers[index]
  end
end

d = ArrayDemo.new()
d.addValue(0, 1)
d.addValue(1, 2)
puts d.getValue(0)
puts d.getValue(1)
