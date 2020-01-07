require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    current_board = game.board.dup
    current_node = TicTacToeNode.new(current_board, mark)
    # current_node.children.each { |child| return child.prev_move_pos if child.winning_node?(mark) }
    # current_node.children.each { |child| return child.prev_move_pos if !child.losing_node?(mark) }
    winning = current_node.children.select { |child| child.winning_node?(mark) }
    not_losing = current_node.children.select { |child| !child.losing_node?(mark) }
    return (winning.sample || not_losing.sample).prev_move_pos
    raise "error"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
