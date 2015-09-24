class HashtagsController < ApplicationController
  before_filter :find_hashtag

  def destroy
    dream = Dream.find(params[:dream_id])
    dream.hashtags.delete(@hashtag)
    @hashtag.destroy if @hashtag.dreams.empty?
    render nothing: true, response: 200
  end

  def index
    @count = 0
    @dreams = @hashtag.dreams.paginate(:page => params[:page], :per_page => 10)
  end

  private

  def find_hashtag
    @hashtag = Hashtag.find(params[:id])
  end
end