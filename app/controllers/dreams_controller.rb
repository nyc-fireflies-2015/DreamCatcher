class DreamsController < ApplicationController
  before_filter :authenticate_dreamer, except: [:index]
  before_filter :find_dream, except: [:index, :create, :new]

  def index
    @dreams = Dream.all
    @new_dream = Dream.new
    redirect_to welcome_path unless current_dreamer
  end

  def show
    @dream = Dream.find_by(id: params[:id])
  end

  def new
    @dream = current_dreamer.dreams.build()
    respond_to do |format|
      format.html { render "new" }
      format.js { render "new.js.erb" }
    end
  end

  def create
    @dream = current_dreamer.dreams.build(dream_params)
    check_decision(@dream) && check_consciousness(@dream) && check_state(@dream)
    if @dream.save
      respond_to do |format|
        format.html { redirect_to dreams_path }
        format.js { render "summary.js.erb" }
      end
    else
      flash[:error] = "Something went wrong. Perhaps you left a field empty?"
      redirect_to new_dream_path
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
      flash[:error] = "Something went wrong. Perhaps you left a field empty"
      render "edit"
    end
  end

  def destroy
    if @dream.destroy
      redirect_to dreams_path
    else
      flash[:error] = "Something went wrong."
      redirect_to dream_path(dream)
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :story, :decision_clarity?, :consciousness_clarity?, :dream_state_clarity?)
  end

  def find_dream
    @dream = Dream.find_by(id: params[:id])
  end

  def check_decision(dream)
    if params[:dream][:decision_clarity] == '1'
      dream[:decision_clarity?] = true
    end
  end

  def check_consciousness(dream)
    if params[:dream][:consciousness_clarity] == '1'
      dream[:consciousness_clarity?] = true
    end
  end

  def check_state(dream)
    if params[:dream][:dream_state_clarity] == '1'
      dream[:dream_state_clarity?] = true
    end
  end
end
