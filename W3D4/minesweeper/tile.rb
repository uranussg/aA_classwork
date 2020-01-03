class Tile
    attr_reader :revealed, :bomb
    attr_accessor :n_bombs
    def initialize(bomb)
        @bomb = bomb
        @revealed = false
        @n_bombs = 0
        @flagged = false
    end

    def reveal
        @revealed = true if !flagged
    end

    def flag
        @flagged = !flagged
    end

    def to_s
        if revealed
            return @n_bombs
        else 
            return ' '
        end
    end
end