require 'rails_helper'

describe Exam do
  describe 'validation' do
    it 'fails when title is missing' do
      exam = build(:exam, :without_title)
      expect(exam).not_to be_valid
    end
  end
end
