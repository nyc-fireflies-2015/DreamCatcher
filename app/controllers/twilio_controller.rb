require 'sidekiq/web'
require 'rake'
# DreamCatcher::Application.load_tasks
class TwilioController < ApplicationController

  include Sidekiq::Worker

  def send_sms
    current_dreamer.reality_check = true
    current_dreamer.save
    binding.pry
    redirect_to profile_path(current_dreamer)
  end

end