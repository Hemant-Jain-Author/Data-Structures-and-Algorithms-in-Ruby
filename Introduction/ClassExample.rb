class ClassExample
  def initialize( name )
    @name = name
  end

  def hello
    puts "Hello, " + @name + "!"
  end
end

obj = ClassExample.new( "World" )
obj.hello