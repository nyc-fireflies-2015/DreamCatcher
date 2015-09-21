class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    dream = Dream.find(comment_params[:dream_id])
    comment = Comment.new(comment_params.merge(dreamer: current_dreamer, dream: dream))
    if comment.save
      redirect_to dream_path(dream)
    else
      flash[:error] = comment.errors.full_messages
      redirect_to dream_path(dream)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :dreamer, :dream_id)
  end

end