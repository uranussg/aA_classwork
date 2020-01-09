require_relative "piece"
require_relative "slideable"
require_relative "stepable"
#require_relative "display"
class Board 
  
  attr_reader :board, :positions

  def initialize
    @board = Array.new(8) {Array.new(8){}}
    @null = NullPiece.new(self)
    @positions = {'b' => [],  'w' => []}
    self.add_pieces(pieces)
  end

   
  # def self.new_board
  #   top_pieces = Array.new(2) {Array.new(8) {Piece.new}}
  #   bo_pieces = Array.new(2) {Array.new(8) {Piece.new}}
  #   middle = Array.new(4) {Array.new(8) {NullPiece.new}}
  #   top_pieces + middle + bo_pieces
  # end

  def move_piece!(color, start_pos, end_pos)
    # if self[start_pos].is_a?(NullPiece) 
    #   raise "There is no piece to move"
    # end 
    if self[start_pos].color != color
      raise "That's not your piece"
    end
    unless self[start_pos].valid_moves.include?(end_pos)
      raise "Invalid Move"
    end
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = @null

  end



  def b_dup
    copy_board = Board.new
    (0..7).each do |rdx|
      (0..7).each do |cdx|
        puts copy_board[[rdx, cdx]]
        puts self[[rdx, cdx]]
        puts self[[rdx, cdx]].p_dup(self)
        copy_board[[rdx, cdx]] = self[[rdx, cdx]].p_dup(copy_board)
      end
    end
    copy_board
  end



  def pieces 
    firstline = [[Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]] 
    secondline = [[Pawn] * 8]
    middle = Array.new(4) {Array.new(8) {}}

    firstline + secondline + middle + secondline + firstline
  end

  def add_pieces(pieces)
    pieces.each_with_index do |subarr, row|
      subarr.each_with_index do |el, col|
        pos = [row, col]
        if row < 2 
          color =  'b'
          self[pos] = el.new(color, self, pos) 
          positions['b'] << self[pos]
        elsif row > 5
          color = 'w'
          self[pos] = el.new(color, self, pos)
          positions['w'] << self[pos]
        else  
          color ='n'
          self[pos] = @null
        end
       

      end
    end
  end

  def [](pos)
    x,y = pos
    board[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    board[x][y] = piece 
  end 

  def valid_pos?(pos)
    pos.all? {|coor| (0..7).include?(coor)}
  end


  def in_check?(color)
    
    positions[color].each do |pieces|
      if pieces.is_a?(King)
        king_pos =  pieces.pos
        break
      end
    end

    op_color = (color == 'b' ? 'w' : 'b')
    positions[op_color].any? { |piece| piece.valid_moves.include?(king_pos) }

  end

  def checkmate?(color)
    positions[color].each do |pieces|
      if pieces.is_a?(King)
        king_val_pos =  pieces.valid_moves
        break
      end
    end
     op_color = (color == 'b' ? 'w' : 'b')
    king_val_pos.all? do |king_pos|
      positions[op_color].any? { |pieces| pieces.valid_moves.include?(king_pos) }
    end
  end

end

# b = Board.new
# p b.board
