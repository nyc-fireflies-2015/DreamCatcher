require 'sidekiq/web'
require 'rake'
class TwilioController < ApplicationController

  include Sidekiq::Worker

  def reality_check
    @dreamer = current_dreamer
    @dreamer.update_attributes(dream_params.merge(reality_check:  true))
    if @dreamer.save
      redirect_to profile_path(current_dreamer)
    else
      redirect reality_check_path(@dreamer)
    end
  end

  private

  def dream_params
    params.require(:dreamer).permit(:password, :reality_check, :phone_num)
  end

end