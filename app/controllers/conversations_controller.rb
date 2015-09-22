class ConversationsController < ApplicationController
  before_action :authenticate_dreamer
  before_action :get_mailbox

  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end