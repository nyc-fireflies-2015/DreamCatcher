class DreamersController < ApplicationController
  before_action :find_dreamer, only: [:show, :edit, :update]

  def new
    @dreamer = Dreamer.new
  end

  def show
    @awareness_dreams = find_awareness_dreams(@dreamer)
    @free_decision_dreams = find_decision_making_dreams(@dreamer)
    @vivid_dreams = find_vivid_dreams(@dreamer)
    @num_of_dreams = @dreamer.dreams.count
  end

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
      respond_to do |format|
        format.html { redirect_to edit_dreamer_path(@dreamer) }
        format.js { render :file => "layouts/errors.js.erb" }
      end
    end
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :zipcode, :avatar_url, :about, :recipe)
  end

  def find_dreamer
    @dreamer = Dreamer.find_by(id: params[:id])
  end

  def find_vivid_dreams(dreamer)
    dreamer.dreams.all.where('"consciousness_clarity?" = true')
  end

  def find_awareness_dreams(dreamer)
    dreamer.dreams.all.where('"dream_state_clarity?" = true')
  end

  def find_decision_making_dreams(dreamer)
    dreamer.dreams.all.where('"decision_clarity?" = true')
  end

