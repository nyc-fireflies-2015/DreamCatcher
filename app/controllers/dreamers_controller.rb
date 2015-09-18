class DreamersController < ApplicationController
  before_action :find_dreamer, only: [:show, :edit, :update]

  def new
    @dreamer = Dreamer.new
  end

  def create
    dreamer = Dreamer.new(dreamer_params)
    if dreamer.save
      session[:dreamer_id] = dreamer.id
      redirect_to root_path, notice: "Account Has Created!!"
    else
      flash[:error] = dreamer.errors.full_messages
      redirect_to signup_path
    end
  end

  def update
    if @dreamer.update_attributes(dreamer_params)
      redirect_to profile_path(@dreamer)
    else
      flash[:error] = @dreamer.errors.full_messages
      redirect_to edit_dreamer_path(@dreamer)
    end
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :zipcode)
  end

  def find_dreamer
    @dreamer = Dreamer.find_by(id: params[:id])
  end
end
