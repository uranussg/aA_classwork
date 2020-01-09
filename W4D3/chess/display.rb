# 
require 'colorize'
require_relative "cursor"
require_relative "board"

class Display 
  #include colorize
  def initialize(board)
    @board = board
    @cursor = Cursor.new([3,0], board)
  end

  def render
    # print " "
    # (0..7).each {|i| print i }
    # print " "
    # puts 
    @board.board.each.with_index do |row, rdx|
      # print rdx
      row.each_with_index do |piece, cdx| 
        if @cursor.cursor_pos == [rdx, cdx] 
          print "\u25A1"
        else
        #end
          print piece.symbol
        end
      end
      # print rdx
    puts if rdx < 7
    true
    end 
    # print " "
    # (0..7).each {|i| print i }
    # print " "

  end

  def move_cur
    while true 
      system("clear")
      render
      @cursor.get_input
      
    end
  end



end



b = Board.new
b.move_piece!('b', [1,0], [3, 0])

b.move_piece!('b', [0,0],[2, 0])

b_copy = b.b_dup


d = Display.new(b)

d_copy = Display.new(b_copy)
b_copy.move_piece!('b', [2,0],[2, 6])
# p b_copy[[1,1]].pos
# p b[[1,1]].pos

d.render

puts
puts
d_copy.render

d.move_cur