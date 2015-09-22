class RemoveLevelFromDreamers < ActiveRecord::Migration
  def change
    remove_column :dreamers, :level, :integer
  end
end
