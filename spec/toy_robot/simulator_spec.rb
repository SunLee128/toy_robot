# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ToyRobot::Simulator do
  let(:commands1) { ToyRobot::Command.new(path + '/sample_commands/commands1.txt') }
  let(:commands2) {ToyRobot::Command.new(path + '/sample_commands/commands2.txt') }
  let(:commands3) {ToyRobot::Command.new(path + '/sample_commands/commands3.txt') }
  subject { ToyRobot::Simulator.new }

  describe '#initialize' do
    it 'has a Table' do
      expect(subject.table).to be_an_instance_of(ToyRobot::Table)
    end
    it 'has a Command' do
      expect(subject.input).to be_an_instance_of(ToyRobot::Command)
    end
    it 'has a Robot' do
      expect(subject.robot).to be_an_instance_of(ToyRobot::Robot)
    end
  end

  context 'checks the validity of the first command ' do
    it 'checks whether the first command is "place"' do
    end
  end
end
