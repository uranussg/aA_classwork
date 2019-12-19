require_relative "board"

class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "this is your mark #{self.mark}"
        puts "enter the position as two numbers with a space between them like '0 1'"
        str = gets.chomp
        if str.split('').count(" ") != 1
            raise "need 1 white space"
        end
        position = str.split.map(&:to_i)
        # if input.length != 2
        #     raise "needs 2 numbers"
        if position.any? { |ele| ele != ele.to_i }
            raise "needs to be number"
        else  
            return position
        end
    
        
      
    end
    
end