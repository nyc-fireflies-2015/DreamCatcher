require 'rails_helper'

describe Dream do
  context 'associations' do
    it "should belong to a dreamer" do
      should belong_to :dreamer
    end
    it "should have many favorites" do
      should have_many :favorites
    end
    it "should have many hashtags" do
      should have_many :hashtags
    end
  end
  context 'validations' do
    it "validates the presence of story" do
      should validate_presence_of :story
    end
    it "validates the presence of title" do
      should validate_presence_of :title
    end
  end
end