FactoryGirl.define do
  factory :dreamer do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password "foobar"
  end
end