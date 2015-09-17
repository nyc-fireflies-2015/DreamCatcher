FactoryGirl.define do
  factory :dream do
    story { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
  end
end