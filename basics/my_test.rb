require 'test/unit'

require_relative 'methods'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @ship = Spaceship.new('Serenity')
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_name
    assert(@ship.name == 'Serenity')
  end

  def test_plus
    +@ship
    assert_equal(@ship.speed, 10)
    -@ship
    assert_equal(0, @ship.speed)
  end

end