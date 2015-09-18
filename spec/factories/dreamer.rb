FactoryGirl.define do
  factory :dreamer do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    about { Faker::Lorem.paragraph }
    recipe { Faker::Lorem.paragraph }
    zipcode { Faker::Address.zip }
    password "foobar"
  end

  factory :invalid_dreamer do
    username { Faker::Name.name }
    email nil
    about { Faker::Lorem.paragraph }
    recipe { Faker::Lorem.paragraph }
    zipcode { Faker::Address.zip }
    password "foobar"
  end
end