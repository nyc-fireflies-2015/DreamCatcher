class PrepareRecipeToBecomeJoinTable < ActiveRecord::Migration
  def change
    remove_column :recipes, :name
    add_reference :recipes, :dreamer
    add_reference :recipes, :step
  end
end
