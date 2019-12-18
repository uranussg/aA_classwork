require_relative "room"

class Hotel
    attr_accessor :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end
    def name
        @name.split.map {|word| word.capitalize}.join(' ')
    end

    def room_exists?(str)
        @rooms.has_key?(str)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            @rooms[room_name].add_occupant(person) ? (print 'check in successful') : (print 'sorry, room is full')
        else
            print 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full? }
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k + '.*' + v.available_space.to_s
        end
    end
  
end


