FactoryGirl.define do
  factory :recipe do
    name { Faker::Book.title }
  end
end 