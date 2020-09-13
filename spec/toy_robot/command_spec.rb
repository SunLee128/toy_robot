# frozen_string_literal: true

require 'spec_helper'
RSpec.describe ToyRobot::Command do
  path = File.dirname(__FILE__)
  valid_commands = ToyRobot::Command.new(path + '/sample_commands/commands1.txt')
  invalid_no_place = ToyRobot::Command.new(path + '/sample_commands/commands2.txt')
  invalid_out_of_range = ToyRobot::Command.new(path + '/sample_commands/commands3.txt')

  describe '#initialize' do
    it 'reads file and returns array' do
      expect(valid_commands.commands).to be_an_instance_of(Array)
    end
  end

  describe '#process' do
    it "scans for string starts with 'PLACE' and converts to Array" do
      commands = ['PLACE 0,0,NORTH']
      expect(valid_commands.process(commands)).to be_an_instance_of(Array)
    end
  end

  describe '#valid?' do
    it "looks for 'place array' as the first item" do
      expect(invalid_no_place.placed?).to be false
    end
  end
end
