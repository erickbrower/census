require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validation' do
    it 'fails when text is empty' do
      question = build(:question)
      question.text = ''
      expect(question).not_to be_valid
    end
  end
end
