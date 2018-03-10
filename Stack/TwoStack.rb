class TwoStack
  def initialize(size = 50)
    @MAX_SIZE = size
    @top1 = -1
    @top2 = @MAX_SIZE
    @data = Array.CreateInstance(System::Int32, @MAX_SIZE)
  end

  def TwoStack.Main(args)
    st = TwoStack.new()
    i = 0
    while i < 10
      st.StackPush1(i)
      i += 1
    end
    j = 0
    while j < 10
      st.StackPush2(j + 10)
      j += 1
    end
    i = 0
    while i < 10
      Console.WriteLine("stack one pop value is : " + st.StackPop1())
      Console.WriteLine("stack two pop value is : " + st.StackPop2())
      i += 1
    end
  end

  def StackPush1(value)
    if @top1 < @top2 - 1 then
      @data[@top1 += 1] = value
    else
      Console.Write("Stack is Full!")
    end
  end

  def StackPush2(value)
    if @top1 < @top2 - 1 then
      @data[@top2 -= 1] = value
    else
      Console.Write("Stack is Full!")
    end
  end

  def StackPop1()
    if @top1 >= 0 then
      value = @data[@top1 -= 1]
      return value
    else
      Console.Write("Stack Empty!")
    end
    return -999
  end

  def StackPop2()
    if @top2 < @MAX_SIZE then
      value = @data[@top2 += 1]
      return value
    else
      Console.Write("Stack Empty!")
    end
    return -999
  end
end