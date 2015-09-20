class WelcomeController < ApplicationController
  def index
    @intro = Faker::Lorem.paragraphs
  end

  def search
    @query = params[:q][:title_cont]
    @q = Dream.search(params[:q])
    @dreams = @q.result(distinct: true)
  end
end