require 'rails_helper'

describe Step do
  context "associations" do
    it "belongs to a creator (class name Dreamer)" do
      should belong_to(:creator).class_name(Dreamer)
    end
    it "have many dreamers" do
      should have_may(:dreamers).through(:recipes)
    end
  end
end
