class DropJoinTableDreamsHashtags < ActiveRecord::Migration
  def change
    drop_table :dreams_hashtags
  end
end
