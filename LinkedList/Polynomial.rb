class Polynomial
    # Define the accessor and reader of class Polynomial
    attr_accessor :head,:tail
    
    class Node
        # Define the accessor and reader of class Node
        attr_accessor :coeff,:pow,:next

        def initialize( c,  p)
            self.coeff = c
            self.pow = p
            self.next = nil
        end
    end

    def initialize( coeffs,  pows,  size)
        self.head = nil
        self.tail = nil
        temp = nil
        i = 0
        while (i < size)
            temp = Node.new(coeffs[i], pows[i])
            if (self.head == nil)
                self.head = self.tail = temp
            else
                self.tail.next = temp
                self.tail = self.tail.next
            end
            i += 1
        end
    end

    def add( poly2)
        p1 = self.head
        p2 = poly2.head
        temp = nil
        poly = Polynomial.new(nil, nil, 0)
        while (p1 != nil || p2 != nil)
            if (p1 == nil || p1.pow < p2.pow)
                temp = Node.new(p2.coeff, p2.pow)
                p2 = p2.next
            elsif (p2 == nil || p1.pow > p2.pow)
                temp = Node.new(p1.coeff, p1.pow)
                p1 = p1.next
            elsif (p1.pow == p2.pow)
                temp = Node.new(p1.coeff + p2.coeff, p1.pow)
                p1 = p1.next
                p2 = p2.next
            end

            if (poly.head == nil)
                poly.head = poly.tail = temp
            else
                poly.tail.next = temp
                poly.tail = poly.tail.next
            end
        end
        return poly
    end

    def display()
        curr = self.head
        while (curr != nil)
            print(curr.coeff.to_s + "x^" + curr.pow.to_s)
            if (curr.next != nil)
                print(" + ")
            end
            curr = curr.next
        end
        print("\n")
    end
end

c1 = [6, 5, 4]
p1 = [2, 1, 0]
s1 = c1.length
first = Polynomial.new(c1, p1, s1)
first.display()
c2 = [3, 2, 1]
p2 = [3, 1, 0]
s2 = c2.length
second = Polynomial.new(c2, p2, s2)
second.display()
sum = first.add(second)
sum.display()
