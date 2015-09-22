class DreamsController < ApplicationController
  before_filter :authenticate_dreamer, except: [:index]
  before_filter :find_dream, except: [:index, :create, :new]

  def index
    @dreams = Dream.order('created_at DESC').limit(20)
    @dream = Dream.new
    @popular_dreams = Dream.popular
    redirect_to welcome_path unless current_dreamer
  end

  def show
    @comment = Comment.new
  end

  def create
    @dream = current_dreamer.dreams.create!(dream_params)
    render @dream
    rescue ActiveRecord::RecordInvalid => e
    error(e)
  end

  def update
    @dream.update_attributes!(dream_params)
    render nothing: true
    rescue ActiveRecord::RecordInvalid => e
    error(e)
  end

  def destroy
    @dream.destroy!
    redirect_to root_path
    rescue ActiveRecord::RecordInvalid => e
    error(e)
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :story, :decision_clarity, :consciousness_clarity, :dream_state_clarity)
  end

  def find_dream
    @dream = Dream.find(params[:id])
  end

end
