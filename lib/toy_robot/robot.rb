# frozen_string_literal: true

module ToyRobot
  class Robot
    FACES = %w[NORTH EAST SOUTH WEST].freeze
    attr_accessor :x, :y, :face

    def initialize(x:, y:, face:)
      @x
      @y
      @face
    end

    def move(w, h)
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
      if @x < w
        @x += 1
      else
        puts 'Cannot move to East. The command is ignored.'
      end
    end

    def move_west
      if @x.positive?
        @x -= 1
      else
        puts 'Cannot move to West. The command is ignored.'
      end
    end

    def move_north(h)
      if @y < h
        @y += 1
      else
        puts 'Cannot move to North. The command is ignored.'
      end
    end

    def move_south
      if @y.positive?
        @y -= 1
      else
        puts 'Cannot move to South. The command is ignored.'
      end
    end
  end
end
