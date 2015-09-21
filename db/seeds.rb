Dreamer.delete_all
Recipe.delete_all
Dream.delete_all
Step.delete_all

10.times do
  d = FactoryGirl.create(:dreamer)
  c = FactoryGirl.create(:dreamer)
  4.times do
    Step.create(FactoryGirl.attributes_for(:step).merge(creator: c, dreamer: d))
  end
  4.times do
    ds = d.dreams.create(FactoryGirl.attributes_for(:dream))
    5.times do
      ds.favorites.create(fan: d)
    end
  end
end
