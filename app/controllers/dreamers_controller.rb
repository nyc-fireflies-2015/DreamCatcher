class DreamersController < ActionController::Base
  def show
    @dreamer = Dreamer.find(params[:id])
  end

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
      redirect_to new_dreamer_path
    end
  end

  def edit
    @dreamer = Dreamer.find(params[:id])
  end

  def update
    dreamer = Dreamer.find(session[:dreamer_id])
    if dreamer.update_attributes(dreamer_params)
      redirect_to dreamer_path(dreamer)
    elsif dreamer
      flash[:error] = dreamer.errors.full_messages
      redirect_to edit_dreamer_path(dreamer)
    else
      redirect_to root_path
    end
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :zipcode)
  end
end