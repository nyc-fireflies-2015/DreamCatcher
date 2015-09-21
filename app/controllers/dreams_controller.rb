class DreamsController < ApplicationController
  before_filter :authenticate_dreamer, except: [:index]
  before_filter :find_dream, except: [:index, :create, :new]

  def index
    @dreams = Dream.order('created_at DESC')
    @new_dream = Dream.new
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
        format.html { redirect_to new_dream_path }
        format.js { render :file => "layouts/errors.js.erb" }
      end
    end
  end

  def update
    if @dream.update_attributes(dream_params)
      render partial: "info", locals: {dream: @dream}
    else
      flash[:error] = @dream.errors.full_messages
      respond_to do |format|
        format.html { render partial: "edit", locals: { dream: @dream } }
        format.js { render :file => "layouts/errors.js.erb" }
      end
    end
  end

  def destroy
    unless @dream.destroy
      flash[:error] = @dream.errors.full_messages
    end
    render nothing: true
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :story, :decision_clarity, :consciousness_clarity, :dream_state_clarity)
  end

  def find_dream
    @dream = Dream.find(params[:id])
  end

end
