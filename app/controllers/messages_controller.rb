class MessagesController < ApplicationController
  before_action :authenticate_dreamer

  def new
    @chosen_recipient = Dreamer.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    current_dreamer.points += 2
    check_rank
    recipients = Dreamer.where(id: params['recipients'])
    conversation = current_dreamer.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end