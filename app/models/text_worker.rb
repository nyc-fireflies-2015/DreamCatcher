require 'twilio-ruby'
require 'sidekiq'
require 'sidekiq/web'

class TextWorker
  include Sidekiq::Worker

  def self.send_text_to_all
    subs = Dreamer.reality_testers
    subs.each do |dreamer|
      self.perform(dreamer.phone_num)
    end
  end

  def self.perform(number)
    number = number
    message = 'Finale'
    twilio_number = ENV["TWILIO_NUMBER"]
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    binding.pry
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.account.messages.create({to: "#{number}",
                                                  from: "+13157074332",
                                                  body: "#{message}" })
  end
end