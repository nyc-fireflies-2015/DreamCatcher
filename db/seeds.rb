Dreamer.delete_all
Recipe.delete_all
Dream.delete_all
Step.delete_all

10.times do
  c = FactoryGirl.create(:dreamer)
  4.times do
    s = Step.create(FactoryGirl.attributes_for(:step).merge(creator: c))
      10.times do
        s.dreamers << FactoryGirl.create(:dreamer)
      end
  end
  4.times do
    ds = c.dreams.create(FactoryGirl.attributes_for(:dream))
    5.times do
      ds.favorites.create(fan: c)
    end
  end
end
