class StepsController < ApplicationController
before_action :find_step, except: [:recipe, :new, :create]
  def recipe
    @creator = Dreamer.find(params[:id])
    @steps = @creator.steps
    @new_step = Step.new
    @popular_steps = Step.top
    redirect_to welcome_path unless current_dreamer
    render "index"
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
    render @step
  end

  def edit
    redirect_to :back unless current_dreamer == @step.creator
    render partial: "edit", locals: {step: @step} 
  end

  def update
    if @step.update_attributes(step_params)
      render @step
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
    redirect_to :back unless request.xhr?
    render :nothing => true, :status => 200
  end

  private

  def step_params
    params.require(:step).permit(:description, :creator)
  end

  def find_step
     @step = Step.find(params[:id])
  end
end
