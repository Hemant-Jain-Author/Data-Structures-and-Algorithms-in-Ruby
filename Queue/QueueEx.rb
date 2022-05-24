def CircularTour( arr,  n)
    i = 0
    while (i < n)
        total = 0
        found = true
        j = 0
        while (j < n)
            total += (arr[(i + j) % n][0] - arr[(i + j) % n][1])
            if (total < 0)
                found = false
                break
            end
            j += 1
        end

        if (found)
            return i
        end
        i += 1
    end
    return -1
end

def CircularTour2( arr,  n)
    que =  Queue.new
    nextPump = 0
    count = 0
    petrol = 0
    while (que.size() != n)
        while (petrol >= 0 && que.size() != n)
            que.push(nextPump)
            petrol += (arr[nextPump][0] - arr[nextPump][1])
            nextPump = (nextPump + 1) % n
        end
        while (petrol < 0 && que.size() > 0)
            prevPump = que.pop()
            petrol -= (arr[prevPump][0] - arr[prevPump][1])
        end
        count += 1
        if (count == n)
            return -1
        end
    end
    if (petrol >= 0)
        return que.pop()
    else
        return -1
    end
end
# Testing code
def main1()
    tour = [[8, 6], [1, 4], [7, 6]]
    print("Circular Tour : " + CircularTour(tour, 3).to_s,"\n")
    print("Circular Tour : " + CircularTour2(tour, 3).to_s,"\n")
end
# Circular Tour : 2
# Circular Tour : 2

def convertXY( src,  dst)
    que =  Queue.new
    arr = Array.new(100){0}
    steps = 0
    index = 0
    que.push(src)
    while (que.size() != 0)
        value = que.pop()
        arr[index += 1] = value
        if (value == dst)
            return steps
        end
        steps += 1
        if (value < dst)
            que.push(value * 2)
        else
            que.push(value - 1)
        end
    end
    return -1
end
# Testing code
def main2()
    print("Steps count :: " + convertXY(2, 7).to_s,"\n")
end
# Steps count :: 3

def maxSlidingWindows( arr,  size,  k)
    i = 0
    while (i < size - k + 1)
        max = arr[i]
        j = 1
        while (j < k)
            max = [max, arr[i + j]].max
            j += 1
        end
        print(max.to_s + " ")
        i += 1
    end
    print("\n")
end

def maxSlidingWindows2( arr,  size,  k)
    deq =  []
    i = 0
    while (i < size)
        # Remove out of range elements
        if (deq.size() > 0 && deq[0] <= i - k)
            deq.shift
        end
        # Remove smaller values at left.
        while (deq.size() > 0 && arr[deq[-1]] <= arr[i]) 
            deq.pop()
        end
        deq.push(i)
        # Largest value in window of size k is at index deq[0]
        # It is displayed to the screen.
        if (i >= (k - 1))
            print(arr[deq[0]].to_s + " ")
        end
        i += 1
    end
    print("\n")
end

# Testing code
def main3()
    arr = [11, 2, 75, 92, 59, 90, 55]
    maxSlidingWindows(arr, 7, 3)
    maxSlidingWindows2(arr, 7, 3)
end

# 75 92 92 92 90 
# 75 92 92 92 90

def minOfMaxSlidingWindows( arr,  size,  k)
    deq =  []
    minVal = 999999
    i = 0
    while (i < size)
        # Remove out of range elements
        if (deq.size() > 0 && deq[0] <= i - k)
            deq.shift
        end
        # Remove smaller values at left.
        while (deq.size() > 0 && arr[deq[-1]] <= arr[i]) 
            deq.pop()
        end
        deq.push(i)
        # window of size k
        if (i >= (k - 1) && minVal > arr[deq[0]])
            minVal = arr[deq[0]]
        end
        i += 1
    end
    print("Min of max is :: " + minVal.to_s,"\n")
    return minVal
end

# Testing code
def main4()
    arr = [11, 2, 75, 92, 59, 90, 55]
    minOfMaxSlidingWindows(arr, 7, 3)
end

# Min of max is :: 75

def maxOfMinSlidingWindows( arr,  size,  k)
    deq =  []
    maxVal = -999999
    i = 0
    while (i < size)
        # Remove out of range elements
        if (deq.size() > 0 && deq[0] <= i - k)
            deq.shift
        end
        # Remove smaller values at left.
        while (deq.size() > 0 && arr[deq[-1]] >= arr[i]) 
            deq.pop()
        end
        deq.push(i)
        # window of size k
        if (i >= (k - 1) && maxVal < arr[deq[0]])
            maxVal = arr[deq[0]]
        end
        i += 1
    end
    print("Max of min is :: " + maxVal.to_s,"\n")
end

# Testing code
def main5()
    arr = [11, 2, 75, 92, 59, 90, 55]
    maxOfMinSlidingWindows(arr, 7, 3)
end
# Max of min is :: 59

def firstNegSlidingWindows( arr,  size,  k)
    deq =  []
    i = 0
    while (i < size)
        # Remove out of range elements
        if (deq.size() > 0 && deq[0] <= i - k)
            deq.shift
        end
        if (arr[i] < 0)
            deq.push(i)
        end
        # window of size k
        if (i >= (k - 1))
            if (deq.size() > 0)
                print(arr[deq[0]].to_s + " ")
            else
                print("NAN")
            end
        end
        i += 1
    end
    print "\n"
end

# Testing code
def main6()
    arr = [3, -2, -6, 10, -14, 50, 14, 21]
    firstNegSlidingWindows(arr, 8, 3)
end
# -2 -2 -6 -14 -14 NAN

def rottenFruitUtil( arr,  maxCol,  maxRow,  currCol,  currRow,  traversed,  day)
    dir = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    i = 0
    while (i < 4)
        x = currCol + dir[i][0]
        y = currRow + dir[i][1]
        if (x >= 0 && x < maxCol && y >= 0 && y < maxRow && traversed[x][y] > day + 1 && arr[x][y] == 1)
            traversed[x][y] = day + 1
            rottenFruitUtil(arr, maxCol, maxRow, x, y, traversed, day + 1)
        end
        i += 1
    end
end

def rottenFruit( arr,  maxCol,  maxRow)
    traversed = Array.new(maxCol){Array.new(maxRow){0}}
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            traversed[i][j] = 999999
            j += 1
        end
        i += 1
    end
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            if (arr[i][j] == 2)
                traversed[i][j] = 0
                rottenFruitUtil(arr, maxCol, maxRow, i, j, traversed, 0)
            end
            j += 1
        end
        i += 1
    end
    maxDay = 0
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            if (arr[i][j] == 1)
                if (traversed[i][j] == 999999)
                    return -1
                end
                if (maxDay < traversed[i][j])
                    maxDay = traversed[i][j]
                end
            end
            j += 1
        end
        i += 1
    end
    return maxDay
end

class Fruit
    # Define the accessor of class Fruit
    attr_accessor :x,:y,:day

    def initialize( a,  b,  d)
        self.x = a
        self.y = b
        self.day = d
    end
end

def rottenFruit2( arr,  maxCol,  maxRow)
    traversed = Array.new(maxCol){Array.new(maxRow){false}}
    dir = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    que =  Queue.new

    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            if (arr[i][j] == 2)
                que.push(Fruit.new(i, j, 0))
                traversed[i][j] = true
            end
            j += 1
        end
        i += 1
    end
    max = 0

    while (!que.empty?)
        temp = que.pop()
        i = 0
        while (i < 4)
            x = temp.x + dir[i][0]
            y = temp.y + dir[i][1]
            day = temp.day + 1
            if (x >= 0 && x < maxCol && y >= 0 && y < maxRow && 
                        arr[x][y] != 0 && traversed[x][y] == false)
                que.push(Fruit.new(x, y, day))
                max = [max, day].max
                traversed[x][y] = true
            end
            i += 1
        end
    end
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            if (arr[i][j] == 1 && traversed[i][j] == false)
                return -1
            end
            j += 1
        end
        i += 1
    end
    return max
end

# Testing code
def main7()
    arr = [[1, 0, 1, 1, 0], [2, 1, 0, 1, 0], [0, 0, 0, 2, 1], [0, 2, 0, 0, 1], [1, 1, 0, 0, 1]]
    print("rottenFruit : " + rottenFruit(arr, 5, 5).to_s,"\n")
    print("rottenFruit : " + rottenFruit2(arr, 5, 5).to_s,"\n")
end
# 3

def stepsOfKnightUtil( size,  currCol,  currRow,  traversed,  dist)
    dir = [[-2, -1], [-2, 1], [2, -1], [2, 1], [-1, -2], [1, -2], [-1, 2], [1, 2]]
    i = 0
    while (i < 8)
        x = currCol + dir[i][0]
        y = currRow + dir[i][1]
        if (x >= 0 && x < size && y >= 0 && y < size && traversed[x][y] > dist + 1)
            traversed[x][y] = dist + 1
            stepsOfKnightUtil(size, x, y, traversed, dist + 1)
        end
        i += 1
    end
end

def stepsOfKnight( size,  srcX,  srcY,  dstX,  dstY)
    traversed = Array.new(size){Array.new(size){0}}
    i = 0
    while (i < size)
        j = 0
        while (j < size)
            traversed[i][j] = 999999
            j += 1
        end
        i += 1
    end
    traversed[srcX - 1][srcY - 1] = 0
    stepsOfKnightUtil(size, srcX - 1, srcY - 1, traversed, 0)
    return traversed[dstX - 1][dstY - 1]
end

class Knight
    # Define the accessor of class Knight
    attr_accessor :x,:y,:cost

    def initialize( a,  b,  c)
        self.x = a
        self.y = b
        self.cost = c
    end
end

def stepsOfKnight2( size,  srcX,  srcY,  dstX,  dstY)
    traversed = Array.new(size){Array.new(size){0}}
    dir = [[-2, -1], [-2, 1], [2, -1], [2, 1], [-1, -2], [1, -2], [-1, 2], [1, 2]]
    que =  Queue.new
    i = 0
    while (i < size)
        j = 0
        while (j < size)
            traversed[i][j] = 999999
            j += 1
        end
        i += 1
    end
    que.push(Knight.new(srcX - 1, srcY - 1, 0))
    traversed[srcX - 1][srcY - 1] = 0
    while (!que.empty?)
        temp = que.pop()
        i = 0
        while (i < 8)
            x = temp.x + dir[i][0]
            y = temp.y + dir[i][1]
            cost = temp.cost + 1
            if (x >= 0 && x < size && y >= 0 && y < size && traversed[x][y] > cost)
                que.push(Knight.new(x, y, cost))
                traversed[x][y] = cost
            end
            i += 1
        end
    end
    return traversed[dstX - 1][dstY - 1]
end

# Testing code
def main8()
    print(stepsOfKnight(20, 10, 10, 20, 20),"\n")
    print(stepsOfKnight2(20, 10, 10, 20, 20),"\n")
end
# 8
# 8

def distNearestFillUtil( arr,  maxCol,  maxRow,  currCol,  currRow,  traversed,  dist)
    # Range check
    dir = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    i = 0
    while (i < 4)
        x = currCol + dir[i][0]
        y = currRow + dir[i][1]
        if (x >= 0 && x < maxCol && y >= 0 && y < maxRow && traversed[x][y] > dist + 1)
            traversed[x][y] = dist + 1
            distNearestFillUtil(arr, maxCol, maxRow, x, y, traversed, dist + 1)
        end
        i += 1
    end
end

def distNearestFill( arr,  maxCol,  maxRow)
    traversed = Array.new(maxCol){Array.new(maxRow){0}}
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            traversed[i][j] = 999999
            j += 1
        end
        i += 1
    end
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            if (arr[i][j] == 1)
                traversed[i][j] = 0
                distNearestFillUtil(arr, maxCol, maxRow, i, j, traversed, 0)
            end
            j += 1
        end
        i += 1
    end
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            print(traversed[i][j].to_s + " ")
            j += 1
        end
        print("\n")
        i += 1
    end
end

class Node
    # Define the accessor of class Node
    attr_accessor :x,:y,:dist

    def initialize( a,  b,  d)
        self.x = a
        self.y = b
        self.dist = d
    end
end

def distNearestFill2( arr,  maxCol,  maxRow)
    traversed = Array.new(maxCol){Array.new(maxRow){0}}
    dir = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    que =  Queue.new
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            traversed[i][j] = 999999
            if (arr[i][j] == 1)
                que.push(Node.new(i, j, 0))
                traversed[i][j] = 0
            end
            j += 1
        end
        i += 1
    end
    while (!que.empty?)
        temp = que.pop()
        i = 0
        while (i < 4)
            x = temp.x + dir[i][0]
            y = temp.y + dir[i][1]
            dist = temp.dist + 1
            if (x >= 0 && x < maxCol && y >= 0 && y < maxRow && traversed[x][y] > dist)
                que.push(Node.new(x, y, dist))
                traversed[x][y] = dist
            end
            i += 1
        end
    end
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            print(traversed[i][j].to_s + " ")
            j += 1
        end
        print("\n")
        i += 1
    end
end

# Testing code
def main9()
    arr = [[1, 0, 1, 1, 0], [1, 1, 0, 1, 0], [0, 0, 0, 0, 1], [0, 0, 0, 0, 1], [0, 0, 0, 0, 1]]
    distNearestFill(arr, 5, 5)
    distNearestFill2(arr, 5, 5)
end
# 0 1 0 0 1 
# 0 0 1 0 1 
# 1 1 2 1 0 
# 2 2 2 1 0 
# 3 3 2 1 0

def findLargestIslandUtil( arr,  maxCol,  maxRow,  currCol,  currRow,  traversed)
    dir = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    sum = 1
    i = 0
    while (i < 8)
        x = currCol + dir[i][0]
        y = currRow + dir[i][1]
        if (x >= 0 && x < maxCol && y >= 0 && y < maxRow && traversed[x][y] == false && arr[x][y] == 1)
            traversed[x][y] = true
            sum += findLargestIslandUtil(arr, maxCol, maxRow, x, y, traversed)
        end
        i += 1
    end
    return sum
end

def findLargestIsland( arr,  maxCol,  maxRow)
    maxVal = 0
    currVal = 0
    traversed = Array.new(maxCol){Array.new(maxRow){false}}
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            traversed[i][j] = false
            j += 1
        end
        i += 1
    end
    i = 0
    while (i < maxCol)
        j = 0
        while (j < maxRow)
            if (arr[i][j] == 1)
                traversed[i][j] = true
                currVal = findLargestIslandUtil(arr, maxCol, maxRow, i, j, traversed)
                if (currVal > maxVal)
                    maxVal = currVal
                end
            end
            j += 1
        end
        i += 1
    end
    return maxVal
end

# Testing code
def main10()
    arr = [[1, 0, 1, 1, 0], [1, 0, 0, 1, 0], [0, 1, 1, 1, 1], [0, 1, 0, 0, 0], [1, 1, 0, 0, 1]]

    print("Largest Island : " + findLargestIsland(arr, 5, 5).to_s,"\n")
end
# Largest Island : 12

def reverseStack( stk)
    que =  Queue.new
    while (!(stk.length == 0))
        que.push(stk.pop())
    end
    while (!que.empty?)
        stk.push(que.pop())
    end
end

def reverseQueue( que)
    stk =  []
    while (!que.empty?)
        stk.push(que.pop())
    end
    while (!(stk.length == 0))
        que.push(stk.pop())
    end
end

# Testing code
def main11()
    stk =  []
    i = 0
    while (i < 5)
        stk.push(i)
        i += 1
    end
    print(stk,"\n")
    reverseStack(stk)
    print(stk,"\n")

    que =  Queue.new
    i = 0
    while (i < 5)
        que.push(i)
        i += 1
    end
    print(que,"\n")
    reverseQueue(que)
    print(que,"\n")
end

def josephus( n,  k)
    que =  Queue.new
    i = 0
    while (i < n)
        que.push(i + 1)
        i += 1
    end

    while (que.size() > 1)
        i = 0
        while (i < k - 1)
            que.push(que.pop())
            i += 1
        end
        que.pop()
    end
    return que.pop()
end

# Testing code
def main12()
    print("Position : " + josephus(11, 5).to_s,"\n")
end
# Position : 8


main1()
main2()
main3()
main4()
main5()
main6()

main7()
main8()
main9()
main10()
main11()

main12()
