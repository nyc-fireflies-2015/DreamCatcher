class HashtagsController < ApplicationController
  def destroy
    hashtag = Hashtag.find(params[:hashtag_id])
    @dream.hashtags.delete(hashtag)
    hashtag.destroy if hashtag.dreams.empty?
    render nothing: true, response: 200
  end

  def search
    @query = params[:q][:name_eq]
    @hashtags = Hashtag.ransack(params[:q][:name_eq]).result
  end
end