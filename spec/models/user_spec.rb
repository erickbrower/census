require 'rails_helper'

describe User do
  describe 'validation' do
    it 'fails when missing email' do
      u = User.create({email: 'something@somewhere.com', password_digest: 'something'})
      expect(u).not_to be_valid
    end

    it 'fails when password is too short' do
      u = User.create({email: 'something@somewhere.com', password_digest: 'something'})
      u.password = '1'
      expect(u).not_to be_valid
    end
  end
end
