FactoryGirl.define do
  factory :dreamer do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    about { Faker::Lorem.paragraph }
    recipe { Faker::Lorem.paragraph }
    zipcode { Faker::Address.zip }
    password "foobar"
  end
end