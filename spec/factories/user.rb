require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_digest { 'ASDFSFAFASDFSDFAF'}

    trait :without_email do
      email ''
    end

    trait :short_password do
      password 12345
    end
  end
end
