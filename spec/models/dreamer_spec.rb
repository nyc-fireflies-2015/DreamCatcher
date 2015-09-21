require 'rails_helper'

describe Dreamer do
  context "associations" do
    it "should have many dreams" do
      should have_many :dreams
    end
    it "should have many favorites through foreign key fan_id" do
      should have_many(:favorites).with_foreign_key(:fan_id)
    end
    it "should have many steps through recipes" do
      should have_many(:steps).through(:recipes)
    end
  end
  context "validations" do
    it "validates format of email" do
      should validate_email_format_of(:email).with_message("Please enter valid email")
    end
    it "validates presence of username" do
      should validate_presence_of :username
    end
    it "validates presence of email" do
      should validate_presence_of :email
    end
  end
end
