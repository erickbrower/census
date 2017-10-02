class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :letter, :text, :question_id, :created_at, :updated_at

  belongs_to :question
  has_many :responses
end
