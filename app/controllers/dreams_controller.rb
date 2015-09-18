class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end

  def new
    @dream = current_user.dreams.build()
  end

  def create
    @dream = current_user.dreams.build(dream_params)
    # binding.pry
    check_decision(@dream) && check_consciousness(@dream) && check_state(@dream)
    if @dream.save
      redirect_to dream_path(@dream)
    else
      flash[:error] = "Something went wrong. Perhaps you left a field empty?"
      render new
    end
  end

  def edit
    @dream = Dream.find_by(id: params[:id])
  end

  def show
    @dream = Dream.find_by(id: params[:id])
  end

  def update
    dream = Dream.find_by(id: params[:id])
    if dream.update_attributes(dream_params)
      redirect_to dream_path(dream)
    else
      flash[:error] = "Something went wrong. Perhaps you left a field empty"
      render "edit"
    end
  end

  def destroy
    dream = Dream.find_by(id: params[:id])
    if dream.destroy
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