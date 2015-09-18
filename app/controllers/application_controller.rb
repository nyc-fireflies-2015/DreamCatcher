class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :verify_logged_in

  def verify_logged_in
    session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
