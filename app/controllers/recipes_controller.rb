class RecipesController < ApplicationController
  def show
    @dreamer = Dreamer.find(params[:id])
  end
end
