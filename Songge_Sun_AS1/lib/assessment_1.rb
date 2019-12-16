# Define your methods here.

def my_map!(arr, &proc)
    arr.each_with_index do |ele, idx|
        arr[idx] = proc.call(ele)
    end
    arr

end


def two?(arr, &proc)
    arr.count {|ele| proc.call(ele) } == 2

end


def nor_select(arr, proc1, proc2)
    arr.select { |ele| !proc1.call(ele) && !proc2.call(ele) }
end


def array_of_hash_sum(arr)
    arr.inject(0) { |acc, h| acc + h.values.sum }

end


def slangify(sent)
    vowels = "aeiou"
    sent.split.map do |word|
        new_word = word
        word.each_char.with_index do |c, i|
            if vowels.include?(c.downcase)
                new_word = word[0...i] + word[i + 1.. -1]
                break
            end
        end
        new_word
    end
    .join(' ')

end


def char_counter(str, *arr)
    arr = str.split('').uniq if arr == []        
    h = {}
    arr.each do |c|
        h[c] = str.count(c)
    end
    h
end