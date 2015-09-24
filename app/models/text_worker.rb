require 'twilio-ruby'
require 'sidekiq'
require 'sidekiq/web'

class TextWorker
  include Sidekiq::Worker

  def self.send_text_to_all
    subs = Dreamer.reality_testers
    subs.each do |dreamer|
      TextWorker.perform_async(dreamer.phone_num)
    end
  end

  def perform(number)
    number = number
    message = 'Reality Check on Heroku!'
    twilio_number = ENV["TWILIO_NUMBER"]
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.account.messages.create({to: "#{number}",
                                                  from: "#{twilio_number}",
                                                  body: "#{message}" })
  end
end
