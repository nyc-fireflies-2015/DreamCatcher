class RemoveRecipeColumnFromDreamers < ActiveRecord::Migration
  def change
    remove_column :dreamers, :recipe, :text, limit: 2048
  end
end
