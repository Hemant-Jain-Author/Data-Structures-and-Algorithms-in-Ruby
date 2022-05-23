def MergeSort(arr)
  size = arr.size
  tempArray = Array.new(size,0)
  mergeSortUtil(arr, tempArray, 0, size - 1)
end

def mergeSortUtil(arr, tempArray, lowerIndex, upperIndex)
  if lowerIndex >= upperIndex
    return
  end
  middleIndex = (lowerIndex + upperIndex) / 2
  mergeSortUtil(arr, tempArray, lowerIndex, middleIndex)
  mergeSortUtil(arr, tempArray, middleIndex + 1, upperIndex)
  merge(arr, tempArray, lowerIndex, middleIndex, upperIndex)
end

def merge(arr, tempArray, lowerIndex, middleIndex, upperIndex)
  lowerStart = lowerIndex
  lowerStop = middleIndex
  upperStart = middleIndex + 1
  upperStop = upperIndex
  count = lowerIndex
  while lowerStart <= lowerStop and upperStart <= upperStop
    if arr[lowerStart] < arr[upperStart]
      tempArray[count] = arr[lowerStart]
      count += 1
      lowerStart += 1
    else
      tempArray[count] = arr[upperStart]
      count += 1
      upperStart += 1
    end
  end
  while lowerStart <= lowerStop
    tempArray[count] = arr[lowerStart]
    count += 1
    lowerStart += 1
  end
  while upperStart <= upperStop
    tempArray[count] = arr[upperStart]
    count += 1
    upperStart += 1
  end
  i = lowerIndex
  while i <= upperIndex
    arr[i] = tempArray[i]
    i += 1
  end
end

# Testing code
array = [3, 4, 2, 1, 6, 5, 7, 8 ]
MergeSort(array)
print array