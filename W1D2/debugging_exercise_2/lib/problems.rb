# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    i = num
    while i > 1
        if prime?(i) && num % i == 0
            return i
        end

        i -= 1
    end

end

def prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end


def unique_chars?(str)
    count = Hash.new(0)
    str.each_char do |char|
        count[char] += 1
    end

    count.values.each do |value|
        if value > 1
            return false
        end
    end
    return true
end


def dupe_indices(arr)
    dupe = Hash.new([])
    arr.each_with_index do |l, i|
        dupe[l] += [i] 
    end
    dupe.select { |key, value| value.length > 1 }
end

def ana_array(arr1, arr2)
    if arr1.length != arr2.length
        return false
    end

    arr1.each do |el|
        if arr2.include?(el)
            arr2.delete_at(arr2.index(el))
        else
            return false
        end
    end
    return true
end