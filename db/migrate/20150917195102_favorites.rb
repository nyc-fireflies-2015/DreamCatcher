class Favorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :dream
      t.references :fan

      t.timestamps null: false
    end
  end
end
