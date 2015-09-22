require 'twilio-ruby'
require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-cron'
class TextWorker
  include Sidekiq::Worker

  def perform(number)

    number = number
    message = 'Reality Check!'
    account_sid = 'AC40f31b05ec16c2c813436c84ada30a6f'
    auth_token = '6866e1d92472d67960fe7173589eac33'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.account.messages.create({to: "+1"+"#{number}",
                                                  from: "+13157074332",
                                                  body: "#{message}" })
  end

  # Sidekiq::Cron::Job.create(name: 'Reality Check', cron: '*/1 * * * *', klass: 'TextWorker')

end