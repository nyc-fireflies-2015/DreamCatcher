class Step < ActiveRecord::Base
  has_many :recipes
  has_many :dreamers, through: :recipes
  belongs_to :creator, class_name: "Dreamer"

  def self.default
    where(default: true)
  end

  def self.top
    order('recipes_count DESC').limit(10)
  end

end
