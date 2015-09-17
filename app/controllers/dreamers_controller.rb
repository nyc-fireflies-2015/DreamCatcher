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
      # log_in(dreamer)
      redirect_to dreamer_path(dreamer), notice: "Account Has Created!!"
      #change above route to root_path
    else
      flash[:error] = dreamer.errors.full_messages
      redirect_to new_dreamer_path
    end
  end

  def edit
    @dreamer = Dreamer.find(params[:id])
  end

  def update
    dreamer = current_user
    if dreamer.update_attributes(dreamer_params)
      redirect_to dreamer_path(dreamer)
    else
      flash[:error] = dreamer.errors.full_messages
      redirect_to edit_user_path(dreamer)
    end
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :zipcode)
  end
end