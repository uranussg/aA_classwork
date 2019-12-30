class Board
    
    attr_reader :size

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.

    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size) } 
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)

        @grid.any? { |row| row.all? { |el| el == mark } }
    end

    def complete_col?(mark)
        @grid.transpose.any? { |col| col.all? { |el| el == mark } }
    end

    def complete_diag?(mark)
        (0...@size).all? { |idx| self[[idx, idx]] == mark } || (0...@size).all? { |idx| self[[@size - idx - 1, idx]] == mark }
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end

    def print
        @grid.each { |row| p row }
    end



end
