require_relative "piece"

class Board 
  
  attr_reader :board

  def initialize
    @board = Board.new_board
  end
   
  def self.new_board
    top_pieces = Array.new(2) {Array.new(8) {Piece.new}}
    bo_pieces = Array.new(2) {Array.new(8) {Piece.new}}
    middle = Array.new(4) {Array.new(8) {NullPiece.new}}
    top_pieces + middle + bo_pieces
  end

  def move_piece(color, start_pos, end_pos)
    if board[start_pos].is_a?(NullPiece) 
      raise "There is no piece to move"
    end 
    if board[start_pos].color != color
      raise "That's not your piece"
    end
    unless @board[start_pos].valid_moves.include?(end_pos)
      raise "Invalid Move"
    end
    board[end_pos] = board[start_pos]
    board[start_pos] = NullPiece

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

end

b = Board.new
p b.board