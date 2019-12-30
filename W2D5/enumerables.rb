class Array
    def my_each(&proc)
        i= 0
        while i < self.length
            proc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&proc)
        new_arr =[]
        self.my_each { |el| new_arr << el if proc.call(el) } 
        new_arr
    end

    def my_reject(&proc)
        new_arr =[]
        self.my_each { |el| new_arr << el if !proc.call(el) } 
        new_arr
    end

    def my_any?(&proc)
        self.my_each { |el| return true if proc.call(el) }
        false

        
    end

    def my_all?(&proc)
        self.my_each { |el| return false if proc.call(el) }
        true

    end

    def my_flatten
        new_arr = []
        visited = []
        self.my_each { |ele| visited << ele }

        ele = 0
        while !visited.empty?
            ele = visited.shift
            ele.is_a?(Array) ? visited.unshift(*ele) : new_arr << ele
        end
        new_arr
    end

    def my_zip(*args)
        args.unshift(self)
        (0...self.length).map { |idx| args.map { |sub_arr| sub_arr[idx] } }  

    end

    def my_rotate(num = 1)
        self.map.with_index { |ele, idx|  self[(idx + num) % self.length] }
    end


    def my_join(str = "")
        new_str = ""
        self.each { |char| new_str += char + str }
        new_str[0...-str.length]
    end

    def my_reverse 
        self.map.with_index { |ele, idx| self[-idx - 1] }
    end

#factors(num)
#bubble_sort!(&prc)
#bubble_sort(&prc)
#substrings(string)
#subwords(word, dictionary)

end

