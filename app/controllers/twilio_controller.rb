require 'sidekiq/web'
class TwilioController < ApplicationController

  include Sidekiq::Worker
  def send_sms
    message = params[:message]
    # time = params[:time].to_i
    number = params[:number]
    TextWorker.perform_at(5.seconds, message, number)

    redirect_to profile_path(current_dreamer)
  end

end