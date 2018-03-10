class Set
  def initialize()
    @hm = {}
  end

  def Insert(key)
      @hm[key] = 1
  end

  def Delete(key)
        @hm.delete(key)
  end

  def Has(key)
    return @hm.key?(key)
  end

  def Size()
    return @hm.size
  end
end

# Testing Code
cm = Set.new()
cm.Insert(2)
print "\n 2 in set : " , cm.Has(2)
cm.Delete(2)
print "\n 2 in set : " , cm.Has(2)

