def less(value1, value2)
    return value1 < value2
end

def greater(value1, value2)
    return value1 > value2
end

def BubbleSort(array)
    size = array.size
    i = 0
    while i < (size - 1)
        j = 0
        while j < size - i - 1
            if greater(array[j], array[j + 1])
                # Swapping
                temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            end
            j += 1
        end
        i += 1
    end
end

def BubbleSort2(array)
    size = array.size
    swapped = 1
    i = 0
    while i < (size - 1) and swapped == 1
        swapped = 0
        j = 0
        while j < size - i - 1
            if greater(array[j], array[j + 1])
                # Swapping
                temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
                swapped = 1
            end
            j += 1
        end
        i += 1
    end
end

# Testing code
array = [9, 1, 8, 2, 7, 3, 6, 4, 5]
bs = BubbleSort2(array)
print array