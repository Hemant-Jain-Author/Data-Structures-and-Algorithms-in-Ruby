def CountSort(array, lowerRange, upperRange)
    range = upperRange - lowerRange
    size = array.size
    count = Array.new(range,0)
    i = 0
    while i < size
        count[array[i] - lowerRange] += 1
        i += 1
    end
    
    j = 0
    i = 0
    while i < range
        while count[i] > 0
            array[j] = i + lowerRange
            j += 1
            count[i] -= 1
        end
        i += 1
    end
end

# Testing code
array = [23, 24, 22, 21, 26, 25, 27, 28, 21, 21]
CountSort(array, 20, 30)
print array

# [21, 21, 21, 22, 23, 24, 25, 26, 27, 28]
