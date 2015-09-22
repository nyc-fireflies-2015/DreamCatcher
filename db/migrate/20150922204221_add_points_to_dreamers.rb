class AddPointsToDreamers < ActiveRecord::Migration
  def change
    add_column :dreamers, :points, :integer, default: 0
  end
end
