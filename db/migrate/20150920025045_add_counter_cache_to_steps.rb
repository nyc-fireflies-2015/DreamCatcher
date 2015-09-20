class AddCounterCacheToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :recipes_steps_count, :integer, default: 0
  end
end
