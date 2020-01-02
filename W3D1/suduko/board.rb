require_relative "tile"

class Board
    def initialize(file)
        @grid = Board.from_file(file)
    end

    def self.from_file(file)
        f = File.new(file, chomp: true)
        arr = f.readlines(file).map { |line| line.split('').map(&:to_i) }

        arr.each do |row|
            row.map do |num| 
                given = true unless num == 0                   
                Tile.new(num, given) 
            end
        end
        arr
    end

    def [](pos)
        x, y = pos[0], pos[1]
        @grid[x][y]
    end

    def []=(pos, value)
        x, y = pos[0], pos[1]
        @grid[x][y].value = value unless @grid[x][y].given

    end

    def solved_row?
        @grid.all? { |row| row.map { |tile| tile.value } .sum == 9 }
    end

    def solved_column?
        @grid.transpose.all? { |row| row.map { |tile| tile.value } .sum == 9 }
    end

    def solved_square?
        start_pos = [0, 3, 6].product([0, 3, 6])
        start_pos.all? do |start| 
            sum = 0
            3.times do |r|
                3.times do |c|
                    sum += @grid[[r, c]]
                end
            end
            sum == 9
        end
    end

    def solved?  
        solved_row? && solved_column? && solved_square?
    end
end