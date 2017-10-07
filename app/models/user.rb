class User < ApplicationRecord
  devise :database_authenticatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :scores

  validates :email, presence: true
end
