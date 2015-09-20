require 'rails_helper'

describe Recipe do
  context "associations" do
    it "should have many steps" do
      should have_and_belong_to_many(:steps)
    end
  end
end