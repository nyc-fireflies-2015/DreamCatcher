class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    user = Dreamer.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = ['Unsuccessful Login!']
      render 'new'
    end

    def destroy
      session.clear
    end
  end

end
