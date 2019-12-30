class QueenGame
    DIMENTION = 8
    def initialize(*names)
        @players = []
        names.each { |name| @players << Player.new(name) }
        @places = []
        @counts = Hash.new(0)
        @current_player = @players[0]
    end

    def valid_place?(coordinate)
        coordinate.all? { |co| (0...DIMENTION).include?(co) }
    end

    def count_place?(coordinate)
        @places.none? { |place| place[0] == coordinate[0] || place[1] == coordinate[1] || place[0] - coordinate[0] == place[1] - coordinate[1] } 

    end

    def take_turn
        idx = @players.index(@current_player)
        @current_player = @players[idx % @players.length]
    end

    def play
        until end?
            until valid_place?(coordinate = @current_player.get_placement)
                puts "out of range"
            end
            if count_place?(coordinate)
                @places << coordinate 
                @counts[@current_player] += 1
            end
            print_places
            take_turn
        end
        print_counts
    end

    def end?
        @places.length == DIMENTION
    end

    def print_places
        (0...DIMENTION).each { |x|  print x }
        puts
        (0...DIMENTION).each do |row|
            print row
            (0...DIMENTION).each do |column|
                @places.include?([row, column]) ? print "*" : print " "
            end
            puts 
        end
    end

    def print_counts
    end



end