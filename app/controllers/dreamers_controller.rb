class DreamersController < ApplicationController
  before_action :find_dreamer, only: [:show, :edit, :update]

  def new
    @dreamer = Dreamer.new
  end

  def edit
    respond_to do |format|
      format.html { render "edit" }
      format.js { render "edit.js.erb" }
    end
  end

  def create
    dreamer = Dreamer.new(dreamer_params.merge(avatar_url: "avatar.png").merge(
      recipe: Recipe.default))
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
      respond_to do |format|
        format.html { redirect_to profile_path(@dreamer) }
        format.js { render "save_profile.js.erb" }
      end
    else
      flash[:error] = @dreamer.errors.full_messages
      redirect_to edit_dreamer_path(@dreamer)
    end
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :zipcode, :avatar_url, :about, :recipe)
  end

  def find_dreamer
    @dreamer = Dreamer.find_by(id: params[:id])
  end
end
