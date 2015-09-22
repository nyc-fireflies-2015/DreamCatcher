require 'rails_helper'

describe Hashtag do
  context "associations" do
    it "should have many dreams" do
      should have_many :dreams
    end
  end
  context "parser" do
    it "should parse new hashtags from string with commas" do
      hashtag_string = "what, that, do, I, cool"
      expect{Hashtag.parse(hashtag_string)}.to change(Hashtag, :count).by 5
    end
    it "should recreate hashtags that already exist in db" do
      hashtag_string = "what, that, do, I, cool"
      expect(Hashtag.parse(hashtag_string).count).to be 5
      expect{Hashtag.parse(hashtag_string)}.to change(Hashtag, :count).by 0
    end
  end
end