class MoveDreamsCountcolumnToTaggingsTable < ActiveRecord::Migration
  def change
    remove_column :hashtags, :dreams_count
    add_column :taggings, :dreams_count, :integer, default: 0
  end
end
