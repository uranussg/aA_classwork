#when refering class constant(outside or inside):
#Code::POSSIBLE_PEGS

#never refer to a input arg outside the method

x, y = [1, 2, 3, 4]
TEST = 5
class Try
    TEST = 4
    def get
        TEST
    end
end

p Try::TEST #4
p TEST #5
p Try.new.get #4


def legal_positions
    indices = (0...@grid.length).to_a
    positions = indices.product(indices)
    positions.select { |pos| empty?(pos) }
end



def get_position(legal_positions)
    pos = nil
    until legal_positions.include?(pos)
        puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(' ').map(&:to_i)
        puts "#{pos} is not a legal position" if !legal_positions.include?(pos)
        raise 'sorry, that was invalid :(' if pos.length != 2
    end
    pos
end