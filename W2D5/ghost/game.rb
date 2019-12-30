require_relative "player.rb"
require_relative "aiplayer.rb"

require 'byebug'
class GhostGame 
    DICTIONARY = {}
    File.read("dictionary.txt").split.each { |el| DICTIONARY[el] = 0 }
    
    attr_reader = :current_player, :previous_player

    def initialize(*names)
        @fragment = ""
        @dictionary = DICTIONARY

        @players = [AIPlayer.new("robot")]
        names.each {|name| @players << Player.new(name) }
   
        @losses = Hash.new(0)
        @id = 0
        @current_player = @players[@id]
    end
    
    def next_player!
        @id = (@id + 1) % @players.length
        @previous_player = @current_player
        @current_player = @players[@id]
    end

    def take_turn(player)

        if player.is_a?(AIPlayer)
            *args = @fragment, @players.length, @dictionary
        else  
            *args = nil
        end
        until valid_play?(guess = player.guess(*args))
            puts "Invalid guess"
        end
        # debugger
        @dictionary = @dictionary.select { |key, value| key.start_with?(@fragment + guess) }
        puts @fragment += guess
        
    end


    def valid_play?(str)
        raise "Exit called" if str.downcase == 'exit'
        ('a'..'z').to_a.include?(str) && @dictionary.keys.any? { |key| key.start_with?(@fragment + str) }
    end

    def lose?
        @dictionary.has_key?(@fragment)
    end

    def play_round
        until lose?
            take_turn(@current_player)
            next_player!
        end
        @losses[@previous_player] += 1
        @fragment = ''
        @dictionary = DICTIONARY
        puts "#{@previous_player.name} loses the round!"
        print_record
    end

    GHOST = { 0 => "", 1 => "G", 2 => "G H", 3 => "G H O", 4 => "G H O S", 5 => "G H O S T" }
    def print_record
        puts '---------------------------'
        @players.each do |player |
            puts player.name.ljust(16) + "| " + GHOST[@losses[player]]
        end
        puts '---------------------------'

    end

    def run
        until @losses.values.any?(5)
            play_round
        end
        puts "#{@previous_player.name} is the ghost!"
    end

end
