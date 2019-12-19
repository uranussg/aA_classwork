class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end

  def valid?(position)
    position.all? { |ele| (0..2).include?(ele) }
  end

  def empty?(position)
    @grid[position[0]][position[1]] == "_"
      
  end
  def place_mark(position, mark)
    if empty?(position) && valid?(position)
        @grid[position[0]][position[1]] = mark  
    else  
        raise "can not place"
    end
  end

  def print
    @grid.each { |row| puts row.join(" ") } 
  end

  def win_row?(mark)
    @grid.any? { |row| row.all?(mark)}
  end

  def win_col?(mark)
    @grid.transpose.any? { |col| col.all?(mark)}
  end

  def win_diagonal?(mark)
    (0..2).all? { |i| @grid[i][i] == mark } || (0..2).all? { |i| @grid[i][2-i] == mark }
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.flatten.any?("_")
  end

end