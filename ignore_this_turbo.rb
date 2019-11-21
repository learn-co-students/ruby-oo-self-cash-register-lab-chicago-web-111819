require 'pry'


class Snail 
    attr_accessor :name, :speed

    def initialize(name, speed)
        @name = name 
        @speed = speed 
    end

    def speed_up(boost)
        @speed += boost
    end
end

binding.pry

turbo = Snail.new("Turbo", 200)
puts turbo.name # should print "Turbo"
puts turbo.speed # should print 200
turbo.speed_up(50)
puts turbo.speed # should print 250