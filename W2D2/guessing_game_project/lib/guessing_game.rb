class GuessingGame
    attr_reader :num_attempts

    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        @game_over = true if num == @secret_num
        if num == @secret_num
            print 'you win'
        elsif num > @secret_num
            print 'too big'
        else  
            print 'too small'
        end
    end

    def ask_user
        print 'enter a number'
        num = gets.chomp.to_i
        self.check_num(num)
    end


        
        
    
end



