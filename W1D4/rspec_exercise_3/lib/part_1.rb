def is_prime?(num)
    return false if num < 2
    (2...num).none? { |n| num % n == 0 }
end


def nth_prime(n)
    arr = []
    i = 1
    while arr.length < n
        if is_prime?(i)
            arr << i 
        end
        i += 1
    end
    return arr[n - 1]
end


def prime_range(num1, num2)
    (num1..num2).select { |n| is_prime?(n) }
end
