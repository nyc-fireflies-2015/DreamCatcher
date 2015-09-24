10.times do
  c = FactoryGirl.create(:dreamer)
  c.steps << Step.all
  4.times do
    ds = c.dreams.create(FactoryGirl.attributes_for(:dream))
    3.times do
      hashtag = FactoryGirl.create(:hashtag)
      ds.hashtags << hashtag
    end
    5.times do
      ds.favorites.create(fan: c)
    end
  end
end
