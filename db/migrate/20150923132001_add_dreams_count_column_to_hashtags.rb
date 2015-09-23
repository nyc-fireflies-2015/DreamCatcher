class AddDreamsCountColumnToHashtags < ActiveRecord::Migration
  def change
    add_column :hashtags, :dreams_count, :integer, default: true
  end
end
