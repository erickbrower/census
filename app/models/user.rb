class User < ApplicationRecord
  devise :database_authenticatable

  has_many :role, through: :user_roles
  has_many :courses, through: :enrollments

  validates :email, presence: true
end
