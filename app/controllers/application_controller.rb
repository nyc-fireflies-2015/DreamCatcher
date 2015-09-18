class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    redirect_to root_path if !session[:dreamer_id]
  end

  def current_user
    @current_user ||= Dreamer.find_by(id: session[:user_id])
  end

end
