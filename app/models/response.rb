class Response < ApplicationRecord

  belongs_to :sitting
  belongs_to :answer

  delegate :question, to: :answer
end
