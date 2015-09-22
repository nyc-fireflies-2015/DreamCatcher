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
    # dreamer = Dreamer.find(dreamer_id)
    number = number
    message = 'This is a test'
    account_sid = 'AC40f31b05ec16c2c813436c84ada30a6f'
    auth_token = '6866e1d92472d67960fe7173589eac33'
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    @message = @client.account.messages.create({to: "+1"+"#{number}",
                                                  from: "+13157074332",
                                                  body: "#{message}" })
  end
end