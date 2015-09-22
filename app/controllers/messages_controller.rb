class MessagesController < ApplicationController
  before_action :authenticate_dreamer

  def new
  end

  def create
    recipients = Dreamer.where(id: params['recipients'])
    conversation = current_dreamer.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end