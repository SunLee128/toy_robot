# frozen_string_literal: true

require 'pry'
module ToyRobot
  class Command
    attr_reader :commands, :place_location

    # converts txt file into array of commands
    def initialize(file)
      raw_commands = File.readlines(file, chomp: true).map(&:upcase).map(&:strip)
      @commands = process(raw_commands)
    end

    def place_location
      @place_location = [@commands[0][1].to_i, @commands[0][2].to_i, @commands[0][3]]
    end

    private

    # process methods removes "" && scans for "PLACE" and converts to array of values 
    def process(commands)
      empty_s_removed = commands.select { |s| s.length > 1 }
      processed_commands = []

      empty_s_removed.each do |c|
        processed_commands << if c.upcase.start_with?('PLACE')
                                c.split(/[, ]/)
                              else
                                c
                              end
      end
      processed_commands
    end
  end
end
