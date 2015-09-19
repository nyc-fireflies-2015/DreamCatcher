class RecipesController < ApplicationController
  def show
    @dreamer = Dreamer.find(params[:id])
    @recipe = @dreamer.recipe
  end

  def edit
    @dreamer = Dreamer.find(params[:id])
  end

  def update
    @dreamer = Dreamer.find(params[:id])
    @dreamer.update_attributes(recipe_params)
    if @dreamer.save
      redirect_to recipe_path(@dreamer)
    else
      flash[:error] = "Something went wrong."
      redirect_to edit_recipe_path(@dreamer)
    end
  end

  private

  def recipe_params
    params.require(:dreamer).permit(:recipe, :password)
  end
end
