class Step < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  belongs_to :creator, class_name: "Dreamer"
  def self.default
    where(default: true)
  end
  def self.top
    order('recipes_count DESC').limit(10)
  end
end
