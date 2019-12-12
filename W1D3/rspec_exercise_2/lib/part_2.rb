def palindrome?(str)
    arr = str.split("")
    while arr.length >= 2
        return false if arr.shift != arr.pop
    end
    true
end

def substrings(str)
    new_arr = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
            new_arr << str[i..j]
        end
    end
    new_arr

end


def palindrome_substrings(str)
    all_subs = substrings(str)
    all_subs.select { |sub| palindrome?(sub) && sub.length > 1 }
end