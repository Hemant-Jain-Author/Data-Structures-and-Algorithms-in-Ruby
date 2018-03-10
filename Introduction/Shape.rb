class Shape
  attr_accessor :colour
  def initialize(colour = "black")
      @colour = colour
    end 
end

class Rectangle < Shape
  def initialize(w, l)
    @width = w
    @length = l
  end

  def initialize(w, l)
    @width = w
    @length = l
  end

  def Width=(value)
    @width = value
  end

  def Length=(value)
    @length = value
  end

  def area()
    # Area = width * length
    return @width * @length
  end

  def perimeter()
    # Perimeter = 2(width + length)
    return 2 * (@width + @length)
  end
end

class Circle < Shape
  def initialize(r)
    @radius = r
  end

  def initialize(r)
    @radius = r
  end

  def Radius=(value)
    @radius = value
  end

  def area()
    # Area = πr^2
    return 3.14 * (@radius**2)
  end

  def perimeter()
    # Perimeter = 2πr
    return 2 * 3.14 * @radius
  end
end

width = 2
length = 3
rectangle = Rectangle.new(width, length)
print "Rectangle width: " , width , " and length: " , length , " Area: " , rectangle.area() , " Perimeter: " ,
rectangle.perimeter()
puts ""

radius = 10
circle = Circle.new(radius)
print "Circle radius: " , radius , " Area: " , circle.area() , " Perimeter: " , circle.perimeter()
