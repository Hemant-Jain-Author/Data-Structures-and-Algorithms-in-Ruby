class Queue
  def initialize(size = 100)
    @capacity = size
    @front = 0
    @back = 0
    @count = 0
    @data = Array.new(size,0)
  end

  def add(value)
    if @count >= @capacity then
      raise StandardError, "QueueFullException"
    else
      @count += 1
      @data[@back] = value
      @back = (@back += 1) % (@capacity - 1)
    end
  end

  def remove()
    if @count <= 0 then
      raise StandardError, "QueueEmptyException"
    else
      @count -= 1
      value = @data[@front]
      @front = (@front += 1) % (@capacity - 1)
    end
    return value
  end

  def empty
    return @count == 0
  end

  def size()
    return @count
  end


end

# Testing code
q = Queue.new()
q.add(1)
q.add(2)
q.add(3)
print q.remove()
print q.remove()


