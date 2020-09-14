# frozen_string_literal: true

require 'spec_helper'
RSpec.describe ToyRobot::Command do
  path = File.dirname(__FILE__)
  valid_commands = ToyRobot::Command.new(path + '/sample_commands/commands1.txt')
  invalid_no_place = ToyRobot::Command.new(path + '/sample_commands/commands2.txt')
  invalid_out_of_range = ToyRobot::Command.new(path + '/sample_commands/commands3.txt')

  describe '#initialize' do
    it 'converts file into Array of commands' do
      expect(valid_commands.commands).to be_an_instance_of(Array)
    end
  end

  describe '#place_location' do
    it 'returns array' do
      expect(valid_commands.place_location).to be_an_instance_of(Array)
    end
  end

  context 'processing Strings' do
    valid_commands.commands.each do |c|
      it 'removes empty strings' do
        expect(c.length).to be > 0
      end
    end

    it "scans for 'PLACE' and converts to array of values" do
      expect(valid_commands.commands[0]).to be_an_instance_of(Array)
    end
  end
end
