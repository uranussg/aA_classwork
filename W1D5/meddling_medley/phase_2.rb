def conjunct_select(arr, *procs)
    arr.select { |ele| procs.all? { |proc| proc.call(ele) } }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
    vowels = 'aeiou'
    words = sent.split
    new_words = []

    words.each do |word|
        if word.length < 3 
            new_words << word 
        elsif vowels.include?(word[0].downcase)
            new_words << word + 'yay'
        elsif word.split('').any? { |c| vowels.include?(c) }
            word.each_char.with_index do |c, i|
                if vowels.include?(c) 
                    if word[0].upcase == word[0] 
                        new_words << word[i].upcase + word[i + 1.. -1] + word[0].downcase + word[1 ... i] + 'ay' 
                        break 
                    else 
                        new_words << word[i .. -1] + word[0 ... i] + 'ay'
                        break 
                    end  
                end      
            end 
        else 
            new_words << word 
        end 
    end 

    new_words.join(' ')
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent) 
    vowels = 'aeiou'
    words = sent.split
    new_words = []


    words.each do |word|
        if word.length < 3 
            new_words << word 
        elsif vowels.include?(word[-1].downcase)
            new_words << word + word.downcase
        else
            i = word.length - 1
            while i >= 0 
                if vowels.include?(word[i]) 
                    new_words << word + word[i  .. -1]
                    break
                end 

                i -= 1
            end 
        end 
    end 

    new_words.join(' ')

end 

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *procs)
    arr.select { |ele| procs.any? { |proc| proc.call(ele) } }

end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(sent)
    vowels = 'aeiou'
    words = sent.split
    new_words = []
    words.each_with_index do |word, idx|
        if word.split('').none? { |c| vowels.include?(c) }
            new_words << word
            next
        elsif idx.even?
            word.each_char.with_index do |c, i|
                if vowels.include?(c)
                    new_words << word[0...i] + word[i + 1..-1]
                    break
                end
            end
        else
            word.reverse.each_char.with_index do |c, i|
                if vowels.include?(c)
                    new_words << (word.reverse[0...i] + word.reverse[i + 1..-1]).reverse
                    break
                end
            end
        end


    end

    new_words.join(' ')
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    vowels = 'aeiou'
    words = sent.split
    new_words = []

    words.each do |word|
        if vowels.include?(word[-1])
            new_words << word + word[-1] 
        else 
            new_words << word.split('').map { |c| vowels.include?(c) ? (c + 'b' + c) : c }.join
        end 
    end 

    new_words.join(' ')

end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str) 
    curr = str[0]
    p = 0 
    new_str = ''

    str.each_char.with_index do |c, idx|
        if c == curr 
            p += 1 
        elsif p > 1
            new_str += curr + p.to_s
            p = 1
            curr = str[idx] 
        else 
            new_str += curr
            p = 1
            curr = str[idx]
        end 
    end 

    if p > 1
        new_str += curr + p.to_s
    else 
        new_str += curr
    end 

    new_str
end 


def compress(str)
    str.split('').uniq.map { |c| str.split('').count(c) > 1 ? c + str.split('').count(c).to_s : c  }.join
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"