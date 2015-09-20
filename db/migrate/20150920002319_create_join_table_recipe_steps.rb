class CreateJoinTableRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipes_steps do |t|
      t.references :recipes
      t.references :steps
      t.timestamps null:false
    end
  end
end
