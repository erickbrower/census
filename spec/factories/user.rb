require 'faker'

FactoryGirl.define do
  passwords = Faker::Internet.password(8)
  factory :user do
    email { Faker::Internet.email }
    password { passwords }
    password_confirmation { passwords }
    password_digest { 'ASDFSFAFASDFSDFAF'}

    trait :without_email do
      email ''
    end

    trait :short_password do
      password 12345
      password_confirmation 12345
    end
  end
end
