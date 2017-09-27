class Exam < ApplicationRecord

  validates :title, presence: true, on: :create

  belongs_to :user
  has_many :questions
end
