require 'rails_helper'

describe Answer do
  describe 'validation' do
    it 'fails when text is missing' do
      a = Answer.new
      expect(a).not_to be_valid
    end
  end
end
