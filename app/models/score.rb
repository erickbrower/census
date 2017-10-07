class Score < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
end
