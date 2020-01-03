def base_convert(num, base)
    arr = ('0'..'9').to_a + ('a'..'z').to_a
    return arr[num] if num < base 
    pow = 1
    while base ** pow < num
        pow += 1
    end
    pow -= 1
    residue = num % (base ** pow )
    digit = num / (base ** pow )
    l = base_convert(residue, base)
    arr[digit] + '0' * (pow - l.length) + l 
end

p base_convert(31, 8)