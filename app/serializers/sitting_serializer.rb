class SittingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :exam_id, :created_at
end
