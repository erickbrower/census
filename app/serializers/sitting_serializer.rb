class SittingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :exam_id, :score, :created_at, :updated_at
end
