class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, "_") }
  end

  def valid?(position)
    position.all? { |ele| (0...@grid.length).include?(ele) }
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
    (0...@grid.length).all? { |i| @grid[i][i] == mark } || (0...@grid.length).all? { |i| @grid[i][@grid.length - 1 -i] == mark }
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.flatten.any?("_")
  end

  def legal_positions
    arr = []

    @grid.each_with_index do |sub_arr, r|
      sub_arr.each_with_index do |ele, c|
        arr << [r, c] if ele == "_"
      end
    end
    arr
  end
end