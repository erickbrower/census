class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  attr_accessor :password, :password_confirmation

  validates :email, presence: true

  validates :password,
            :password_confirmation,
            length: { minimum: 8 },
            if: :changing_password?

  has_many :exam

  private
  def changing_password?
    !password.blank? || !password_confirmation.blank?
  end
end
