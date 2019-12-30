class AIPlayer
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess(fragment, n, dict)
        win_chars = ('a'..'z').select do |char| 
            !dict.keys.include?(fragment + char) ? new_word = fragment + char : next #if the new word is in dictionary test the next char
            dict.keys.any? { |key| key.start_with?(new_word) && key.length <= fragment.length + n } 
        end
        win_chars.empty? ? ('a'..'z').to_a.sample : win_chars.sample 

     
    end

end


# carriage
# 'ca'
# r