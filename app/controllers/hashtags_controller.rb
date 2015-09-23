class HashtagsController < ApplicationController
  before_filter :find_hashtag

  def destroy
    dream = Dream.find(params[:dream_id])
    dream.hashtags.delete(@hashtag)
    @hashtag.destroy if @hashtag.dreams.empty?
    redirect_to dream_path(dream)
  end

  def index
    render @hashtag.dreams
  end

  private

  def find_hashtag
    @hashtag = Hashtag.find(params[:id])
  end
end