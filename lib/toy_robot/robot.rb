# frozen_string_literal: true

module ToyRobot
  class Robot
    FACES = %w[NORTH EAST SOUTH WEST].freeze
    attr_accessor :x, :y, :face

    def initialize(x: x = 0, y: y = 0, face: face = 'NORTH')
      @x = x
      @y = y
      @face = face
    end

    def move(w,h)
      case @face
      when 'EAST'
        move_east(w)
      when 'WEST'
        move_west
      when 'NORTH'
        move_north(h)
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

    private

    def move_east(w)
      @x += 1 if @x < w
    end

    def move_west
      @x -= 1 if @x.positive?
    end

    def move_north(h)
      @y += 1 if @y < h
    end

    def move_south
      @y -= 1 if @y.positive?
    end
  end
end
