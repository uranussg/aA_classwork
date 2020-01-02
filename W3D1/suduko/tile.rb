class Tile 
    attr_reader :given
    attr_accessor :value
    def initialize(value, given = false)
        @value = value
        @given = given
    end
end