
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
