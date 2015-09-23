class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    dream = Dream.find(comment_params[:dream_id])
    @comment = dream.comments.new(comment_params.merge(dreamer: current_dreamer))
    if @comment.save
      current_dreamer.points += 2
      check_rank
      render @comment
    else
      render nothing: true, status: 400
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    render nothing: true, status: 200
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :dreamer, :dream_id)
  end

end
