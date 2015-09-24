class DreamsController < ApplicationController
  before_filter :authenticate_dreamer, except: [:index]
  before_filter :find_dream, except: [:index, :create, :new, :shortpoll]

  def index
    @count = 0
    @dreams = Dream.order('created_at DESC').limit(20)
    @dream = Dream.new
    @popular_hashtags = Hashtag.popular
    redirect_to welcome_path unless current_dreamer
  end

  def show
    @q = Hashtag.ransack(params[:q])
    @comment = Comment.new
  end

  def create
    dream = current_dreamer.dreams.new(dream_params)
    if dream.save
      current_dreamer.points += 5
      check_rank
      if dream_params[:hashtag_string]
        dream.hashtags << Hashtag.parse(dream_params[:hashtag_string])
      end
      @count = 0
      @dreams = Dream.order('created_at DESC').limit(20)
      render @dreams
    else
      error(dream.errors.full_messages)
    end
  end

  def update
    if @dream.update_attributes(dream_params)
      if dream_params[:hashtag_string]
        @dream.hashtags << Hashtag.parse(dream_params[:hashtag_string])
      end
      render partial: "update_dream", locals: {dream: @dream}
    else
      error(dream.errors.full_messages)
    end
  end

  def destroy
    if @dream.destroy
      current_dreamer.points -= 5
      check_rank
      redirect_to root_path
    else
      error(@dream.errors.full_messages)
    end
  end

  def remove_hashtag
    hashtag = Hashtag.find(params[:hashtag_id])
    @dream.hashtags.delete(hashtag)
    hashtag.destroy if hashtag.dreams.empty?
    render nothing: true, response: 200
  end

  def shortpoll
    new_dreams = Dream.where("created_at >= ?", Time.at(params[:timestamp].to_f/1000.0).to_datetime)
    if new_dreams.empty?
      render nothing: true, status: 306
    else
      @count = 0
      @dreams = Dream.order('created_at DESC').limit(20)
      render @dreams
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :story, :decision_clarity,
                      :consciousness_clarity, :dream_state_clarity,
                      :hashtag_string)
  end

  def find_dream
    @dream = Dream.find(params[:id])
  end
end
