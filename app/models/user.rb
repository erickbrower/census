class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  attr_accessor :password

  validates :email, :password,  presence: true
  validates :password, length: { minimum: 8 }
end
