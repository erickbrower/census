class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  attr_accessor :password

  validates :email, presence: true, length: { minimum: 8 }
  validates :password, presence: true
end
