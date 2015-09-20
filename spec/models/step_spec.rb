require 'rails_helper'

describe Step do
  context "associations" do
    it "has many recipes" do
      should have_and_belong_to_many(:recipes)
    end
    it "belongs to a creator (class name Dreamer)" do
      should belong_to(:creator).class_name(Dreamer)
    end
  end
end