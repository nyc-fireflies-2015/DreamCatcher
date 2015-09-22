class StepsController < ApplicationController
before_action :find_step, except: [:recipe, :new, :create]
  def recipe
    @creator = Dreamer.find(params[:id])
    @steps = @creator.steps
    @step = Step.new
    @popular_steps = Step.top
    redirect_to welcome_path unless current_dreamer
    render "index"
  end

  def new
    @step = Step.new
    render :nothing => true, :status => 200
  end

  def create
      @step = Step.new(step_params.merge(creator: current_dreamer))
      current_dreamer.steps << @step
    if @step.save
      render @step
    else
      error(@step.errors.messages)
    end
  end

  def edit
    redirect_to :back unless current_dreamer == @step.creator
    render partial: "edit", locals: {step: @step}
  end

  def update
    if @step.update_attributes(step_params)
      render @step
    else
      error(@step.errors.full_messages)
    end
  end

  def add_step
    current_dreamer.steps << @step
    render :nothing => true, :status => 200
  end

  def remove_step
    if @step.creator == current_dreamer
      @step.destroy
    else
      current_dreamer.steps.delete(@step)
    end
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
