class Bishop < Piece
  include Slideable
  def move_dirs
    DIAGONAL_DIRS
  end
end