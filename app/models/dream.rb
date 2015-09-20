class Dream < ActiveRecord::Base
  belongs_to :dreamer
  has_many :comments
  has_many :favorites

  validates_presence_of :story, :title

  def favorite_by(dreamer)
    Favorite.where(dream: self, fan: dreamer)
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

end