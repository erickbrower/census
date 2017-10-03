FactoryGirl.define do
  factory :user do
    passwords = Faker::Internet.password(8)

    email { Faker::Internet.email }
    password { passwords }
    password_confirmation { passwords }
  end
end
