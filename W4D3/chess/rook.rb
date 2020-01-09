class Rook < Piece
  include Slideable
  def move_dirs
    HORIZONTAL_DIRS
  end
end