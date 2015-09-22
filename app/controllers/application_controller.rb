class ApplicationController < ActionController::Base
  include Ransack::Helpers::FormHelper
  protect_from_forgery with: :exception
  helper_method :current_dreamer
  helper_method :calculate_lucidity
  helper_method :error
  layout proc { false if request.xhr? }

  before_filter :set_query

  def authenticate_dreamer
    redirect_to root_path unless current_dreamer
  end

  def current_dreamer
    @current_dreamer ||= Dreamer.find_by(id: session[:dreamer_id])
  end

  def set_query
    @query = params[:q]
    @dreams = Dream.ransack(title_or_story_cont: @query).result
    @dreamers = Dreamer.search(username_cont: @query).result
    @steps = Step.search(description_cont: @query).result
  end

  def error(full_messages)
    respond_to do |format|
      format.js { render :text => full_messages.join("\n"), :status => 400 }
    end
  end

end
