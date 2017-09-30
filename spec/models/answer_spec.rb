require 'rails_helper'

describe Answer do
  describe 'validation' do
    it 'fails when letter is missing' do
      answer = build(:answer, :without_letter)
      expect(answer).not_to be_valid
    end

    it 'fails when text is missing' do
      answer = build(:answer, :without_text)
      expect(answer).not_to be_valid
    end
  end
end
