class DreamsController < ApplicationController
  before_filter :authenticate_dreamer, except: [:index]
  before_filter :find_dream, except: [:index, :create, :new]

  def index
    @dreams = Dream.all
  end

  def new
    @dream = current_dreamer.dreams.build()
  end

  def create
    @dream = current_dreamer.dreams.build(dream_params)
    check_decision(@dream) && check_consciousness(@dream) && check_state(@dream)
    if @dream.save
      redirect_to dream_path(@dream)
    else
      flash[:error] = "Something went wrong. Perhaps you left a field empty?"
      render new
    end
  end

  def update
    if @dream.update_attributes(dream_params)
      redirect_to dream_path(@dream)
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