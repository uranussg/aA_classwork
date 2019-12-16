# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self == [] 
            return nil
        else  
            return self.max - self.min
        end

    end  

    def average
        if self == []
            return nil
        else 
            self.sum / self.length.to_f 
        end
    end
    
    def median
        if self == []
            return nil
        elsif self.length.odd?
            return self.sort[self.length / 2]
        else 
            return (self.sort[self.length / 2] + self.sort[self.length / 2 - 1]) / 2.0
        
        end
    end
    def counts
        h = Hash.new(0)
        self.each do |ele|
            h[ele] += 1
        end 
        h

    end

    def my_count(val)
        count = 0
        self.each do |ele|
            count += 1 if ele == val
        end

        count
    end
    
    def my_index(val)
        self.each_with_index do |ele, idx|
            return idx if ele == val
        end

        nil
    end

    def my_uniq
        hash = Hash.new(0)

        self.each do |ele|
            hash[ele] += 1
        end
        # hash.keys.select { |k| hash[k] >= 1}
        hash.keys
    end

    def my_transpose
        new_arr = Array.new(self[0].length){Array.new(self.length)}
        
        self.each_with_index do |subArr, r|
            subArr.each_with_index do |ele, c|
                new_arr[c][r] = ele
            end
        end

        new_arr
    end

end


