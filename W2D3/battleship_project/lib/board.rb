class Board
  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end
  
  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.map { |sub_arr| sub_arr.count(:S) }.sum

    #@grid.flatten.count(:S)
  end

  def attack(position)
    if self[position] == :S
        self[position] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[position] = :X
        return false
    end
  end

  def place_random_ships
    l = self.size / 4
    i = 0
    while i < l
        position = [rand(Math.sqrt(self.size)), rand(Math.sqrt(self.size))]
        if self[position] != :S
            i += 1
            self[position] = :S
        end
    end
  end

  def hidden_ships_grid
    new_grid = Array.new(Math.sqrt(self.size)) { Array.new(Math.sqrt(self.size)) }
    @grid.each_with_index do |sub_arr, r|
        sub_arr.each_with_index do |ele, c|
            ele == :S ? new_grid[r][c] = :N : new_grid[r][c] = ele
        end
    end 
    new_grid       
  end

  def self.print_grid(grid)
    grid.each { |row| puts row.join(' ') }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)      
  end
end


