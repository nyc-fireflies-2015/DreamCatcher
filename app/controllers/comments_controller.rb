class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params.merge(dreamer: current_dreamer))
    if comment.save
      redirect_to dream_path(comment_params[:dream_id])
    else
      flash[:error] = comment.errors.full_messages
      redirect_to dream_path(comment_params[:dream_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :dreamer, :dream_id)
  end

end