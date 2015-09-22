FactoryGirl.define do
  factory :hashtag do
    name { Faker::Lorem.word }
  end
end