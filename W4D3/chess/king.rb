class King < Piece
  include Stepable
  def move_diffs
    [-1, 1].product([-1, 1]) + [[0, 1], [1, 0], [-1, 0], [0, -1]]
  end
end