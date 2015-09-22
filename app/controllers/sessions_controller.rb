class SessionsController < ApplicationController

  def create
    dreamer = Dreamer.find_by(username: params[:session][:username])
    if dreamer && dreamer.authenticate(params[:session][:password])
      session[:dreamer_id] = dreamer.id
      redirect_to root_path
    else
      flash[:error] = ['Unsuccessful Login!']
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
