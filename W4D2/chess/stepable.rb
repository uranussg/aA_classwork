module Slideable

  def moves
    pos_moves = []
    self.move_dirs.each {|x, y| pos_moves << [[pos[0]+x, pos[1]+y]] } 
    pos_moves
  end
end
