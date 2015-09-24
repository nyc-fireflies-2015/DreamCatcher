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
    dreamer = Dreamer.new(dreamer_params.merge(steps: Step.default))
    if dreamer.save
      session[:dreamer_id] = dreamer.id
      admin = Dreamer.find_by(username: "DreamCatcher")
      admin.send_message(dreamer, body, "Are you dreaming right now?")
      redirect_to root_path, notice: "Account has been created!!"
    else
      flash[:error] = dreamer.errors.full_messages
      redirect_to signup_path
    end
  end

  def update
    if @dreamer.update_attributes(dreamer_params)
      @dreams_count = @dreamer.dreams.count
      @comments_count = @dreamer.comments.count
      render partial: "stats", locals: {dreamer: @dreamer}
    else
      error(@dreamer.errors.full_messages)
    end
  end

  private

  def dreamer_params

    params.require(:dreamer).permit(:username, :email, :password, :avatar_url, :about, :recipe, :city, :state, :gender, :phone_num)

  end

  def find_dreamer
    @dreamer = Dreamer.find(params[:id])
  end

  def body
    "Welcome to DreamCatcher! Create and experiment with other dreamer's 'Dream Recipes' to increase your chances of having lucid dreams. Post your dreams - lucid or not - and explore what other's are dreaming about. Get out and start dreaming!"
  end
end
