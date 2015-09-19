class StepsController < ApplicationController
  def show
  end

  def update
  end

  def destroy
    @step = Step.find(params[:id])
    @recipe = @step.recipe
    if @step.destroy
      redirect_to recipe_path(@recipe.creator_id)
    else
      flash[:error] = error.full_messages
      redirect_to recipe_path(@recipe)
    end
  end
end
