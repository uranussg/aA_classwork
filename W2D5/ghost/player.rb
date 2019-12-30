class Player
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess(*args)
        puts "#{@name}'s turn to guess"
        gets.chomp #returns a char
    end

    def alert_invalid_guess

    end

end