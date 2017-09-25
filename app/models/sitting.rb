class Sitting < ApplicationRecord

  validates :score, numericality: true, allow_nil: true

  belongs_to :user
  belongs_to :exam

  has_many :responses
end
