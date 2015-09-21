class WelcomeController < ApplicationController
  def index
    @intro = Faker::Lorem.paragraphs
  end

  def search
  end
end