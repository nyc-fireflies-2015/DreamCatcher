class Steps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :description, null: false, limit: 2048
      t.references :recipe

      t.timestamps null: false
    end
  end
end
