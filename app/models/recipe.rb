class Recipe < ActiveRecord::Base
  belongs_to :dreamer
  has_many :steps
end
