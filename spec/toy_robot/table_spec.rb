# frozen_string_literal: true

require 'spec_helper'
RSpec.describe ToyRobot::Table do
  subject { ToyRobot::Table.new(4, 4) }

  describe '#within_boundary?' do
    it { should be_within_boundary(4, 0) }
    it { should be_within_boundary(3, 4) }
    it { should_not be_within_boundary(5, 0) }
    it { should_not be_within_boundary(0, 5) }
  end
end
