require_relative "human_player"

class Game
    def initialize(n, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players[0]
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate![0] 
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
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