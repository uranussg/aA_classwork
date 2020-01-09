# require_relative "slideable"
# require_relative "stepable"

class Piece
  attr_accessor :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def valid_moves
    arr = []
  end

  def symbol
  end

  def p_dup(b)
    self.class.new(color, b, pos.dup)
  end

end

class Pawn < Piece
  def move_dirs
    [[1, 1], [1, -1]]
  end
  def symbol
    color == 'w' ?  "\u2659" : "\u265F"
  end

  def valid_moves
    forward_step + side_attacks
  end

  private

  def at_start_row?
    color == 'b' ? pos[0] == 1 : pos[0] == 6
  end
  
  def forward_dir
    color == 'b' ? 1 : -1
  end

  def forward_step
    ret = []
    (1..2).each do |i|  
      new_pos = [pos[0] + i * forward_dir, pos[1]]
      if board[new_pos].color == 'n' 
          ret << new_pos
          return ret if !at_start_row?
      else     
          return ret
      end
      end
    ret     
  end


  def side_attacks
    ret = []
    move_dirs.each do |x, y|
      new_pos = [pos[0] +x, pos[1] + y]
      ret << new_pos if board[new_pos].color != (color || 'n')
    end
    ret 
  end
end

require 'singleton'

class NullPiece < Piece
#  include Singleton
  def initialize(board)
    @color = 'n'
    @board = board
  end
  def symbol
    ' '
  end

  def p_dup(b)
    self
  end

end 

# load 'display.rb'
# b = Board.new
# b.move_piece!('b', [1,0],[3, 0])

# b.move_piece!('b', [2,0],[2, 4])
# d = Display.new(b)
# d.render