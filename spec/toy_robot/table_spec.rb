# frozen_string_literal: true

require 'spec_helper'
RSpec.describe ToyRobot::Table do
  subject { ToyRobot::Table.new(4, 4) }

  describe '#initialize' do
    it 'has table width' do
      expect(subject.width).not_to be_nil
    end
    it 'has table height' do
      expect(subject.height).not_to be_nil
    end
  end

  describe '#within_boundary?' do
    it { should be_within_boundary(4, 0) }
    it { should be_within_boundary(3, 4) }
    it { should_not be_within_boundary(5, 0) }
    it { should_not be_within_boundary(0, 5) }
  end
end
