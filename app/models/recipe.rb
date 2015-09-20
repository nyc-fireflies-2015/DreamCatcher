class Recipe < ActiveRecord::Base
  belongs_to :creator, class_name: 'Dreamer'
  has_and_belongs_to_many :steps, counter_cache: true
  def self.default
    new(name: "My Recipe", steps: Step.default)
  end
end
