require 'rails_helper'

feature "Add hashtags" do
  scenario "can add hashtags while created dream", js: true do
    dreamer = FactoryGirl.create(:dreamer)
    sign_in(dreamer)
    visit dreams_path
    expect {
      click_link "Add New Dream"
      fill_in "title", with: "test-title"
      fill_in "tell us about your dream", with: "test-description"
      fill_in "hashtags", with: "test1, test2, test3"
      click_button "Submit"
    }.to change(Hashtag, :count).by(3)
  end
  scenario "can add hashtags while created dream", js: true do
    dreamer = FactoryGirl.create(:dreamer)
    dream = FactoryGirl.create(:dream)
    dreamer.dreams << dream
    sign_in(dreamer)
    visit dream_path(dream)
    expect {
      click_link ".edit-icon"
      fill_in "hashtags", with: "test1, test2, test3"
      click_button "Submit"
    }.to change(Hashtag, :count).by(3)
  end
end