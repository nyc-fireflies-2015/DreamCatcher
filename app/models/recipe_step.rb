class RecipeStep < ActiveRecord::Base
  belongs_to :step, counter_cache: true
  belongs_to :recipe
end
