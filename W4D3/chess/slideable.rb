require_relative "piece"

module Slideable
  HORIZONTAL_DIRS=[[1, 0], [-1, 0],[0, 1],[0, -1]]
  DIAGONAL_DIRS=[[1, 1],[-1, -1],[1,-1],[-1,1]]

  def moves

    pos_moves = []
    self.move_dirs.each do |x, y|
      i = 1
      while true
        new_pos = [pos[0]+x*i, pos[1]+y*i]
        if self.board.valid_pos?(new_pos) 
          if is_null?(new_pos)

            pos_moves << new_pos 
            i += 1
          else
            pos_moves << new_pos unless @board[new_pos].color == color
            break
          end
        else 
          break 
        end
      end
    end 
    pos_moves 
  end

  def is_null?(pos)
    @board[pos].color == 'n'
  end
end

class Bishop < Piece
  include Slideable
  def move_dirs
    DIAGONAL_DIRS
  end

  def symbol
    color == 'w' ?  "\u2657" : "\u265D"
  end

  def valid_moves
    moves
  end

end



class Queen < Piece
  include Slideable
  def move_dirs
    DIAGONAL_DIRS + HORIZONTAL_DIRS
  end
  def symbol
    color == 'w' ?  "\u2655" : "\u265B"
  end

  def valid_moves
    moves
  end
end


class Rook < Piece
  include Slideable
  def move_dirs
    HORIZONTAL_DIRS
  end
  def symbol
    color == 'w' ?  "\u2656" : "\u265C"
  end

  def valid_moves
    moves
  end

end
