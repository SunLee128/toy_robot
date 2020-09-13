# frozen_string_literal: true

module ToyRobot
  class Robot
    FACES = %w[NORTH EAST SOUTH WEST].freeze
    attr_accessor :x, :y, :face

    def initialize(x: x = 0, y: y = 0, face: face = 'NORTH', table: table)
      @x = x
      @y = y
      @face = face
      @table = table
    end

    def move
      case @face
      when 'EAST'
        move_east
      when 'WEST'
        move_west
      when 'NORTH'
        move_north
      when 'SOUTH'
        move_south
      end
    end

    def turn_left
      left_face_index = FACES.find_index(@face) - 1
      @face = FACES[left_face_index]
    end

    def turn_right
      index = FACES.index(@face)
      @face = FACES.rotate[index]
    end

    # def falling?
    #   (@x == 0 and face =="WEST") ||
    #   (@y == 0 and face == "SOUTH") ||
    #   (@x == @table.width and face == "EAST") ||
    #   (@y == @table.height and face == "NORTH")
    # end

    private

    def move_east
      @x += 1 if @x < @table.width
    end

    def move_west
      @x -= 1 if @x.positive?
    end

    def move_north
      @y += 1 if @y < @table.height
    end

    def move_south
      @y -= 1 if @y.positive?
    end
  end
end
