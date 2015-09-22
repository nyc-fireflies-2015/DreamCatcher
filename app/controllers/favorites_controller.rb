class FavoritesController < ApplicationController
  before_action :find_dream

  def create
    Favorite.create(dream: @dream, fan: current_dreamer)
    @dream.save
    current_dreamer.points += 1
    check_rank
    render :nothing => true, :status => 200
  end

  def destroy
    @dream.favorite_by(current_dreamer).destroy_all
    @dream.save
    current_dreamer.points -= 1
    check_rank
    render :nothing => true, :status => 200
  end

  private

  def find_dream
    @dream = Dream.find(params[:dream_id])
  end
end