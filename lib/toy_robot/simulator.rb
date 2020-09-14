# frozen_string_literal: true

module ToyRobot

  class Simulator
    def initialize(table_width:, table_height:, file:)
      @table = Table.new(table_width, table_height)
      @input = Command.new(file)
      @start_x = @input.place_location[0]
      @start_y = @input.place_location[1]
      @start_face = @input.place_location[2]
    end

    def start
      if valid_start?
        @robot = Robot.new(x: @start_x, y: @start_y, face: @start_face)
        puts 'Toy Robot simulation started'
        run
      else
        puts 'Simulation cannot commence since the first command is not executable. Please check the command'
      end
    end

    def valid_start?
      # check first command is place
      # check start x, y is within table
      # check start face value is valid
      @input.commands[0].class == Array &&
        @input.commands[0][0] == 'PLACE' &&
        @table.within_boundary?(@start_x, @start_y) &&
        %w[NORTH SOUTH EAST WEST].include?(@start_face)
    end

    def report
      if valid_start?
        puts "The Robot is currently at x:#{@robot.x}, y:#{@robot.y} and facing #{@robot.face}."
      else
        puts 'The Robot is not placed.'
      end
    end

    def place(x, y, face)
      if @table.within_boundary?(x, y)
        @robot.x = x
        @robot.y = y
        @robot.face = face
      else
        puts "The place command at x:#{x}, y:#{y} is invalid. The command is ignored."
      end
    end

    private

    def run
      @input.commands.each do |command|
        if command.is_a?(Array)
          x = command[1].to_i
          y = command[2].to_i
          f = command[3]
          place(x, y, f)
        else
          case command
          when 'MOVE'
            @robot.move(@table.width, @table.height)
          when 'LEFT'
            @robot.turn_left
          when 'RIGHT'
            @robot.turn_right
          when 'REPORT'
            report
          end
        end
      end
    end
  end
end
