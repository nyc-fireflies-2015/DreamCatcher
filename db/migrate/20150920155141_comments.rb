class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false, limit: 2048
      t.references :dreamer
      t.references :dream

      t.timestamps null: false
    end
  end
end
