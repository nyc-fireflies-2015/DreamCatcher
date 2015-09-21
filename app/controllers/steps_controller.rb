class StepsController < ApplicationController
before_action :find_step, except: [:index, :new, :create]
  def recipe
    @creator = Dreamer.find(params[:id])
    @steps = @creator.steps
    @new_step = Step.new
    @popular_steps = Step.top
    redirect_to welcome_path unless current_dreamer
  end

  def new
    @step = Step.new
    respond_to do |format|
      format.html { render partial: "new", locals: {step: @step} }
      format.js { render "new.js.erb" }
    end
  end

  def create
    @step = Step.new(step_params.merge(creator: current_dreamer))
    current_dreamer.steps << @step
    unless @step.save
      flash[:error] = @step.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "create.js.erb" }
    end
  end

  def edit
    redirect_to :back unless current_dreamer == @step.creator
    respond_to do |format|
      format.html { render partial: "edit", locals: {step: @step} }
      format.js { render "edit.js.erb" }
    end
  end

  def update
    if @step.update_attributes(step_params)
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render "update.js.erb"}
      end
    else
      flash[:error] = @step.errors.full_messages
      respond_to do |format|
        format.html { redirect_to recipe_path(current_dreamer.recipe) }
        format.js { render :file => "layouts/errors.js.erb"}
      end
    end
  end

  def add_step
    current_dreamer.steps << @step
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "step.js.erb" }
    end
  end

  def remove_step
    if @step.creator == current_dreamer
      @step.destroy
    else
      current_dreamer.steps.delete(@step)
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "remove_step.js.erb" }
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
