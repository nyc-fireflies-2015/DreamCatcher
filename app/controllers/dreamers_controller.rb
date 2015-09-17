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
    else
      flash[:error] = dreamer.errors.full_messages
      redirect_to new_dreamer_path
    end
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:username, :email, :password, :zipcode)
  end
end