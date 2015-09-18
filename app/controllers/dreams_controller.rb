class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end

  def create
    @dream = current_user.dreams.build(dream_params)

    if @dream.save
      redirect_to dream_path(@dream)
    else
      flash[:error] = "Something went wrong. Perhaps you left a field empty?"
      render new
    end
  end

  def new
    @dream = current_user.dreams.build()
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def update
    dream = Dream.find(params[:id])
    if dream.update_attributes(dream_params)
      redirect_to dream_path(dream)
    else
      flash[:error] = "Something went wrong. Perhaps you left a field empty"
      render "edit"
    end
  end

  def destroy
    dream = Dream.find(params[:id])
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
end
