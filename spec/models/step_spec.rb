require 'rails_helper'

describe Step do
  context "associations" do
    it "has many recipes" do
      should have_and_belong_to_many(:recipes)
    end
  end
end