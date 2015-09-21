class FavoritesController < ApplicationController
  before_action :find_dream

  def create
    @favorite = Favorite.create(dream: @dream, fan: current_dreamer)
    binding.pry
    @dream.favorites_count += 1
    @dream.save
    respond_to do |format|
      format.js { render "favorites/favorite.js.erb" }
    end
  end

  def destroy
    @dream.favorite_by(current_dreamer).destroy
    respond_to do |format|
      format.js { render "favorites/un_favorite.js.erb" }
    end
  end

  private

  def find_dream
    @dream = Dream.find(params[:dream_id])
  end
end