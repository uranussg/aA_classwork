class Knight < Piece
  include Stepable
  def move_diffs
    [-2, 2].product([-1, 1]) + [-1, 1].product([-2, 2])
  end
end