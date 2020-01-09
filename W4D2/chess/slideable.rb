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
          pos_moves << new_pos 
          i += 1
        else 
          break 
        end
      end
    end  

    
  end
end
