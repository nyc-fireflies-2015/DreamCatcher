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
      error(comment.errors.full_messages)
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(content: params[:comment][:content])
      redirect_to dream_path(@comment.dream)
    else
      flash[:error] = comment.errors.full_messages
      redirect_to dream_path(@comment.dream)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :dreamer, :dream_id)
  end

end
