class Board

    def self.empty_board(size)
        gird = Array.new(size) { Array.new(size) }
    end

    def self.seed_board(size)
        gird = self.empty_board(size)
        (0...size) do |ro|
            (0...size).each do |co|
                seed = (rand(size) == 0 ? true : false)
                grid[ro][co] = Tile.new(seed)
            end
        end
        grid
    end



    def initialize(size)
        @size = size
        @grid = self.seed_board(size)
    end

    def neighbors(pos)
        x, y = pos
        neighbors = [x - 1, x , x + 1].product([x - 1, x , x + 1])
        neighbors.select! { |neighbor| neighbor.all? |co| (0...size).include?(co) }
        neighbors.reject { |ele| ele == pos }
    end

    def get_neighbor_bombs
        (0...@size) do |ro|
            (0...@size).each do |co|
                n_bombs = neighbors.count { |pos| self[pos].bomb }
                self[pos].n_bombs = n_bombs
            end
        end
    end


    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def render
    end

end