# Demo of method visibility "protected"

class Spaceship
  def launch
    batten_hatches
    # do others
  end

  attr_reader :call_sign
  protected :call_sign

  def initialize
    @call_sign = "Argo"
  end

  def call_sign_matches?(other)
    call_sign == other.call_sign
  end

end

class FastSpaceship < Spaceship
  def initialize
    @call_sign = "Fast"
  end
end

ship = Spaceship.new
fast_ship = FastSpaceship.new
puts fast_ship.call_sign_matches?(ship)
# This will give error since call_sign is not public
# puts ship.call_sign

# DEMO: Monkey patching
puts "abc".size
# Change behavior of String class in standard library
class String
  def size
    "Won't tell you"
  end
end
puts "abc".size