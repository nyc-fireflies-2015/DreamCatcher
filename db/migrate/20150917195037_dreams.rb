class Dreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.text :story, null: false, limit: 8192
      t.boolean :decision_clarity, default: false
      t.boolean :consciousness_clarity, default: false
      t.boolean :dream_state_clarity, default: false
      t.integer :lucidity_rating, default: 0
      t.integer :favorites_count, default: 0
      t.references :dreamer

      t.timestamps null: false
    end
  end
end
