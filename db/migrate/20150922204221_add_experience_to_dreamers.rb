class AddExperienceToDreamers < ActiveRecord::Migration
  def change
    add_column :dreamers, :experience, :integer, default: 0
  end
end
