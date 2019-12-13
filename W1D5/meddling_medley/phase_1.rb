def duos(str)
    l = str.length
    (0..l - 2).count { |idx| str[idx] == str[idx + 1]  }
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


def sentence_swap(sent, h)
    sent_arr = sent.split
    result = []
    sent_arr.each { |word| h.has_key?(word) ? result << h[word] : result << word } 
    result.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def hash_mapped(h, proc1, &proc2)
    new_h = {}
    h.each do |k, v|
        new_h[proc2.call(k)] = proc1.call(v)
    end
    new_h
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}


def counted_characters(str)
    str.split('').uniq.select { |c| str.split('').count(c) > 2 }
end 

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str) 
    l = str.length
    (0..l - 3).any? { |idx| (str[idx] == str[idx + 1]) && (str[idx] == str[idx + 2]) }
end 

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, h) 
    new_str = '' 

    str.each_char do |c| 
        if h.has_key?(c) 
            new_str += h[c] 
        elsif c == ' '
            denew_str += ' '
        else
            new_str += '?'
        end 
    end 

    new_str
end 

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    uncompress = ''
    i = 0
    while i < str.length - 1
#        str[i+ 1].times {uncompress += str[i]}
        uncompress += str[i] * str[i + 1].to_i
        i += 2
    end
    uncompress
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'