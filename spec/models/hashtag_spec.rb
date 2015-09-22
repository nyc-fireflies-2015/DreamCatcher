require 'rails_helper'

describe Hashtag do
  context "associations" do
    it "should have many dreams" do
      should have_many :dreams
    end
  end
end