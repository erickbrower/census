require 'faker'

FactoryGirl.define do
  factory :answer do
    text { Faker::TheFreshPrinceOfBelAir.quote }
    exam

    trait :without_text do
      text ''
    end
  end
end
