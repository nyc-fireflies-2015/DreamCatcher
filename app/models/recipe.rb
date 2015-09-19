class Recipe < ActiveRecord::Base
  belongs_to :creator, class_name: 'Dreamer'
  has_many :steps
  def self.default
    new(name: "My Recipe", steps: Step.default)
  end
end
