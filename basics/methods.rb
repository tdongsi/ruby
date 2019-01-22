
def produce_spaceship(type: :freighter, size: :xl, tank_volume: 400, engine_count: 2)
  puts "Produced"
end

produce_spaceship(type: :freighter, size: :m, tank_volume: 100,engine_count: 4)

def produce_spaceship(type = :freighter, size: :m, engine_count: 2)
  puts "Produced 2"
end

produce_spaceship(:explorer, size: :xml, engine_count: 4)

def produce_spaceship(type = :freigther, size: :m, **custom_components)
  components = {engine: :standard}
  components.merge!(custom_components)

  puts size
  p components
end

build_params = {size: :xl, engine: :toyota}
produce_spaceship(:yacht, **build_params)
customized = {seats: :leather}
produce_spaceship(:yacht, size: :s, **customized)

puts '#################################'

#################################
# Demo of operator overloading
#################################


class Spaceship
  attr_reader :name
  attr_reader :speed

  def initialize(name)
    @name = name
    @speed = 0
    @cargo = []
  end

  def <<(cargo)
    @cargo << cargo
  end

  def <=>(other)
    @name <=> other.name
  end

  def +@
    @speed += 10
  end

  def -@
    @speed -= 10
  end

  def !
    puts "Self-destructed"
  end
end

ship1 = Spaceship.new("Archangel")
ship2 = Spaceship.new("Dominion")
ship3 = Spaceship.new("Cherubim")

class Cargo; end
cargo_pod = Cargo.new
ship1 << cargo_pod

p ship1

ships = [ship1, ship2, ship3]
temp = ships.sort.map do |u|
  u.name
end
p temp

+ship1
p ship1
-ship1

!ship1

puts '#################################'

#################################
# Usage of method_missing
#################################

class Cargo
  def method_missing(name, *args)
    case name
    when /^find_by_([a-z]+)_and_([a-z]+)$/
      find($1.to_sym => args[0], $2.to_sym => args[1])
    when /^find_by_([a-z]+)$/
      find($1.to_sym => args[0])
    else
      super
    end
  end

  private

  def find(attrs)
    puts "Finding cargo by #{attrs.inspect}"
  end
end

cargo = Cargo.new
cargo.find_by_destination("New York")
cargo.find_by_weight_and_volume(100, 10)
# cargo.find_by_Weight_or_Volume(100, 10)
