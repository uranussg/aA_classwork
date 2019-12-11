def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    sum = 0
    arr.each do |num|
        sum += num
    end
    return sum / arr.length.to_f
end

def repeat(str, num)
    new_str = ""
    num.times do 
        new_str += str
    end
    return new_str
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    arr = sent.split(" ")
    count = 0
    new_arr = []
    arr.each do |word|
       
        if count % 2 == 0
            new_arr << word.upcase
        else
            new_arr << word.downcase
        end
        count += 1
    end
    return new_arr.join(" ")
end