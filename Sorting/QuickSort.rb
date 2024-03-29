def QuickSort(arr)
    size = arr.size
    quickSortUtil(arr, 0, size - 1)
end

def swap(arr, first, second)
    temp = arr[first]
    arr[first] = arr[second]
    arr[second] = temp
end

def quickSortUtil(arr, lower, upper)
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
    quickSortUtil(arr, start, upper - 1) # pivot -1 is the upper for left sub array.
    quickSortUtil(arr, upper + 1, stop)# pivot + 1 is the lower for right sub array.
end

# Testing code
array = [ 6, 4, 5, 1, 8, 2, 9, 7, 10, 3 ]
QuickSort(array)
print array

# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]