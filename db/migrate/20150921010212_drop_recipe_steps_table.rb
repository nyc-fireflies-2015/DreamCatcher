class DropRecipeStepsTable < ActiveRecord::Migration
  def change
    drop_table :recipes_steps
  end
end
