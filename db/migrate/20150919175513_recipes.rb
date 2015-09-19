class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false, limit: 512
      t.references :creator

      t.timestamps null: false
    end
  end
end
