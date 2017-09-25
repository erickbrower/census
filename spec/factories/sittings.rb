FactoryGirl.define do
  factory :sitting do
    user
    exam
    score 100

    trait :score_not_a_number do
      score 'A'
    end
  end
end
