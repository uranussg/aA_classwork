class Animals
    def initialize(name, age)
        @name = name
        @age = age
        @relatives = []
    end

    def relatives
        @relatives
    end
end

lily = 
require "byebug"

arr = [1, 2, 3, 4]
arr[0...-1].each_with_index do |n, i|
    arr[i + 1] = 1
    debugger
end