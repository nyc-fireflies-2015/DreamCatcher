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
    @dream = current_dreamer.dreams.new(dream_params)
    if @dream.save
      render @dream
    else
      flash[:error] = @dream.errors.full_messages
      respond_to do |format|
        format.js { render file: "shared/errors.js.erb" }
      end
    end
  end

  def update
    @dream.update_attributes!(dream_params)
    rescue ActiveRecord::RecordInvalid => e
    respond_to do |format|
      format.js { render :text => e.message, :status => 400 }
    end
  end

  def destroy
    unless @dream.destroy
      flash[:error] = @dream.errors.full_messages
      respond_to do |format|
        format.js { render file: "shared/errors.js.erb" }
      end
    end
    redirect_to root_path
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :story, :decision_clarity, :consciousness_clarity, :dream_state_clarity)
  end

  def find_dream
    @dream = Dream.find(params[:id])
  end

  def error(error_messages)
    flash[:error] = error_messages
    respond_to do |format|
      format.js { render file: "shared/errors.js.erb" }
    end
  end

end
