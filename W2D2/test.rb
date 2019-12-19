require_relative '../W2D1/dog_project/lib/dog.rb'

class Teddy
    @@legs = Dog.legs
    attr_accessor :name, :age, :color, :legs
    def initialize(name, age, color)
        @name = name
        @color = color
        @age = age
        @legs = @@legs
        @babys = []
    end

    # def self.legs
    #     @@legs
    # end
end

lily = Teddy.new('lily', 4, 'white')
p lily.age
p lily.color
p lily.legs


arr.sample