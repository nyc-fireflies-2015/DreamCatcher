class Recipe < ActiveRecord::Base
  belongs_to :step
  belongs_to :dreamer
end
