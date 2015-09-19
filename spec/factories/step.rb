FactoryGirl.define do
  factory :step do
    description { Faker::Book.title }
  end
end