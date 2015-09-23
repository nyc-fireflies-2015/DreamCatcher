class Dreamers < ActiveRecord::Migration
  def change
    create_table :dreamers do |t|
      t.string :username, null: false, limit: 64
      t.string :password_digest, null: false
      t.string :name
      t.text :about, limit: 1024
      t.text :recipe, limit: 2048
      t.integer :level, default: 0
      t.string :zipcode
      t.string :phone_num
      t.boolean :reality_check, default: false

      t.timestamps null: false
    end
  end
end
