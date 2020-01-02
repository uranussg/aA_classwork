require_relative "board"

class MemoryGame 
    attr_reader :board
    def initialize(size)
        @size = size
        @board = Board.new(@size)
        @board.populate 
        @previous_guess = nil 
    end

    def get_position
        puts "Enter the position of the card that you would like to flip "
        position = gets.chomp
        position.split.map(&:to_i)
    end

    def make_guess(guess_pos)
        @board[guess_pos].reveal 
        system("clear") #clears the terminal 
        @board.render 
        if !@previous_guess.nil?


            if @board[guess_pos] == @board[@previous_guess]
                @board[guess_pos].reveal 
                @board[@previous_guess].reveal 
                puts "it is a match!"
            else  
                @board[guess_pos].hide
                @board[@previous_guess].hide 
                puts "Try again!"
            end
            @previous_guess = nil
        else  
            # print "111"
            @previous_guess = guess_pos

            @board[@previous_guess].reveal 
        end
    end

    def valid_guess?(position)
        return false if position.length != 2 
        return false if !position.all? { |num| (0...@size).include?(num) } 
        return false if @board[position].face_up
        true  
    end


    #str.match?(/^\d+\s\d+$/)

    #regex
    def play
        until @board.won?
            system("clear")
            @board.render 
            until valid_guess?(guess_pos = get_position)
                puts "INVALID GUESS"
            end
            # print guess_pos
            make_guess(guess_pos)
            sleep(3)
        end
        @board.render 
        puts "You Win!"
    end







end