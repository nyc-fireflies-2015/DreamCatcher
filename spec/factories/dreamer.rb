FactoryGirl.define do
  factory :dreamer do
    username { Faker::Name.name }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    about { Faker::Lorem.paragraph }
    country "US"
    state "NY"
    gender "queer"
    password "password"
  end

  factory :invalid_dreamer do
    username { Faker::Name.name }
    name { Faker::Name.name }
    email nil
    about { Faker::Lorem.paragraph }
    password { Faker::Internet.password(8) }
  end
end
