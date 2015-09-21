class ApplicationController < ActionController::Base
  include Ransack::Helpers::FormHelper
  helper_method :current_dreamer
  helper_method :calculate_lucidity
  protect_from_forgery with: :exception
  before_filter :set_query
  before_action :clear_errors
  layout proc { false if request.xhr? }

  def authenticate_dreamer
    redirect_to root_path unless current_dreamer
  end

  def clear_errors
    flash.clear
  end

  def current_dreamer
    @current_dreamer ||= Dreamer.find_by(id: session[:dreamer_id])
  end

  def set_query
    @q = Dream.ransack(params[:q])
  end

  def calculate_lucidity(dream)
    lucidity_rating = 0
    lucidity_rating += 1 if dream.consciousness_clarity?
    lucidity_rating += 1 if dream.dream_state_clarity?
    lucidity_rating += 1 if dream.decision_clarity?
    return lucidity_rating
  end

end
