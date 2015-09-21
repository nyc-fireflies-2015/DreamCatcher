class DreamsController < ApplicationController
  before_filter :authenticate_dreamer, except: [:index]
  before_filter :find_dream, except: [:index, :create, :new]

  def index
    @dreams = Dream.order('created_at DESC')
    @new_dream = Dream.new
    redirect_to welcome_path unless current_dreamer
  end

  def show
    @comment = Comment.new
  end

  def new
    @dream = Dream.new
    respond_to do |format|
      format.html { render partial: "new", locals: { dream: @dream } }
      format.js { render "new.js.erb" }
    end
  end

  def create
    @dream = current_dreamer.dreams.new(dream_params)
    if @dream.save
      respond_to do |format|
        format.html { redirect_to dreams_path }
        format.js { render "summary.js.erb" }
      end
    else
      flash[:error] = @dream.errors.full_messages
      respond_to do |format|
        format.html { redirect_to new_dream_path }
        format.js { render :file => "layouts/errors.js.erb" }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { render "edit" }
      format.js { render "edit.js.erb" }
    end
  end

  def update
    if @dream.update_attributes(dream_params)
      respond_to do |format|
        format.html { redirect_to dream_path(@dream) }
        format.js { render "info.js.erb" }
      end
    else
      flash[:error] = @dream.errors.full_messages
      respond_to do |format|
        format.html { render "edit" }
        format.js { render :file => "layouts/errors.js.erb" }
      end
    end
  end

  def destroy
    if @dream.destroy
      respond_to do |format|
        format.html { redirect_to dreams_path }
        format.js { render "destroy.js.erb" }
      end
    else
      flash[:error] = @dream.errors.full_messages
      redirect_to dream_path(dream)
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :story, :decision_clarity, :consciousness_clarity, :dream_state_clarity)
  end

  def find_dream
    @dream = Dream.find(params[:id])
  end

end
