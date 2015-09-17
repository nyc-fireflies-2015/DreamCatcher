require 'rails_helper'

describe Favorite do
  context "associations" do
    it "belongs to a dream" do
      should belong_to :dream
    end
    it "belongs to a fan with class name Dreamer" do
      should belong_to(:fan).class_name(Dreamer)
    end
  end
end