class Exam < ApplicationRecord

  validates :title, presence: true

  belongs_to :user
  has_many :answer
end
