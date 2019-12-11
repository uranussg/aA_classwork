def hipsterfy(word)
    vowels = 'aeiou'
    new_word = ''
    word.reverse.each_char.with_index do |char, idx|
        if !vowels.include?(char)
            new_word << char          
        else 
            new_word += word.reverse[idx + 1, word.length - 1]
            break
            
        end
    end
    new_word.reverse

end

def vowel_counts(str)
    vowels = 'aeiou'
    dic = Hash.new(0)
    str.downcase.each_char do |let|
        if vowels.include?(let)
            dic[let] += 1
        end
    end
    dic

end

def caesar_cipher(mess, num)
    alph = 'abcdefghijklmnopqrstuvwxyz'
    new_mess = ''
    mess.each_char do |char|
        if alph.include?(char)
            idx = alph.index(char)
            new_mess << alph[(idx + num) % 26]
        else 
            new_mess << char
        end
    end
    new_mess
end
#cinot