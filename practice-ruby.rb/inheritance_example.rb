# take this code and use inheritence: https://gist.github.com/peterxjang/e9b69b4de36b2c41ef4b

class Vehicles
  def initialize
    @speed = 0
    @direction = "north"
  end

  def brake
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def turn(new_direction)
    @direction = new_direction
  end
end

class Car < Vehicles
  def honk_horn
    puts "Beeeeeeep!"
  end
end

class Bike < Vehicles
  def ring_bell
    puts "Ring ring!"
  end
end

car = Car.new
bike = Bike.new

car.honk_horn
bike.ring_bell
