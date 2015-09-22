FactoryGirl.define do
  factory :dreamer do
    username { Faker::Name.name }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    about { Faker::Lorem.paragraph }
<<<<<<< HEAD
=======
    zipcode { Faker::Address.zip }
    avatar_url { Faker::Avatar.image }
    phone_num "3157083034"
>>>>>>> cron tasks, twilio text and sidekiq working
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
