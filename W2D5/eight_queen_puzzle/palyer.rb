class Player
    def initialize(name)
        @name = name
    end

    def get_placement
        puts "#{@name} please place"
        str = gets.chomp
        str.split.map(&:to_i)
    end
end



  