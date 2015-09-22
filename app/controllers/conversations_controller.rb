class ConversationsController < ApplicationController
  before_action :authenticate_dreamer
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox
  end

  private

  def get_mailbox
    @mailbox ||= current_dreamer.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end