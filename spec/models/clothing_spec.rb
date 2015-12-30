require 'rails_helper'

RSpec.describe Clothing do
  context 'minimums' do
    it 'pants are valid at 5 or more dollars' do
      pants = FactoryGirl.build(:clothing)

      expect(pants).to be_valid
    end

    it 'pants are invalid at 5 or less dollars' do
      pants = FactoryGirl.build(:clothing)

      pants.minimum = 4

      expect(pants).to_not be_valid
    end

    it 'top are valid at 2 or more dollars' do
      top = FactoryGirl.build(:top)

      expect(top).to be_valid
    end

    it 'top are invalid at 2 or less dollars' do
      top = FactoryGirl.build(:top)

      top.minimum = 1

      expect(top).to_not be_valid
    end

  end
end