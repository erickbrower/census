require 'faker'

FactoryGirl.define do
  factory :exam do
    title { Faker::Name.title }
    user

    trait :without_title do
      title ''
    end
  end
end
