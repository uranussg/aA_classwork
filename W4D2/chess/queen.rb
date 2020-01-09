class Bishop < Piece
  include Slideable
  def move_dirs
    DIAGONAL_DIRS + HORIZONTAL_DIRS
  end
end