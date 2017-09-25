require 'rails_helper'

describe Exam do
  describe 'validation' do
    it 'fails when title is missing' do
      exam = Exam.new
      expect(exam).not_to be_valid
    end
  end
end
