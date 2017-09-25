require 'rails_helper'

describe Sitting, type: :model do
  describe 'validation' do
    it 'fails when score is not a number' do
      sitting = build(:sitting, :score_not_a_number)
      expect(sitting).not_to be_valid
    end
  end
end
