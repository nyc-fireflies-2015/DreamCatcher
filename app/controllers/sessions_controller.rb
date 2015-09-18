class SessionsController < ApplicationController

  def new
  end

  def create
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
      redirect_to login_path
    end
  end

end
