class WelcomeController < ApplicationController
  def index
    @intro = Faker::Lorem.paragraphs
  end

  def search
    @query = params[:q][:title_cont]
    @dreams = @q.result(distinct: true)
  end
end