require 'faker'

letters = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}

FactoryGirl.define do
  factory :answer do
    sequence(:letter, 0) { |n| letters[n] }
    text { Faker::TheFreshPrinceOfBelAir.quote }
    question

    trait :without_text do
      text ''
    end

    trait :without_letter do
      letter ''
    end
  end
end
