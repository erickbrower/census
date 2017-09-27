class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :exam_id, :text, :created_at, :updated_at
end
