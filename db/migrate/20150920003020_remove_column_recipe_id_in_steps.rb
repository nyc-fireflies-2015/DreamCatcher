class RemoveColumnRecipeIdInSteps < ActiveRecord::Migration
  def change
    remove_column :steps, :recipe_id
  end
end
