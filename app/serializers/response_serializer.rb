class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :answer_id, :created_at
end
