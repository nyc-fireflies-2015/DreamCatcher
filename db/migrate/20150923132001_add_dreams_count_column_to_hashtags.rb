class AddDreamsCountColumnToHashtags < ActiveRecord::Migration
  def change
    add_column :hashtags, :dreams_count, :integer, default: 0
  end
end
