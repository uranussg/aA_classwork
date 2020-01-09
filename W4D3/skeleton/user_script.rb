require_relative 'super_useful'

# puts "'five' == #{convert_to_int('five')}"

# feed_me_a_fruit
begin
  puts "Whats your bestfriend's name?"
  name = gets.chomp 
  puts "What's yalls favorite pasttime?"
  fav_pasttime = gets.chomp
  puts "How long have you two been friends?"
  yrs_known = gets.chomp.to_i
  sam = BestFriend.new(name, yrs_known, fav_pasttime)

rescue StandardError => e 
  puts e.message

  retry
ensure

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet

  end


