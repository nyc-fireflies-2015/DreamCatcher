class AddColumnTitleToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :title, :string, limit: 128
  end
end
