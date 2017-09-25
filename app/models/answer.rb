class Answer < ApplicationRecord

  validates :text, presence: true

  belongs_to :exam
end
