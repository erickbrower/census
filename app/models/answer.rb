class Answer < ApplicationRecord

  validates :text, :letter, presence: true

  belongs_to :question
  has_many :responses
end
