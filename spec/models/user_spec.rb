require 'rails_helper'

describe User do
  describe 'validation' do
    it 'fails when missing email' do
      user = FactoryGirl.build(:user, :without_email)
      expect(user).not_to be_valid
    end

    it 'fails when password is too short' do
      user = FactoryGirl.build(:user, :short_password)
      expect(user).not_to be_valid
    end
  end
end
