FactoryGirl.define do
  factory :dream do
    story { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    consciousness_clarity { [true, false].sample }
    decision_clarity { [true, false].sample }
    dream_state_clarity { [true, false].sample }
  end

  factory :invalid_dream, parent: :dream do
    story nil
  end
end
