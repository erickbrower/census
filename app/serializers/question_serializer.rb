class QuestionSerializer < ActiveModel::Serializer
  attributes :id,
             :exam_id,
             :number,
             :text,
             :created_at,
             :updated_at

  has_many :answers
  belongs_to :exam
end
