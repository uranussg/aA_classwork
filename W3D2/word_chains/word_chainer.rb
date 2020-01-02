class WordChainer
    def initialize(dictionary_file_name)
        @dictionary = File.read(dictionary_file_name)
    end

    def adjacent_words(word)
        @dictionary.select do |cond_word|
            diff = cond_word.count.with_index {|char, idx| char != word[idx]  }
            diff < 2
        end

    end
end