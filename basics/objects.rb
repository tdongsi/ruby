class Spaceship

    def launch(dest)
        @destination = dest
    end

    def destination
        @destination
    end

end

ship = Spaceship.new
ship.launch("Earth")
puts ship.inspect
# p ship

# Instance variables are private while methods are public by default
puts ship.destination

class SpaceShip
    attr_accessor :destination  # equal attr_reader + attr_writer
    attr_reader :name
    attr_writer :name

    # This method is called whenever new is used
    def initialize(name, cargo_count)
        @name = name
        @cargo_count = cargo_count
        puts "In SpaceShip initializer"
    end

    def alert
        puts "Red alert!!"
    end

    private :alert
end

ship = SpaceShip.new("None", 4)
ship.destination = "Mars"
ship.name = "Dreadnought"
puts ship.destination
puts ship.name

class Battlecruise < SpaceShip

    # Class variables
    @@GUN_COUNT = 4

    def self.rally
        puts "Rally all battlecruises"
    end

    def initialize(name)
        # NOTE: the call "super" is different from "super()"
        # The former get arguments (1) from input while the latter get 0 argument.
        super(name, @@GUN_COUNT)
        puts "Creating Battlecruise: #{name}"
    end

    def defense
        # NOTE: Private method is accessible from subclass
        alert
        puts "Shield up!"
    end

    def ==(other)
        name == other.name
    end

end

warship = Battlecruise.new("Argo")
puts warship.name
Battlecruise.rally
warship.defense
# To actually execute private method
warship.send :alert

ship2 = Battlecruise.new("Argo")
puts warship == ship2