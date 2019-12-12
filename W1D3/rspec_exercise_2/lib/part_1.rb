

def partition(arr, num)
    new_arr = Array.new(2) {Array.new}
    arr.each do |ele|
        if ele < num
            new_arr[0] << ele
        else  
            new_arr[1] << ele
        end
    end
    new_arr

end

def merge( hash1, hash2 )
    newhash = Hash.new

    hash1.each do |k, v|
        newhash[k] = v
    end

    hash2.each do |k,v|
        newhash[k] = v
    end

    newhash
end


def censor(sent, curse_words)
    vowels = "aeiou"
    newsent = []
    sent.split(" ").each do |word|
        if curse_words.include?(word.downcase)
            newword = ""
            word.each_char do |char|
 
                if vowels.include?(char.downcase)
                   newword << "*"
                else
                    newword << char
                end

            end

            newsent << newword
        else 
            newsent << word
        end
       
    end
    newsent.join(" ")
end

def power_of_two?( num )

    while num % 2 == 0
        num = num / 2
    end
    num == 1 ? true : false
end