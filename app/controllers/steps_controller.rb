class StepsController < ApplicationController
before_action :find_step, except: [:recipe, :new, :create]
  def recipe
    @creator = Dreamer.find(params[:id])
    @steps = @creator.steps.order('created_at DESC')
    @step = Step.new
    @popular_steps = Step.top
    redirect_to welcome_path unless current_dreamer
    if @creator == current_dreamer
      render "index"
    end
  end

  def new
    @step = Step.new
    render nothing: true, status: 200
  end

  def create
    @step = Step.new(step_params.merge(creator: current_dreamer))
    current_dreamer.steps << @step
    if @step.save
      current_dreamer.points += 2
      check_rank
      render partial: "step", locals: {step: @step}
    else
      error(@step.errors.messages)
    end
  end

  def clone
    unless current_dreamer.steps.include?(@step)
      current_dreamer.steps << @step
      render partial: "step", locals: {step: @step}
    else
      render nothing: true, status: 306
    end
  end

  def destroy
    if @step.creator == current_dreamer
      current_dreamer.points -= 2
      check_rank
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
