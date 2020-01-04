require "byebug"

class PolyTreeNode

    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
 #       debugger
        parent.children.delete(self) if parent
  #      debugger
        @parent = node
 #       debugger
        if node && !node.children.include?(self)
  #          debugger
            node.children << self 
        end
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        Raise "Not a child" if !children.include?(node) 
        node.parent = nil
    end

    def dfs(target)
        return self if value  == target 
        children.each do |child|
            result = child.dfs(target)
            return result if result
        end
        nil
    end

    def bfs(target)
        queue = [self]
        while queue.length > 0
            node = queue.shift
            if node.value == target
                return node
            else  
                queue += node.children
            end
        end
        nil
    end

end