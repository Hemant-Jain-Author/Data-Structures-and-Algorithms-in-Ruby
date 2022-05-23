def SelectionSort(arr) # sorted array created in reverse order.
    size = arr.size
    i = 0
    while i < size - 1
        max = 0
        j = 1
        while j < size - i
            if arr[j] > arr[max]
                max = j
            end
            j += 1
        end
        temp = arr[size - 1 - i]
        arr[size - 1 - i] = arr[max]
        arr[max] = temp
        i += 1
    end
end

def SelectionSort2(arr) # sorted array created in forward direction
    size = arr.size
    i = 0
    while i < size - 1
        min = i
        j = i + 1
        while j < size
            if arr[j] < arr[min]
                min = j
            end
            j += 1
        end
        temp = arr[i]
        arr[i] = arr[min]
        arr[min] = temp
        i += 1
    end
end

# Testing code
array =[9, 1, 8, 2, 7, 3, 6, 4, 5]
SelectionSort2(array)
print array