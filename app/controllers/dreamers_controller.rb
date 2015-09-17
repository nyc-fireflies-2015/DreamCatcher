class DreamersController < ActionController::Base
  def show
    @dreamer = Dreamer.find(params[:id])
  end

  def new
    @dreamer = Dreamer.new
  end
end