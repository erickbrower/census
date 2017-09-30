class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :exam_id, :number, :text, :created_at, :updated_at
end
