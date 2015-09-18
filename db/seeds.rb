# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  d = FactoryGirl.create(:dreamer)
  4.times do
    ds = d.dreams.create(FactoryGirl.attributes_for(:dream))
    5.times do
      ds.favorites.create(fan: d)
    end
  end
end