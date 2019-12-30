require_relative "item"
require_relative "list"
require "byebug"

class TodoBoard
    def initialize
        @lists = {}
    end

    def make_list(label)
        @lists[label] = List.new(label)
    end

    def show_lists
        @lists.keys.each {|el| puts el }
    end

    def print_lists
        @lists.values.each {|v| v.print }
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        if args.length != 0
            list_label = args[0]
            args = args[1..-1]
        end
        nums = args.map(&:to_i)

        case cmd
        when 'mklist'of
            make_list(list_label)
        when 'ls'
            show_lists
        when 'showall'
            print_lists
        when 'mktodo'
            @lists[list_label].add_item(*args)
        when 'toggle'
            @lists[list_label].toggle_item(*nums)
        when 'up'
            @lists[list_label].up(*nums)
        when 'down'
            @lists[list_label].down(*nums)
        when 'swap'
            @lists[list_label].swap(*nums)
        when 'sort'
            @lists[list_label].sort_by_date!
        when 'priority'
            @lists[list_label].print_priority
        when 'rm'
            @lists[list_label].remove_item(*nums)
        when 'purge'
            @lists[list_label].purge
        when 'print'
            if nums.length == 0
                @lists[list_label].print
            else
                @lists[list_label].print_full_item(*nums)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end      
    
    def run 
        until !get_command
        end
    end

end

