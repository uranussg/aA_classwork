require_relative "poly_tree_node.rb"

class KnightPathFinder

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def self.valid_moves(pos)
        x , y = pos
        arr = [x - 2, x + 2].product([y - 1, y + 1]) + [ x - 1, x + 1].product([y - 2, y + 2])  
        arr.select {|pos| pos.all?{|x| (0...8).include?(x)}}
    end

    def new_move_positions(pos)
        new_pos = KnightPathFinder.valid_moves(pos).reject{|pos| @considered_positions.include?(pos)}
        @considered_positions += new_pos
        new_pos
    end

    def build_move_tree(ending_pos)
        queue = [@root_node]
        while queue.length > 0
            #p queue
            node = queue.shift
            return node  if node.value == ending_pos
            pos = node.value
            next_moves = new_move_positions(pos)
 #           p next_moves
            next_moves.each do |pos|
                child_node = PolyTreeNode.new(pos)
                node.add_child(child_node)
                queue << child_node
            end
        end
        return nil

    end



end


kpf = KnightPathFinder.new([0, 0])
#p kpf.new_move_positions([2, 1])

p kpf.build_move_tree([3, 3])