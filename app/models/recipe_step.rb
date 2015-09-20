class RecipeStep < ActiveRecord::Base
  belongs_to :step
  belongs_to :recipe
end
