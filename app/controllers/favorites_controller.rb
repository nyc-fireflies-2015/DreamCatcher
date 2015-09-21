class FavoritesController < ApplicationController
  before_action :find_dream

  def create
    Favorite.create(dream: @dream, fan: current_dreamer)
    @dream.save
    respond_to do |format|
      format.js { render "favorite.js.erb" }
    end
  end

  def destroy
    @dream.favorite_by(current_dreamer).destroy_all
    @dream.save
    respond_to do |format|
      format.js { render "un_favorite.js.erb" }
    end
  end

  private

  def find_dream
    @dream = Dream.find(params[:dream_id])
  end
end