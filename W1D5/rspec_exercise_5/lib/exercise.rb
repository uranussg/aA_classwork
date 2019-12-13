require 'byebug'

def zip(*arr) 
    new_arr = []

    arr[0].each_with_index do |ele, idx| 
        new_arr << arr.map { |subArr| subArr[idx] }
    end 

    new_arr
end 

def prizz_proc(arr, prc1, prc2) 

    arr.select { |ele| prc1.call(ele) != prc2.call(ele) }

end

def zany_zip(*arr) 
    new_arr = []
    l = arr.map { |subarr| subarr.length }.max

    l.times do |idx| 
        new_arr << arr.map { |subArr| idx > arr.length ? nil : subArr[idx] }
    end 

    new_arr

end 


def maximum(arr, &proc)
    return nil if arr.length == 0
#     largest = arr[0]
#     arr.each do |ele|
#         largest = proc.call(ele) >= proc.call(largest) ? ele : largest
#     end
#     largest
    arr.inject { |acc, ele| proc.call(acc) > proc.call(ele) ? acc : ele }
end

def my_group_by(arr, &proc)
    h = Hash.new { |h, v| h[v] = [] }
    arr.each do |ele|
        h[proc.call(ele)] << ele
    end
    h
end


def max_tie_breaker(arr, proc1, &proc2)
    return nil if arr.length == 0

    
    max = arr.inject do |acc, ele|
        if proc2.call(acc) == proc2.call(ele) 
            # debugger
            acc = (proc1.call(acc) >= proc1.call(ele) ? acc : ele)
        elsif proc2.call(acc) < proc2.call(ele) 
            acc = ele
        else
            acc = acc 
        end
    end 

    max
end

def silly_syllables(sent) 
    vowel = 'aeiou'
    words = sent.split
    new_words = []

    words.each do |word|
        new_word = ''
        if word.split('').count { |char| vowel.include?(char) } < 2
            new_words << word 
            next 
        end 

        word.each_char.with_index do |chars, idx| 
            if vowel.include?(chars) 
                new_word = word[idx .. -1] 
                break
            end 
        end 

        new_word.reverse.each_char.with_index do |chars, idx|
            if vowel.include?(chars)  
                new_word = new_word.reverse[idx .. -1].reverse 
                break
            end
        end

        new_words << new_word 
    end 

    new_words.join(' ')
end 