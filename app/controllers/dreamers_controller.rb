class DreamersController < ApplicationController
  before_action :find_dreamer, only: [:show, :edit, :update]
  before_filter :authenticate_dreamer, except: [:new, :create]

  def new
    @dreamer = Dreamer.new
  end

  def show
    @dreams_count = @dreamer.dreams.count
    @comments_count = @dreamer.comments.count
  end

  def create
    dreamer = Dreamer.new(dreamer_params.merge(avatar_url: "avatar.png", steps: Step.default))
    if dreamer.save
      session[:dreamer_id] = dreamer.id
      redirect_to root_path, notice: "Account has been created!!"
    else
      flash[:error] = dreamer.errors.full_messages
      redirect_to signup_path
    end
  end

  def update
    @dreamer.update_attributes!(dreamer_params)
    render partial: "stats", locals: {dreamer: @dreamer}
    rescue ActiveRecord::RecordInvalid => e
    error(e)
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :avatar_url, :about, :recipe, :city, :state, :gender)
  end

  def find_dreamer
    @dreamer = Dreamer.find(params[:id])
  end
end
