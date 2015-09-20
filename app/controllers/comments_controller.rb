class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params.merge(dreamer_id: current_dreamer)
    if comment.save
      redirect_to dream_path
    else
      flash[:error] = comment.errors.full_messages
      redirect_to new_comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :dreamer_id, :dream_id)
  end

end