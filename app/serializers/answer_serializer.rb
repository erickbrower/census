class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :letter, :text, :created_at, :updated_at
end
