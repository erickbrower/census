class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :letter, :text, :question_id, :created_at, :updated_at
end
