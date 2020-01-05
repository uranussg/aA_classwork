class Array
    def quicksort(&prc)
        prc ||= Proc.new { |a, b| a <=> b  }
        return self.dup if self.length <= 1
        pivot = self[0]
        rest = self.drop(1)
        left = rest.select { |el| prc.call(el, pivot) < 1 }
        right = rest.select { |el| prc.call(el, pivot) == 1 }
        sorted_left = left.quicksort(&prc)
        sorted_right = right.quicksort(&prc)
        sorted_left + [pivot] + sorted_right
    end

    def quicksort!(l = 0, r = self.length - 1, &prc) # mutate in the origin array
        prc ||= Proc.new { |a, b| a <=> b  }
        return nil if l >= r
        l_pointer = l + 1
        r_pointer = r
        while l_pointer <= r && r_pointer >> l && l_pointer <= r_pointer
            case 
            when prc.call(self[r_pointer], self[l]) > - 1 # put all eles no smaller than pivot to right
                r_pointer -= 1
            when prc.call(self[l_pointer], self[l]) == -1 # put all eles smaller than pivot to left
                l_pointer += 1
            else  
                self[l_pointer], self[r_pointer] = self[r_pointer], self[l_pointer]
                l_pointer += 1
                r_pointer -= 1
            end
        end
        self[l], self[r_pointer] = self[r_pointer], self[l] #switch pivot with right pointer
        self.quicksort!(l, r_pointer, &prc)
        self.quicksort!(r_pointer + 1, r, &prc) # put pivot to left to aviod infinite loop (all eles equal to pivot are in the right)
        self
    end

    def mergesort(&prc)
        prc ||= Proc.new { |a, b| a <=> b  }
        return self.dup if length <= 1
        middle = length / 2
        left = self.take(middle)
        right = self.drop(middle)
        sorted_left = left.mergesort(&prc)
        sorted_right = right.mergesort(&prc)
        merge(sorted_left, sorted_right, &prc)

    end

    def bubblesort(&prc)
        prc ||= Proc.new { |a, b| a <=> b  }
        copy = self.dup
        sorted = false
        until sorted
            sorted = true
            (0...length - 1).each do |idx|
                if prc.call(copy[idx], copy[idx + 1]) == 1
                    copy[idx], copy[idx + 1] = copy[idx + 1], copy[idx]
                    sorted = false
                end
            end
        end
        copy
    end

    private

    def merge(left, right, &prc)
        sorted = []
        until left.empty? || right.empty?
            l = left.first
            r = right.first
            prc.call(l, r) == 1 ? sorted << right.shift : sorted << left.shift
        end
        sorted + left + right
    end
end

# a = [2, 6, 6, 3, 15, 7]

# p a.quicksort { |a, b| b <=> a  } # reverse

# p a.bubblesort { |a, b| (a % 3) <=> (b % 3)  }

# p a.mergesort { |a, b| b <=> a  } 

# p a


b = [6, 2, 6, 3, 15, 7]
p b

p b.quicksort!  {|a, b| b <=> a  }

p b
