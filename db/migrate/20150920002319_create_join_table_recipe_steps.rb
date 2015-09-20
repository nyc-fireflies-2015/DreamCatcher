class CreateJoinTableRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipes_steps do |t|
      t.references :recipe
      t.references :step
      t.timestamps null:false
    end
  end
end
