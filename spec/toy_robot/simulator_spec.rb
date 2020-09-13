# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ToyRobot::Simulator do
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

  context
end
