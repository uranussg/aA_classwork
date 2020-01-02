# A Card has two useful bits of information: 
# its face value, and whether it is face-up or face-down. 
# You'll want instance variables to keep track of this information. 
# You'll also want a method to display information about the card: 
# nothing when face-down, or its value when face-up. 
# I also wrote #hide, #reveal, #to_s, and #== methods.

# Common problem: Having issues with #hide and #reveal? Try testing small.

class Card 
    attr_reader :value, :face_up 
    def initialize(letter)
        @value = letter 
        @face_up = false #it is either faceup or facedown. it is a boolean. do 1 thing if it is face up. another if it face down
        #instance var deciding whether the value(letter) needs to be displayed. 
    end
    def hide #hide method changes status of card to false 
        @face_up = false 
    end
    def reveal #reveal method changes status of card to true 
        @face_up = true 
    end
    def ==(another_card) #allowing us to write syntactic sugar later comparing the letters(values) of 2 cards 
        self.value == another_card.value 
    end
    def to_s #if its face_up we return value. we are not printing but we are preparing what will be printed in the board class
        if @face_up 
            return self.value 
        else 
            return ' ' #this empty space is what is being displayed throughout the game. the default display of the card class. it is not empty it is what we are asking it to display
        end

        # @face_up ? self.value : ' ' 
    end

end