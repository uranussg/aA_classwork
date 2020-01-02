require_relative "board"

class Suduko
    def initialize(file)
        @board = Board.new(file)
    end

    def get_position
        puts "Enter the position that you would like to input "
        pos = gets.chomp.split.map(&:to_i)
    end

    def get_value
        puts "Enter the value that you would like to input "
        value = gets.chomp.to_i
    end

    def valid_pos?(pos)
        pos.all? { |num| (0..8).include?(num) } && !@board[pos].given
    end

    def valid_value?(value)
        (1..9).include?(value)

    end

    def input_guess(pos, value)
        @board[pos] = value
    end

    def play
        until @board.solved?
            until valid_pos?(pos = get_position) && valid_value?(value = get_value)
                puts "invalid position or value"
            end

        end
        puts "you win!"
    end

end