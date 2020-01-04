
#require "byebug"
def range(start, ending)

    return [] if ending <= start
    range(start+1, ending).unshift(start) 

end

def sum_rec(array)

    return 0 if array.empty?
    sum_rec(array[1..-1]) + array[0]

end

def sum_it(array)
    sum = 0
    array.each {|num| sum += num}
    sum
end

def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n - 1)
end

def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1
    n.even? ? exp_2(b, n/2) ** 2 : b * (exp_2(b, (n - 1)/2) ** 2)

end

class Array
    def deep_dup

#       return self.dup if self.all?{|ele| !ele.is_a?(Array)}
       arr = self.map  do |ele| 
            if ele.is_a?(Array)
                ele.deep_dup
            else
                ele
            end

        end
        # p arr
        # p arr.object_id
        arr.dup
     
    end
end

a = [1, [2], [3, [4]]]
p a.object_id

a.deep_dup
# copy_a[2][1] << 5
# p copy_a
# p a

def fibonacii_rec(n)
    return [0] if n == 1
    return [0, 1] if n == 2
    fibonacii_rec(n - 1) + [fibonacii_rec(n - 1)[-1] + fibonacii_rec(n - 1)[-2]]
end

def fibonacii_it(n)
    return [0] if n == 1
    arr = [0, 1] 
    while arr.length < n
        arr << arr[-1] + arr[-2]

    end
    arr
end

def bsearch(array, target)

    return nil if array.empty? 
    #or target < array[0] or target > array.last
    left_side = 0
    right_side = array.length - 1
    middle = left_side + (right_side - left_side)/2
    #debugger
    if array[middle] == target 
        #debugger
        return middle
    elsif  array[middle] > target
      #  debugger
        return nil if !bsearch(array[left_side...middle], target)
        return left_side + bsearch(array[left_side...middle], target)
    else
     #   debugger
        return nil if !bsearch(array[middle + 1..right_side], target)
        return middle + 1 + bsearch(array[middle + 1..right_side], target)
    end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length <= 1

    middle = arr.length / 2
    left = arr[0...middle]
    right = arr[middle..-1]
    merge(merge_sort(left), merge_sort(right))
end

def merge(arr1, arr2)
    arr = []
    while !arr1.empty? && !arr2.empty?
        if arr1[0] < arr2[0]
            arr << arr1.shift
        else
            arr << arr2.shift
        end
    end
    arr + arr1 + arr2

end

# p merge_sort([38,27,43,3,9,82,10])
#p merge([1,2,6], [2,9,11])


def subsets(arr)
    return [[]] if arr.empty?
    sub = subsets(arr[0...-1])
    newsub = sub.map { |ele| ele + [arr.last] } 
    sub + newsub


#    sub + arr[-1]
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(array)

    ret = []
    return [array] if array.length < 2
    sub = permutations(array[1..-1])
    sub.each do |sub_array|
        (0..sub_array.length).each do |idx|
           ret << sub_array[0...idx] + [array.first] + sub_array[idx..-1]
        end
    end
    ret
end

# p permutations([1, 2, 3, 4]).length # => [[1, 2, 3], [1, 3, 2], => array.length !
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# p permutations([1])  # [[1]]


def greedy_make_change(target, coins=[25,10,5,1])
end


# I think we shouldn't take the default coins as this
# because we're going to do the recursion later, which need it to be [10, 5, 1]..
