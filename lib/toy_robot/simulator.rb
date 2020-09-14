# frozen_string_literal: true
require 'pry'
module ToyRobot
  class Simulator
    def initialize(table_width:, table_height:, file:)
      @table = Table.new(table_width, table_height)
      @input = Command.new(file)
      @start_x = @input.place_location[0]
      @start_y = @input.place_location[1]
      @start_face = @input.place_location[2]
      check_commands
    end

    private

    def check_commands
      if valid?
        @robot = Robot.new(x: @start_x, y: @start_y, face: @start_face)
        run
      else
        puts 'Simulation cannot commence since the first command is not executable. Please check the command'
      end
    end

    def valid?
      # @input.place_location !=nil && 
      placed? &&
      @table.within_boundary?(@start_x, @start_y) && 
      ['NORTH', 'SOUTH', 'EAST', 'WEST'].include?(@start_face) 
      
    #   #check first command is place
    #   #check start x, y exist
    #   # check x,y position is within table
    #  check face value - 
    end

    def placed?
      # checks whether the first command is 'place'
      @input.commands[0].class == Array && 
      @input.commands[0][0] == 'PLACE'
    end

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

    def report
      puts "The Robot is currently at x:#{@robot.x}, y:#{@robot.y} and facing #{@robot.face}."
    end

    def place(x, y, face)
      if @table.within_boundary?(x, y)
        @robot.x = x
        @robot.y = y
        @robot.face = face
      else
        puts 'The location is not no the table'
      end
    end
# binding.pry
  end
end