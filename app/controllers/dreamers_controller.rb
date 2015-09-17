class DreamersController < ActionController::Base
  def show
    @dreamer = Dreamer.find(params[:id])
  end
end