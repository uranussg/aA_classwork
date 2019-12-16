class Dog
    @@legs = 4
    @@tail = 1
    def initialize(name, age, color)
        @name = name
        @age = age
        @color = color
    end

    def name
        @name
    end

    def age
        @age
    end

    def self.cut_tail
        @@tail = 0
    end

    def self.bark
        p 'woof'
    end

    def sit
        "#{@name} sit down"
    end

    def yell_name
        p @name + "!"
    end

    def one_year_passed
        @age += 1
    end

    def sit_and_eat
        self.sit + " and eat"
    end
end

#p Dog.legs
never = Dog.new('never', 4, 'white')
#p never.tail
p never.sit
p never.one_year_passed
Dog.bark
p never.sit_and_eat