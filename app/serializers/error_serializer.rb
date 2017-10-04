module ErrorSerializer
  def self.serialize(object)
    object.errors.messages.map do |field, errors|
      errors.map do |error_message|
        {
          field: field,
          message: error_message
        }
      end
    end.flatten
  end
end
