class WelcomeController < ApplicationController
  def index
    @intro = Faker::Lorem.paragraphs
  end

  def search
    @q = Dream.ransack(params[:q])
    @query = params[:q]
    @dreams = @q.result(distinct: true)
  end
end