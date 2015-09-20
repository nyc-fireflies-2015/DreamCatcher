class RecipesController < ApplicationController
  before_action :find_step, only: [:update, :add_step, :remove_step]
  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @step.update_attributes(step_params)
    unless @step.save
      flash[:error] = @step.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "save_step.js.erb"}
    end
  end

  def new_step
    @step = Step.new
    respond_to do |format|
      format.html { render partial: "new_step", locals: {step: @step} }
      format.js { render "new_step.js.erb" }
    end
  end

  def create_step
    @step = Step.new(step_params.merge(creator: current_dreamer))
    current_dreamer.recipe.steps << @step
    unless @step.save
      flash[:error] = @step.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "save_step.js.erb" }
    end
  end

  def add_step
    @recipe = current_dreamer.recipe
    @recipe.steps << @step
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "step.js.erb" }
    end
  end

  def remove_step
    if @step.creator == current_dreamer
      @step.destroy
    else
      current_dreamer.recipe.steps.delete(@step)
    end
  end

  private

  def step_params
    params.require(:step).permit(:description, :creator)
  end

  def find_step
     @step = Step.find(params[:id])
  end
end
