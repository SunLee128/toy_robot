module ToyRobot
  class Table
    attr_reader :width, :height
    def initialize(width, height)
      @width = width
      @height = height
    end

    def within_boundary?(x, y)
      x.between?(0,@width) && y.between?(0,@height)
    end
  end
end

