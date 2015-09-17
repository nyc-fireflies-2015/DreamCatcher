class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dreams_path
    else
      flash[:login_errors] = user.errors.full_messages
      render 'new'
    end

    def destroy
      session.clear
    end
  end

end
