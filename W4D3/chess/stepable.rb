require_relative "piece"

module Stepable

  def moves
    pos_moves = []
    self.move_diffs.each do |x, y| 
      new_pos =[pos[0]+x, pos[1]+y]
      if self.board.valid_pos?(new_pos) 

        pos_moves << new_pos unless @board[new_pos].color == color
      end
    end
    pos_moves
  end
end

class King < Piece
  include Stepable
  def move_diffs
    [-1, 1].product([-1, 1]) + [[0, 1], [1, 0], [-1, 0], [0, -1]]
  end

  def symbol
    color == 'w' ?  "\u2654" : "\u265A"
  end

  def valid_moves
    moves
  end

end

class Knight < Piece
  include Stepable
  def move_diffs
    [-2, 2].product([-1, 1]) + [-1, 1].product([-2, 2])
  end

  def symbol
    color == 'w' ?  "\u2658" : "\u265E"
  end
  def valid_moves
    moves
  end
end