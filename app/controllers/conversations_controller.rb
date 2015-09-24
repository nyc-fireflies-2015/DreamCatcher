class ConversationsController < ApplicationController
  before_action :authenticate_dreamer
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash, :shortpoll]
  before_action :get_box, only: [:index]

  def index
    if @box.eql? "inbox"
      @conversations = @mailbox.inbox
    elsif @box.eql? "sent"
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end

    @conversations = @conversations.paginate(page: params[:page], per_page: 10)
  end

  def reply
    current_dreamer.reply_to_conversation(@conversation, params[:body])
    receipt = @conversation.receipts_for(current_dreamer).last
    render partial: "message", locals: {message: receipt.message }
  end

  def destroy
    @conversation.move_to_trash(current_dreamer)
    render nothing: true, status: 200
  end

  def restore
    @conversation.untrash(current_dreamer)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_dreamer).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
    redirect_to conversations_path
  end

  def mark_as_read
    @conversation.mark_as_read(current_dreamer)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end

   def shortpoll
    timestamp = Time.at(params[:timestamp].to_f/1000.0).to_datetime
    new_messages = Mailboxer::Message.where(conversation_id: params[:id]).where("created_at >= ?", timestamp)
    if new_messages.empty?
      render nothing: true, status: 306
    else
      render partial: "conversation_river", locals: {conversation: get_conversation}
    end
  end


  private

  def get_mailbox
    @mailbox ||= current_dreamer.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_box
    if params[:box].blank? or !["inbox","sent","trash"].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end
end