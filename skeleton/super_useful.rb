# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue StandardError
    nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    puts "Thanks for the coffee, but what i really want is fruit."
  end
end

class NotFruitError < StandardError
  def message 
    puts "Thanks for nothing, bye!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError 
  else
    raise NotFruitError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message 
    retry
  rescue NotFruitError => e
    puts e.message 
  end 
end  

# PHASE 4


class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise ArgumentError.new("You need to be friends for at least 5 years.") if @yrs_known < 5
    raise ArgumentError.new("Cannot read name or favorite past time") if (@name.length <= 0 || @fav_pastime.length <= 0)
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


