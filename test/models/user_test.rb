require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'has email' do
    assert_respond_to(user, :email)
  end

  test 'has password_digest' do
    assert_respond_to(user, :password_digest)
  end

  test 'is invalid without email' do
    u = user
    u.email = ''
    assert(!u.valid?)
  end

  test 'is invalid without password' do
    u = user
    u.password_digest = ''
    assert(!u.valid?)
  end

  test 'is invalid when password is shorter than 8 chars' do
    u = user
    u.password = '1'
    assert(!u.valid?)
  end

  private
  def user
    User.first
  end
end
