class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :sitting_id, :answer_id, :created_at
end
