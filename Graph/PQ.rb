class PriorityQueue
  # Number of elements in PriorityQueue
  # The PriorityQueue array
  def initialize(array)
    @size = array.size
    @arr = array.clone
    @arr.unshift(1) #we do not use 0 index
    #Build PriorityQueue operation over array
    i = (@size / 2)
    while i > 0
      self.proclateDown(i)
      i -= 1
    end
  end

  #Other Methods.
  def comp(first, second)
    if defined? first.compare
      return first.compare(second) > 0
    end
    return (first - second) > 0
  end

  def proclateDown(position)
    lChild = 2 * position
    rChild = lChild + 1
    small = -1
    if lChild <= @size then
      small = lChild
    end
    if rChild <= @size and (self.comp(@arr[rChild], @arr[lChild])== false) then
      small = rChild
    end
    if small != -1 and (self.comp(@arr[small], @arr[position])== false) then
      temp = @arr[position]
      @arr[position] = @arr[small]
      @arr[small] = temp
      self.proclateDown(small)
    end
  end

  def proclateUp(position)
    parent = position / 2
    if parent == 0 then
      return
    end
    if self.comp(@arr[parent], @arr[position]) == true then #parent grater then child.
      temp = @arr[position]
      @arr[position] = @arr[parent]
      @arr[parent] = temp
      self.proclateUp(parent)
    end
  end

  def add(value)
    @size += 1
    @arr[@size] = value
    self.proclateUp(@size)
  end

  def remove()
    if self.isEmpty() then
      raise StandardError, "HeapEmptyException"
    end
    value = @arr[1]
    @arr[1] = @arr[size]
    @size -= 1
    self.proclateDown(1)
    return value
  end

  def print()
    i = 1
    while i <= size + 1
      print "value is :: " , arr[i]
      i += 1
    end
  end

  def isEmpty()
    return (@size == 0)
  end

  def peek()
    if self.isEmpty() then
      raise StandardError, "HeapEmptyException"
    end
    return @arr[1]
  end

  def size()
    return @size
  end
end

def HeapSort(array)
  hp = PriorityQueue.new(array)
  i = 0
  while i < array.size
    array[i] = hp.remove()
    i += 1
  end
end
#
#a = [9, 8, 10, 7, 6, 1, 4, 2, 5, 3]
#pq = PriorityQueue.new(a)
#pq.add(2);
#pq.add(3);
#count = pq.size()
#i = 0
#while i < count
#  print "value is :: " , pq.remove(), "\n"
#  i += 1
#end
#a = [9, 8, 10, 7, 6, 1, 4, 2, 5, 3]
#HeapSort(a)
#print a

#class MedianHeap
#  def initialize()
#    @minHeap = PriorityQueue.new([])
#    @maxHeap = PriorityQueue.new([],false)
#  end
#
#  def insert(value)
#    if @maxHeap.size() == 0 or @maxHeap.peek() >= value then
#      @maxHeap.add(value)
#    else
#      @minHeap.add(value)
#    end
#    #size balancing
#    if @maxHeap.size() > @minHeap.size() + 1 then
#      value = @maxHeap.remove()
#      @minHeap.add(value)
#    end
#    if @minHeap.size() > @maxHeap.size() + 1 then
#      value = @minHeap.remove()
#      @maxHeap.add(value)
#    end
#  end
#
#  def median()
#    if @maxHeap.size() == 0 and @minHeap.size() == 0 then
#      raise StandardError, "EmptyException"
#    end
#    if @maxHeap.size() == @minHeap.size() then
#      return (@maxHeap.peek() + @minHeap.peek()) / 2
#    elsif @maxHeap.size() > @minHeap.size() then
#      return @maxHeap.peek()
#    else
#      return @minHeap.peek()
#    end
#  end
#end
#
##
##arr = [1, 9, 2, 8, 3, 7, 4, 6, 5, 1]
##hp = MedianHeap.new()
##i = 0
##while i < 10
##  hp.insert(arr[i])
##  print "\n Median after insertion of " , arr[i] , " is  " , hp.median()
##  i += 1
##end
