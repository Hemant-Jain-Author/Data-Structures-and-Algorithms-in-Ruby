def greater(value1, value2)
    return value1 > value2
end

def InsertionSort(arr)
    size = arr.size
    i = 1
    while i < size
        temp = arr[i]
        j = i
        while j > 0 and greater(arr[j - 1], temp)
            arr[j] = arr[j - 1]
            j -= 1
        end
        arr[j] = temp
        i += 1
    end
end

# Testing code
array = [9, 1, 8, 2, 7, 3, 6, 4, 5]
InsertionSort(array)
print array