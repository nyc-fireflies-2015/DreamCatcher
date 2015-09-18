FactoryGirl.define do
  factory :dream do
    story { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
  end

  factory :invalid_dream, parent: :dream do
    story nil
  end
end
