class Animal

    def initialize(name)
        @name = name
    end


    protected
    attr_reader :name
end

class Dog < Animal
end

class Cat < Animal
    def hi(animal)
        p "#{name} say hi to #{animal.name}"
    end

    protected
    attr_reader :name
end



d = Dog.new('dog')

c = Cat.new('cat')

a = Animal.new('animal')

c.hi(d) #"cat say hi to dog" if protectd method is inherited 
        # error if dog class define it's own protected method

c.hi(a) #"cat say hi to animal" always happen.


