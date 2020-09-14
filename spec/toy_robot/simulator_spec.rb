# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ToyRobot::Simulator do
  path = File.dirname(__FILE__)
  simulator1 = ToyRobot::Simulator.new(table_width: 4, table_height: 4, file: path + '/sample_commands/commands1.txt')
  simulator2 = ToyRobot::Simulator.new(table_width: 4, table_height: 4, file: path + '/sample_commands/commands2.txt')
  simulator3 = ToyRobot::Simulator.new(table_width: 4, table_height: 4, file: path + '/sample_commands/commands3.txt')
  simulator4 = ToyRobot::Simulator.new(table_width: 4, table_height: 4, file: path + '/sample_commands/commands4.txt')
  simulator5 = ToyRobot::Simulator.new(table_width: 4, table_height: 4, file: path + '/sample_commands/commands5.txt')


  # context 'checks the validity of the first command ' do
  #   it 'checks whether the first command is "place"' do
  #     expect(simulator2).to_return('Simulation cannot commence since the first command is not executable. Please check the command.')
  #   end
  # end

  describe '#start' do
    it 'if the command is valid, it calls #run method' do
      simulator1.start
      expect(simulator1).to receive(:run)
      simulator1.send(:run)
    end

    it 'if the command is invalid, it does not start' do
      simulator2.start
      expect(simulator2.start).to be_nil
    end
  end

  describe '#valid_start?' do
    it 'returns true when the first command is "PLACE"&& the placement is within table && face value is valid' do
      expect(simulator1.valid_start?).to eq(true)
    end

    it 'returns false when the first command is not "PLACE"' do
      expect(simulator2.valid_start?).to eq(false)
    end

    it 'returns false when the first placement is out of table' do
      expect(simulator3.valid_start?).to eq(false)
    end

    it 'returns false when the first command is not Arary' do
      expect(simulator4.valid_start?).to eq(false)
    end

    it 'returns false when the face value is not valid' do
      expect(simulator5.valid_start?).to eq(false)
    end
  end

  describe "#report" do
    it 'prints the current location if the robot is placed' do
      expect{simulator1.report}
        .to output{"The Robot is currently at x:3, y:3 and facing NORTH."}
        .to_stdout
    end

    it 'prints "The Robot is not placed" if the robot is not placed' do
      expect{simulator2.report}
      .to output{'The Robot is not placed.'}
      .to_stdout
    end
  end

  describe "#place" do
    it 'does not place robot when x,y is out of table boundary' do 
      expect{simulator1.place(6,7, "NORTH")}
      .to output{'The place command at x:6, y:7 is invalid. The command is ignored.'}
      .to_stdout
    end
  end
end
