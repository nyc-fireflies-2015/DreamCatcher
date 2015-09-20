class Step < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  belongs_to :creator, class_name: "Dreamer"
  def self.default
    where(default: true)
  end
  def self.top
    order('recipes_count DESC').limit(10)
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
