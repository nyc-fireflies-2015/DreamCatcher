class AddFavoritesCountToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :favorites_count, :integer
  end
end
