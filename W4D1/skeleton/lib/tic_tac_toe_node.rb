require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
#  MARKS = [:x, :o]
  attr_reader :board, :prev_move_pos, :next_mover_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over? 
      # p board.rows
      # p 'already lose'
     return (board.winner != nil) && (board.winner != evaluator)
    end
    if evaluator == @next_mover_mark
      # p board.rows
      # p 'all lose node'
      return children.all? { |node| node.losing_node?(evaluator) }
    else 
      return children.any? { |node| node.losing_node?(evaluator) }
      # p board.rows
      # p 'oppenent winner'
    end
  end

  def winning_node?(evaluator)
    if board.over? 
      return board.winner == evaluator
    end
    if evaluator == @next_mover_mark
      return children.any? { |node| node.winning_node?(evaluator) }
    else 
      return children.all? { |node| node.winning_node?(evaluator) }
    end
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    arr = []
    [0, 1, 2].product([0, 1, 2]).each do |pos|
      if board.empty?(pos)
        c_board = board.dup
        c_board[pos] = next_mover_mark
 #       debugger
        new_mark = (next_mover_mark == :x ? :o : :x)
 #       debugger
        arr << TicTacToeNode.new(c_board, new_mark, pos)
  #      debugger 
      end
    end
    arr
  end

end

# n = TicTacToeNode.new(Board.new, :x)
# p n.children.all? { |kid| kid.next_mover_mark == :o }

#     node = TicTacToeNode.new(Board.new, :o)
#       node.board[[0, 0]] = :x
#       node.board[[0, 1]] = :x
#       node.board[[0, 2]] = :o
#       node.board[[1, 1]] = :o
#       node.board[[1, 0]] = :x
# #      node.board[[2, 0]] = :o
  
# opponent_winner = node
#p opponent_winner.children.any? { |node| node.losing_node?(:x) }
# p opponent_winner.losing_node?(:x)