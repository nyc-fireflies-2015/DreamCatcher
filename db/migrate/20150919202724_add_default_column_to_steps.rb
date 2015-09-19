class AddDefaultColumnToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :default, :boolean, default: false
  end
end
