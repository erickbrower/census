FactoryGirl.define do
  factory :question do
    text { Faker::MostInterestingManInTheWorld.quote }
    exam
  end
end
