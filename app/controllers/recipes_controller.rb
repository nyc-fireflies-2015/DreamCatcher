class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :create_step]
  def update
    @step = Step.find(params[:id])
    @step.update_attributes(step_params)
    unless @step.save
      flash[:error] = @step.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end

  def add_step
    @step = Step.new
    respond_to do |format|
      format.html { render partial: "new_step", locals: {step: @step} }
      format.js {render "new_step.js.erb" }
    end
  end

  def add_step
    current_dreamer.recipe.steps << Step.find(params[:id])
  end

  def create_step
    @step = @recipe.steps.build(step_params.merge(creator: current_dreamer))
    unless @step.save
      flash[:error] = @step.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to :back }
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end

  def cancel_step
    @step = Step.find(params[:id])
    if @step.creator == current_dreamer
      @step.destroy
    else
      current_dreamer.recipe.steps.delete(@step)
  end

  def create_step
    @step = @recipe.steps.build(step_params)
    unless @step.save
      flash[:error] = @step.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  private

  def step_params
    params.require(:step).permit(:description)
  end

  def find_recipe
     @recipe = Recipe.find(params[:id])
  end
end
