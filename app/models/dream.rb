class Dream < ActiveRecord::Base
  belongs_to :dreamer
  has_many :comments
  has_many :favorites

  validates_presence_of :story, :title

  scope :popular, -> {order('favorites_count DESC').limit(10)}

  def favorite_by(dreamer)
    Favorite.where(dream: self, fan: dreamer)
  end

  def favorite?(dreamer)
    !!Favorite.where(dream: self, fan: dreamer)
  end

  def timestamp
    seconds = (Time.now - self.created_at).to_i
    minutes = seconds/60
    hours = minutes/60
    days = hours/24

    if minutes == 0
      return "#{seconds} seconds"
    elsif hours == 0
      return "#{minutes} minutes"
    elsif days == 0
      return "#{hours} hours"
    else
      return "#{days} days"
    end
  end

  def calculate_lucidity
    lucidity_rating = 0
    lucidity_rating += 1 if self.consciousness_clarity?
    lucidity_rating += 1 if self.dream_state_clarity?
    lucidity_rating += 1 if self.decision_clarity?
    return lucidity_rating
  end

end