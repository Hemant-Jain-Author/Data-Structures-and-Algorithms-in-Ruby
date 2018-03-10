class Counter
  def initialize()
    @hm = {}
  end

  def add(key)
    if @hm.key?(key) then
      count = @hm[key]
      @hm[key] = count + 1
    else
      @hm[key] = 1
    end
  end

  def remove(key)
    if @hm.key?(key) then
      if @hm[key] == 1 then
        @hm.delete(key)
      else
        count = @hm[key]
        @hm[key] = count - 1
      end
    end
  end

  def get(key)
    if @hm.key?(key) then
      return @hm[key]
    end
    return 0
  end

  def containsKey(key)
    return @hm.key?(key)
  end

  def size()
    return @hm.size
  end
end

cm = Counter.new()
cm.add(2)
cm.add(2)
print "\n 2 count is : " , cm.get(2)
cm.remove(2)
print "\n 2 count is : " , cm.get(2)
