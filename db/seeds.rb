Dreamer.delete_all
Recipe.delete_all
Dream.delete_all
Step.delete_all
Hashtag.delete_all

Step.create(description: "Upon awakening, remain absolutely still while you recall the essential elements of the dream and log it in DreamCatcher.", default: true)
Step.create(description: "Wear a digital watch and read the words or numbers on the watch. If the characters are normal, stable, and sensible, then you probably aren't dreaming.", default: true)
Step.create(description: "Look for dream signs (elements that indicate that you are dreaming).", default: true)
Step.create(description: "Awaken one hour earlier than usual, stay awake for 30 to 60 minutes, then go back to sleep.", default: true)
Step.create(description: "Imagine your surroundings are a dream. Intently imagine that what you are seeing, hearing, smelling, and feeling is all a dream.", default: true)
Step.create(description: "Try to fly! If it works, you're most likely dreaming", default: true)

Dreamer.create(name: "DreamCatcher", username: "DreamCatcher", password: "dreamingfireflies", email: "dreamcatcher@gmail.com")

a = Dreamer.create(name: "Deren", username: "ddog", password: "password", email: "deren@gmail.com")
b = Dreamer.create(name: "Abby", username: "downtonabby", password: "password", email: "abby@gmail.com")
c = Dreamer.create(name: "James", username: "rickjames", password: "password", email: "james@gmail.com")
d = Dreamer.create(name: "Ramon", username: "razorramon", password: "password", email: "ramon@gmail.com")

users = [a, b, c, d]

users.each do |user|
  2.times do
    dream = user.dreams.create(title: Faker::Book.title, story: Faker::Company.bs, consciousness_clarity: [true, false].sample , decision_clarity: [true, false].sample, dream_state_clarity: [true, false].sample )
    2.times do
      hashtag = Hashtag.create(name: Faker::Hacker.ingverb)
      dream.hashtags << hashtag
    end
  end
end
