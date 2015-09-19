class Recipe < ActiveRecord::Base
  belongs_to :creator, class_name: 'Dreamer'
  has_many :steps
end
