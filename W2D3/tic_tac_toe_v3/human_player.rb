require_relative "board"

class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "this is your mark #{self.mark}"
        puts "enter the position as two numbers with a space between them like '0 1'"
        str = gets.chomp
        # if str.split('').count(" ") != 1
        #     raise "need 1 white space"
        # end
        #position = str.split.map(&:to_i)
        # if position.any? { |ele| ele != ele.to_i }
        #     raise "needs to be number"
        # elsif !legal_positions.include?(position)
        #     raise "not a legal position"
        # else  
        #     return position
        # end

        str.match?(/^\d+\s\d+$/) ? (position = str.split.map(&:to_i)) : (raise "not a valid input")

        legal_positions.include?(position) ? (return position) : (raise "not a legal position")
    
        
      
    end
    
end