class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        str = gets.chomp
        str.split.map { |ele| ele.to_i }
    end

end
