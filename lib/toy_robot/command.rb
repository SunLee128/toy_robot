module ToyRobot
  class Command
    attr_reader :commands

    def initialize(file)
      raw_commands=File.readlines(file,:chomp => true).map(&:upcase).map(&:strip)
      @commands = process(raw_commands)
      # p @commands
    end

    def process(commands)
      @processed_commands=[]
      commands.each do |c|
        if c.upcase.start_with?('PLACE')
          @processed_commands << c.scan(/\w+/)
        else
          @processed_commands << c
        end
      end
      return @processed_commands
    end

    def placed?
      @commands[0][0] == "PLACE"
    end
  end
end
