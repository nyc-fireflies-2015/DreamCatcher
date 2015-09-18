class WelcomeController < ApplicationController
  def index
    @intro = Faker::Lorem.paragraphs
  end

end