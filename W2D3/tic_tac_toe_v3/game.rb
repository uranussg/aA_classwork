require_relative "human_player"
require_relative "computer_player"

class Game
    def initialize(n, marks_hash)
        @players = marks_hash.keys.map { |mark|  marks_hash[mark] ? ComputerPlayer.new(mark) : HumanPlayer.new(mark) }
        @current_player = @players[0]
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate![0] 
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position(@board.legal_positions)
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "#{@current_player.mark} WINS!"
                return
            else
                self.switch_turn
            end
        end    
        puts "it is a draw"
    end


end