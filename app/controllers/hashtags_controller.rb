class HashtagsController < ApplicationController
  def destroy
    hashtag = Hashtag.find(params[:id])
    dream = Dream.find(params[:dream_id])
    dream.hashtags.delete(hashtag)
    hashtag.destroy if hashtag.dreams.empty?
    redirect_to dream_path(dream)
  end

  def search
    @query = params[:q][:name_eq]
    @hashtags = Hashtag.ransack(params[:q][:name_eq]).result
  end
end