module ApplicationHelper
  def current_user
    Dreamer.find_by(id: session[:user_id])
  end
end
