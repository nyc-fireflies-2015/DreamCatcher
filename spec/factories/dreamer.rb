FactoryGirl.define do
  factory :dreamer do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    about { Faker::Lorem.paragraph }
    recipe { Faker::Lorem.paragraph }
    zipcode { Faker::Address.zip }
    password "password"
  end

  factory :invalid_dreamer do
    username { Faker::Name.name }
    email nil
    about { Faker::Lorem.paragraph }
    recipe { Faker::Lorem.paragraph }
    zipcode { Faker::Address.zip }
    password { Faker::Internet.password(8) }
  end
end
