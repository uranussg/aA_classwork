require_relative "item.rb"
require "byebug"

class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end


    def add_item(title, deadline, description='')
        if Item.valid_date(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        (0...size).include?(index)
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts '--------------------------------------------------'
        puts @label.center(50)
        puts '--------------------------------------------------'
        puts 'Index | Item                 | Deadline   | Done  '
        puts '--------------------------------------------------'
        (0...size).each do |i|
            str = ''
            str += " #{i}".ljust(6) + "|"
            str += " #{@items[i].title}".ljust(22) + "|"
            str += " #{@items[i].deadline } ".ljust(12)  + "|"
            str += @items[i].done ? " [\u2713]" : " [ ]" 
            puts str
        end
        puts '--------------------------------------------------'

    end


    def print_full_item(index)
        # debugger
        if valid_index?(index)
            puts '--------------------------------------------------'
            str =''
            str += "#{@items[index].title}".ljust(32) + "#{@items[index].deadline}".ljust(12) 
            str += @items[index].done ? " [\u2713]" : " [ ]" 
            puts str
            puts "#{@items[index].description}"
            puts '--------------------------------------------------'
        end
    end


    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        if valid_index?(index)
            (0...amount).each do |i|
                if !swap(index - i, index - i - 1)
                    break
                end
            end
            true
        else
            false
        end
    end

    def down(index, amount=1)
        if valid_index?(index)
            (0...amount).each do |i|
                if !swap(index + i, index + i + 1)
                    break
                end
            end
            true
        else
            false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle if valid_index?(index)
    end

    def remove_item(index)
        if valid_index?(index)
            @Items.delete_at(index)
        end
    end

    def purge
        @items = @items.select { |item| !item.done }
    end
end


# l = List.new('Groceries')
# l.add_item('cheese', '2019-10-25')
# l.add_item('toothpaste', '2019-10-25')
# l.print
# l.toggle_item(0)
# l.print
# l.purge
# l.print