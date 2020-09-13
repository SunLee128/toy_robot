# frozen_string_literal: true

module ToyRobot
  class Command
    attr_reader :commands, :place_location

    # converts txt file into array of commands
    def initialize(file)
      raw_commands = File.readlines(file, chomp: true).map(&:upcase).map(&:strip)
      @commands = process(raw_commands)
    end

    # scans for "place" and converts to array of values
    def process(commands)
      @processed_commands = []
      commands.each do |c|
        @processed_commands << if c.upcase.start_with?('PLACE')
                                 c.scan(/\w+/)
                               else
                                 c
                               end
      end
      @processed_commands
    end

    def placed?
      # checks whether the first command is 'place'
      @commands[0][0] == 'PLACE'
    end

    def place_location
      @place_location = ([@commands[0][1].to_i, @commands[0][2].to_i, @commands[0][3]] if placed?)
    end
  end
end
