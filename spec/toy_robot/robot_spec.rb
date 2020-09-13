# frozen_string_literal: true

require 'spec_helper'
RSpec.describe ToyRobot::Robot do
  table = ToyRobot::Table.new(4, 4)
  subject { ToyRobot::Robot.new(table: table) }
  describe 'attributes' do
    it 'allows read and write for :x' do
      subject.x = 2
      expect(subject.x).to eq(2)
    end

    it 'allows read and write for :y' do
      subject.y = 3
      expect(subject.y).to eq(3)
    end

    it 'allows read and write for :face' do
      subject.face = 'SOUTH'
      expect(subject.face).to eq('SOUTH')
    end
  end

  describe '#initialize' do
    it 'has x' do
      expect(subject.x).not_to be_nil
    end
    it 'has y' do
      expect(subject.y).not_to be_nil
    end
    it 'has face' do
      expect(subject.face).not_to be_nil
    end
  end

  describe '#move' do
    it 'moves east' do
      subject.face = 'EAST'
      subject.x = 0
      subject.y = 0
      subject.move
      expect(subject.x).to eq(1)
    end

    it 'does not fall on east edge' do
      subject.face = 'EAST'
      subject.x = 4
      subject.y = 0
      subject.move
      expect(subject.x).to eq(4)
    end

    it 'moves west' do
      subject.face = 'WEST'
      subject.x = 3
      subject.y = 0
      subject.move
      expect(subject.x).to eq(2)
    end

    it 'does not fall on west edge' do
      subject.face = 'WEST'
      subject.x = 0
      subject.y = 0
      subject.move
      expect(subject.x).to eq(0)
    end

    it 'moves north' do
      subject.face = 'NORTH'
      subject.x = 0
      subject.y = 0
      subject.move
      expect(subject.y).to eq(1)
    end

    it 'does not fall onnorth edge' do
      subject.face = 'NORTH'
      subject.x = 0
      subject.y = 4
      subject.move
      expect(subject.y).to eq(4)
    end

    it 'moves south' do
      subject.face = 'SOUTH'
      subject.x = 0
      subject.y = 4
      subject.move
      expect(subject.y).to eq(3)
    end

    it 'does not fall on south edge' do
      subject.face = 'SOUTH'
      subject.x = 0
      subject.y = 0
      subject.move
      expect(subject.y).to eq(0)
    end
  end

  describe '#turn_left' do
    it 'changes face from NORTH to WEST when turn left' do
      subject.face = 'NORTH'
      expect(subject.turn_left).to eq('WEST')
    end

    it 'changes face from WEST to SOUTH when turn left' do
      subject.face = 'WEST'
      expect(subject.turn_left).to eq('SOUTH')
    end

    it 'changes face from SOUTH to EAST when turn left' do
      subject.face = 'SOUTH'
      expect(subject.turn_left).to eq('EAST')
    end

    it 'changes face from EAST to NORTH when turn left' do
      subject.face = 'EAST'
      expect(subject.turn_left).to eq('NORTH')
    end
  end

  describe '#turn_right' do
    it 'changes face from NORTH to EAST when turn right' do
      subject.face = 'NORTH'
      expect(subject.turn_right).to eq('EAST')
    end

    it 'changes face from EAST to SOUTH when turn right' do
      subject.face = 'EAST'
      expect(subject.turn_right).to eq('SOUTH')
    end

    it 'changes face from SOUTH to WEST when turn right' do
      subject.face = 'SOUTH'
      expect(subject.turn_right).to eq('WEST')
    end

    it 'changes face from WEST to NORTH when turn right' do
      subject.face = 'WEST'
      expect(subject.turn_right).to eq('NORTH')
    end
  end
end
