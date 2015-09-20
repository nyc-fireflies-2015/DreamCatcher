class FavoritesController < ApplicationController
  before_action :find_dream

  def create

    @favorite = Favorite.new(dream: @dream, fan: current_dreamer)

  end

  def destroy
    dream = Dream.find_by(params[:id])
    dream.favorite_by(current_dreamer).destroy
    respond_to do |format|
      render "un_favorite.js.erb"
    end
  end

  private

  def find_dream
    @dream = Dream.find(params[:dream_id])
  end
end