# frozen_string_literal: true

module ToyRobot
  class Simulator
    attr_reader :table, :input, :robot

    def initialize
      @table = Table.new(4, 4)
      @input = Command.new('commands.txt')
      @robot = Robot.new
      check_command
    end

    private

    def check_command
      if input.placed? &&
         table.within_boundary?(input.place_location[0], input.place_location[1])
        run
      else
        puts 'Simulation cannot commence since the first command is not executible. Please check the command'
      end
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
  end
end
