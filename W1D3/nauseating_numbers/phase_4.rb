
def mersenne_prime(num)
    arr = []
    power = 0
    while arr.length < num
        if prime?((2 ** power) - 1)
            arr << (2 ** power) - 1
        end
        power += 1
    end
    arr[-1]
end

def prime?(num)
    return false if num < 2
    (2..num - 1).none? { |factor| num % factor == 0 }
end


#  p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071 


def  triangular_word?(str)
    alpha = ('a'..'z').to_a
    sum = 0

    str.each_char do |char|
        sum += alpha.index(char) + 1
    end

    #tri_num = 1
    i = 1

    while i * (i + 1) / 2 < sum
        i += 1
    end

    i * (i + 1) / 2 == sum

end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false


def consecutive_collapse(arr)
    flag = true

    while flag
        flag = false
        arr[0..-2].each_with_index do |num, idx|
            if num == arr[idx + 1] + 1 || num == arr[idx + 1] - 1
                arr.delete_at(idx)
                arr.delete_at(idx)
                flag = true
                break
            end
        end

    end

    arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, ran)

    primes = list_of_primes(arr.max, ran )
    # print primes

    arr.map do |num|
        i = 0
        primes[0..-2].each_with_index do |p , idx|
            if num == p 
                i = idx
                
            elsif (num > p && num < primes[idx + 1]) && ran > 0 
                i = idx
            elsif (num > p && num < primes[idx + 1]) && ran < 0 
                i = idx + 1
    
            end
        end
        # p i
        # p ran
        if (i + ran) < 0
            
            nil
        else
            primes[i + ran]
        end

    end
    
end


def list_of_primes(num, ran)
    arr = [2]
    (3..num).each do |n|
        if arr.none? { |p| n % p == 0 }
            arr << n
        end
    end

    l = arr.length

    i = num + 1

    while arr.length < l + ran.abs
        if arr.none? { |p| i % p == 0 }
            arr << i
        end
        i += 1
    end
    return arr
end


p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]