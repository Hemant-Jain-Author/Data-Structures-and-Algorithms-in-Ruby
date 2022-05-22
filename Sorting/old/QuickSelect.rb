def QuickSelect(arr, k)
  quickSelectUtil(arr, 0, arr.size - 1, k)
  return arr[k]
end

def quickSelectUtil(arr, lower, upper, k)
  if upper <= lower
    return
  end
  pivot = arr[lower]
  start = lower
  stop = upper
  while lower < upper
    while arr[lower] <= pivot and lower < upper
      lower += 1
    end
    while arr[upper] > pivot and lower <= upper
      upper -= 1
    end
    if lower < upper
      swap(arr, upper, lower)
    end
  end
  swap(arr, upper, start) #upper is the pivot position
  if k < upper
    quickSelectUtil(arr, start, upper - 1, k)
  end #pivot -1 is the upper for left sub array.
  if k > upper
    quickSelectUtil(arr, upper + 1, stop, k)
  end
end

# pivot + 1 is the lower for right sub array.
def swap(arr, first, second)
  temp = arr[first]
  arr[first] = arr[second]
  arr[second] = temp
end

# Testing code
array = [3, 4, 2, 1, 6, 5, 7, 8, 10, 9]
val = QuickSelect(array, 5)
print "value at index 5 is : " , val
