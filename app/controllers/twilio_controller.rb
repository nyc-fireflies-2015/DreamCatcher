class TwilioController < ApplicationController

  include Webhookify

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def index

  end

  def send_sms
    message = params[:message]
    number = params[:number]
    account_sid = 'AC40f31b05ec16c2c813436c84ada30a6f'
    auth_token = '6866e1d92472d67960fe7173589eac33'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create({to: "+1"+"#{number}",
                                                from: "+13157074332",
                                                body: "#{message}" })
    redirect_to '/'
  end

  def call
    number = params[:number]
    account_sid = 'AC40f31b05ec16c2c813436c84ada30a6f'
    auth_token = '6866e1d92472d67960fe7173589eac33'

    @client = Twilio::REST::Client.new account_sid, auth_token

    # binding.pry

    @call = @client.account.calls.create({to: "+1"+"#{number}",
                                                from: "+13157074332",
                                                url: "#{root_url}connect" })
    redirect_to '/'
  end

  def connect
    # Our response to this request will be an XML document in the "TwiML"
    # format. Our Ruby library provides a helper for generating one
    # of these documents
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Helloooooo', :voice => 'alice'
    end
    set_header
    render_twiml response
  end

  private
  def authenticate_twilio_request
    twilio_signature = request.headers['HTTP_X_TWILIO_SIGNATURE']

    # Helper from twilio-ruby to validate requests.
    @validator = Twilio::Util::RequestValidator.new(@@twilio_token)

    # the POST variables attached to the request (eg "From", "To")
    # Twilio requests only accept lowercase letters. So scrub here:
    post_vars = params.reject {|k, v| k.downcase == k}

    is_twilio_req = @validator.validate(request.url, post_vars, twilio_signature)

    unless is_twilio_req
      render :xml => (Twilio::TwiML::Response.new {|r| r.Hangup}).text, :status => :unauthorized
      false
    end
  end


end