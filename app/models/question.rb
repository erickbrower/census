class Question < ApplicationRecord
  validates :text, presence: true

  belongs_to :exam
  has_many :answers
end
