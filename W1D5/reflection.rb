


def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

# meddling
def conjunct_select(array, *prcs)
    prcs.inject(array) { |acc, prc| acc.select(&prc) }
end


def convert_pig_latin(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word.length > 2 ? convert_word(word) : word
        word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(' ')
end

def convert_word(word)
    vowels = 'AEIOUaeiou'
    return word + 'yay' if vowels.include?(word[0])
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[i..-1] + word[0...i] + 'ay'
        end
    end
end


def compress(string)
    compressed = ''
    letters = ('a'..'z').to_a
    i = 0
    while i < string.length
        char = string[i]
        count = 1
        i += 1
        while char == string[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end

    compressed
end