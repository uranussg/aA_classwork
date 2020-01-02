# The Board is responsible for keeping track of all your Cards. 
# You'll want a grid instance variable to contain Cards. Useful methods:

# #populate should fill the board with a set of shuffled Card pairs
# #render should print out a representation of the Board's current state
# #won? should return true if all cards have been revealed.
# #reveal should reveal a Card at guessed_pos 
# (unless it's already face-up, in which case the method should do nothing). 
# It should also return the value of the card it revealed (you'll see why later).
require_relative "card"
class Board 
    #stores the information that is inputed. directs input information.  displays the game.
    def initialize(size) #WE made it dynamic. it is the same work load if you dont. no hard coding because it is dynamic
        @size = size 
        @grid = Array.new(@size) { Array.new(@size) } #setting a 4x4, 6x6
    end

    def [](pos)
        x, y = pos[0], pos[1]
        @grid[x][y] #this is a getter method. allowing us to write syntactic sugar using @grid[pos] to gain access to card instances easier. 
    end

    def []=(pos, value)
        x, y = pos[0], pos[1]
        @grid[x][y] = Card.new(value)
    end

    def populate #when we initialize board. we automatically populate the board iwth card instances. happens once at beginning of game 
        # until @grid.flatten.none? { |ele| ele == nil }
        arr = ("A".."Z").to_a.sample( @size * @size / 2 ) #if you dont write the parenthesis it takes only 1 element--a.sample(num) ---returns array with that many sampled elements 
        #we only need half of the letters to fill up the board because we will be populating the grid with pairs. so two of each. 
        #we have our letters that will populate our board. 
        arr.each do |char|
            n = 2 
            while n > 0 # this inner loop makes sure that we are populating pairs. it only decrements we put place a char. initialize new char instance
                        #because it is an inner loop. it only reaches 0 when that same char has been placed in two different card instances. 
                r,c = rand(@size), rand(@size) #we want to put our lettes in a rand row and rand col. 
                if @grid[r][c].nil? #we are checking if the position is empty. if it isnt empty then we need to generate another position
                    @grid[r][c] = Card.new(char)
                    n -= 1 
                end
            end
            #once n == 0 and the pair is finished, we go into the next letter 
        end
        true #we dont want to show the array and inner information so we return true. also enables us to check if populates work(we didnt do that though)
    end


    def render
        #render = print...interaction between user and computer 
        print " " #this if for the blank space in the top left corner. 
        (0...@size).each { |idx| print idx } #print does not make new line it prints left to right 
        puts #^^^ prints the column numbers 
        (0...@size).each do |idx|
            print idx #first iteration prints the 0 so row_num 
            @grid[idx].each { |card| print card.to_s } #now it iteratates through row_num and in that row it calls .to_s which returns either the value or a blank space. so we print that. 
            puts #gives us a new line. so that we can start printing the next row 
        end
    end
    
    def won? 
        @grid.flatten.all? { |card| card.face_up } #flattens so that we count it easier. if all the cards are face up then we've won. 
        #for future use. have not written the code that would allow us to play. it is just setting the parameters under which we win. 
    end
    def reveal(guessed_pos)#this reveal is telling us which card that we want to reveal. it is directing us to the position of that card instnace. 
        x, y = guessed_pos[0], guessed_pos[1] #getting us the row and column 
        @grid[x][y].reveal #@grid[x][y] has a card instance there. so we call the reveal method FROM CARD (THERE ARE 2). so because we
        @grid[x][y].value #@grid[x][y] you are indexind into this pos @grid. and that is a card.instance. so you can call Card(instance).value because it is a card instance with a value inst. variable  
    end
    


end


    